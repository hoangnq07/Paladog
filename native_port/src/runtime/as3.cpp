#include "as3.h"

#include <SDL.h>

#include <algorithm>
#include <cstdio>
#include <cstring>
#include <map>

namespace as3 {

static uint32_t gOrigin = 0;

static int gVirtualMs = -1;  // >= 0: deterministic clock (--fast tests)
void setVirtualTimer(int ms) { gVirtualMs = ms; }
void setTimerOrigin() { gOrigin = SDL_GetTicks(); }
int getTimer() { return gVirtualMs >= 0 ? gVirtualMs : static_cast<int>(SDL_GetTicks() - gOrigin); }

std::string str(double v) {
    if (std::isnan(v)) return "NaN";
    if (std::isinf(v)) return v < 0 ? "-Infinity" : "Infinity";
    if (v == std::floor(v) && std::fabs(v) < 1e21) {
        char buf[64];
        std::snprintf(buf, sizeof buf, "%.0f", v);
        return buf;
    }
    char buf[64];
    for (int prec = 1; prec <= 17; ++prec) {
        std::snprintf(buf, sizeof buf, "%.*g", prec, v);
        if (std::strtod(buf, nullptr) == v) break;
    }
    return buf;
}

// Decode UTF-8 into UTF-16 code units.
static std::u16string toU16(const std::string& s) {
    std::u16string out;
    out.reserve(s.size());
    for (size_t i = 0; i < s.size();) {
        const unsigned char c = static_cast<unsigned char>(s[i]);
        uint32_t cp;
        int n;
        if (c < 0x80) { cp = c; n = 1; }
        else if ((c >> 5) == 6 && i + 1 < s.size()) { cp = ((c & 0x1F) << 6) | (s[i + 1] & 0x3F); n = 2; }
        else if ((c >> 4) == 14 && i + 2 < s.size()) { cp = ((c & 0x0F) << 12) | ((s[i + 1] & 0x3F) << 6) | (s[i + 2] & 0x3F); n = 3; }
        else if ((c >> 3) == 30 && i + 3 < s.size()) {
            cp = ((c & 0x07) << 18) | ((s[i + 1] & 0x3F) << 12) | ((s[i + 2] & 0x3F) << 6) | (s[i + 3] & 0x3F);
            n = 4;
        } else { cp = c; n = 1; }
        i += static_cast<size_t>(n);
        if (cp >= 0x10000) {
            cp -= 0x10000;
            out.push_back(static_cast<char16_t>(0xD800 + (cp >> 10)));
            out.push_back(static_cast<char16_t>(0xDC00 + (cp & 0x3FF)));
        } else {
            out.push_back(static_cast<char16_t>(cp));
        }
    }
    return out;
}

static std::string fromU16(const std::u16string& u) {
    std::string out;
    for (size_t i = 0; i < u.size(); ++i) {
        uint32_t cp = u[i];
        if (cp >= 0xD800 && cp < 0xDC00 && i + 1 < u.size()) {
            cp = 0x10000 + ((cp - 0xD800) << 10) + (u[i + 1] - 0xDC00);
            ++i;
        }
        if (cp < 0x80) out.push_back(static_cast<char>(cp));
        else if (cp < 0x800) { out.push_back(static_cast<char>(0xC0 | (cp >> 6))); out.push_back(static_cast<char>(0x80 | (cp & 0x3F))); }
        else if (cp < 0x10000) {
            out.push_back(static_cast<char>(0xE0 | (cp >> 12)));
            out.push_back(static_cast<char>(0x80 | ((cp >> 6) & 0x3F)));
            out.push_back(static_cast<char>(0x80 | (cp & 0x3F)));
        } else {
            out.push_back(static_cast<char>(0xF0 | (cp >> 18)));
            out.push_back(static_cast<char>(0x80 | ((cp >> 12) & 0x3F)));
            out.push_back(static_cast<char>(0x80 | ((cp >> 6) & 0x3F)));
            out.push_back(static_cast<char>(0x80 | (cp & 0x3F)));
        }
    }
    return out;
}

int strLength(const std::string& s) {
    bool ascii = true;
    for (unsigned char c : s) if (c >= 0x80) { ascii = false; break; }
    return ascii ? static_cast<int>(s.size()) : static_cast<int>(toU16(s).size());
}

double charCodeAt(const std::string& s, int idx) {
    const std::u16string u = toU16(s);
    if (idx < 0 || static_cast<size_t>(idx) >= u.size()) return NAN;
    return u[static_cast<size_t>(idx)];
}

std::string substr(const std::string& s, int start, int len) {
    const std::u16string u = toU16(s);
    const int n = static_cast<int>(u.size());
    if (start < 0) start = std::max(0, n + start);
    if (start > n) start = n;
    if (len < 0) len = 0;
    const int end = static_cast<int>(std::min<long long>(n, static_cast<long long>(start) + len));
    return fromU16(u.substr(static_cast<size_t>(start), static_cast<size_t>(end - start)));
}

std::string substring(const std::string& s, int from, int to) {
    const std::u16string u = toU16(s);
    const int n = static_cast<int>(u.size());
    from = std::clamp(from, 0, n);
    to = std::clamp(to, 0, n);
    if (from > to) std::swap(from, to);
    return fromU16(u.substr(static_cast<size_t>(from), static_cast<size_t>(to - from)));
}

double strToNum(const std::string& s) {
    if (s.empty()) return 0.0;
    char* end = nullptr;
    const double v = std::strtod(s.c_str(), &end);
    while (end && *end == ' ') ++end;
    return (end && *end == '\0') ? v : NAN;
}

int strToInt(const std::string& s) { return flash::toInt(strToNum(s)); }

// ------------------------------------------------------------------ Value
double Value::num() const {
    switch (t) {
        case Bool: return b ? 1.0 : 0.0;
        case Int: return i;
        case Num: return d;
        case Null: return 0.0;
        case Str: return strToNum(*static_cast<std::string*>(ref.get()));
        default: return NAN;
    }
}

bool Value::b_() const {
    switch (t) {
        case Bool: return b;
        case Int: return i != 0;
        case Num: return d != 0.0 && !std::isnan(d);
        case Str: return !static_cast<std::string*>(ref.get())->empty();
        case Arr: case Obj: return true;
        default: return false;
    }
}

std::string Value::s() const {
    switch (t) {
        case Bool: return b ? "true" : "false";
        case Int: return std::to_string(i);
        case Num: return str(d);
        case Str: return *static_cast<std::string*>(ref.get());
        case Null: return "null";
        case Undef: return "undefined";
        default: return "[object]";
    }
}

Value& Value::assignNum(double v) {
    if (v == std::floor(v) && std::fabs(v) < 2147483647.0) {
        t = Int;
        i = static_cast<int>(v);
    } else {
        t = Num;
        d = v;
    }
    ref.reset();
    return *this;
}

bool eq(const Value& a, const Value& b) {
    if (a.isNull() || b.isNull()) return a.isNull() && b.isNull();
    if (a.t == Value::Str && b.t == Value::Str) return a.s() == b.s();
    if (a.t == Value::Arr || b.t == Value::Arr) return a.t == b.t && a.ref == b.ref;
    if (a.t == Value::Obj || b.t == Value::Obj) return a.t == b.t && a.p == b.p;
    return a.num() == b.num();
}

// ------------------------------------------------------------ SharedObject
static std::string gSaveDir = ".";
static std::map<std::string, std::unique_ptr<SharedObject>> gShared;

void setSaveDir(const std::string& dir) {
    gSaveDir = dir.empty() ? "." : dir;
    gShared.clear();
}

static std::string savePath(const std::string& name) { return gSaveDir + "/" + name + ".sol"; }

SharedObject* SharedObject::getLocal(const std::string& name) {
    auto it = gShared.find(name);
    if (it != gShared.end()) return it->second.get();
    auto so = std::make_unique<SharedObject>();
    so->name = name;
    if (FILE* f = std::fopen(savePath(name).c_str(), "rb")) {
        auto* ba = new ByteArray();
        std::fseek(f, 0, SEEK_END);
        const long n = std::ftell(f);
        std::fseek(f, 0, SEEK_SET);
        if (n > 0) {
            ba->data.resize(static_cast<size_t>(n));
            if (std::fread(ba->data.data(), 1, ba->data.size(), f) != ba->data.size()) ba->data.clear();
        }
        std::fclose(f);
        so->data[0] = ba;
    }
    SharedObject* raw = so.get();
    gShared[name] = std::move(so);
    return raw;
}

int SharedObject::size() const {
    const Value v = data.get(0);
    const ByteArray* ba = v.as<ByteArray>();
    return ba ? ba->length() : 0;
}

void SharedObject::clear() {
    data = Array::make();
    std::remove(savePath(name).c_str());
}

void SharedObject::flush() {
    const Value v = data.get(0);
    const ByteArray* ba = v.as<ByteArray>();
    if (!ba) return;
    if (FILE* f = std::fopen(savePath(name).c_str(), "wb")) {
        std::fwrite(ba->data.data(), 1, ba->data.size(), f);
        std::fclose(f);
    }
}

} // namespace as3
