// Minimal ActionScript 3 runtime used by the transpiled game code
// (native_port/tools/as3cpp.py output in src/gen/).
//
// Typed values (int / Number / Boolean / String / class pointers) map to plain
// C++ types. Only Array elements are dynamic (as3::Value), exactly like in AS3.
#pragma once

#include <cmath>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <memory>
#include <string>
#include <type_traits>
#include <vector>

#include "../engine/flash.h"

namespace as3 {

int getTimer();
void setTimerOrigin();
void setVirtualTimer(int ms);

// ---------------------------------------------------------------- strings
std::string str(double v);
inline std::string str(int v) { return std::to_string(v); }
inline std::string str(bool v) { return v ? "true" : "false"; }
inline std::string str(const std::string& s) { return s; }
inline std::string str(const char* s) { return s ? s : ""; }
int strLength(const std::string& s);                  // UTF-16 length (BMP assumed)
double charCodeAt(const std::string& s, int idx);     // NaN when out of range
std::string substr(const std::string& s, int start, int len = 0x7fffffff);
std::string substring(const std::string& s, int from, int to = 0x7fffffff);
double strToNum(const std::string& s);
int strToInt(const std::string& s);

// ---------------------------------------------------------------- numbers
inline bool truthy(double v) { return v != 0.0 && !std::isnan(v); }
inline int imod(int a, int b) { return b == 0 ? 0 : (b == -1 ? 0 : a % b); }
inline int ushr(int a, int b) { return static_cast<int>(static_cast<uint32_t>(a) >> (b & 31)); }
inline int shl(int a, int b) { return static_cast<int>(static_cast<uint32_t>(a) << (b & 31)); }
inline int shr(int a, int b) { return a >> (b & 31); }

// ----------------------------------------------------------------- Value
struct ArrayObj;
class Array;

struct Value {
    enum Tag : uint8_t { Undef, Null, Bool, Int, Num, Str, Arr, Obj };
    Tag t = Undef;
    union {
        bool b;
        int i;
        double d;
        void* p;
    };
    std::shared_ptr<void> ref;  // Str: std::string, Arr: ArrayObj

    Value() : d(0) {}
    Value(std::nullptr_t) : t(Null), d(0) {}
    Value(bool v) : t(Bool), d(0) { b = v; }
    Value(int v) : t(Int), d(0) { i = v; }
    Value(double v) : t(Num), d(v) {}
    Value(const std::string& s) : t(Str), d(0), ref(std::make_shared<std::string>(s)) {}
    Value(const char* s) : Value(std::string(s ? s : "")) {}
    Value(const Array& a);
    template <class T, class = typename std::enable_if<std::is_class<T>::value>::type>
    Value(T* ptr) : t(ptr ? Obj : Null), d(0) { p = static_cast<void*>(ptr); }

    double num() const;
    int i32() const { return flash::toInt(num()); }
    bool b_() const;
    std::string s() const;
    Array arr() const;
    template <class T>
    T* as() const { return t == Obj ? static_cast<T*>(p) : nullptr; }
    bool isNull() const { return t == Undef || t == Null; }
    int length() const;
    Value& operator[](int idx);
    Value get(int idx) const;

    Value& operator+=(double v) { return assignNum(num() + v); }
    Value& operator-=(double v) { return assignNum(num() - v); }
    Value& operator*=(double v) { return assignNum(num() * v); }
    Value& operator/=(double v) { return assignNum(num() / v); }
    Value& operator++() { return assignNum(num() + 1); }
    Value& operator--() { return assignNum(num() - 1); }
    Value operator++(int) { Value old = *this; assignNum(num() + 1); return old; }
    Value operator--(int) { Value old = *this; assignNum(num() - 1); return old; }

private:
    Value& assignNum(double v);
};

bool eq(const Value& a, const Value& b);
inline bool operator==(const Value& a, const Value& b) { return eq(a, b); }
inline bool operator!=(const Value& a, const Value& b) { return !eq(a, b); }
inline bool operator<(const Value& a, const Value& b) { return a.num() < b.num(); }
inline bool operator>(const Value& a, const Value& b) { return a.num() > b.num(); }
inline bool operator<=(const Value& a, const Value& b) { return a.num() <= b.num(); }
inline bool operator>=(const Value& a, const Value& b) { return a.num() >= b.num(); }

// ----------------------------------------------------------------- Array
struct ArrayObj {
    std::vector<Value> v;
};

class Array {
public:
    Array() = default;
    Array(std::nullptr_t) {}
    explicit Array(std::shared_ptr<ArrayObj> p) : p_(std::move(p)) {}

    static Array make(int length = 0) {
        auto o = std::make_shared<ArrayObj>();
        if (length > 0) o->v.resize(static_cast<size_t>(length));
        return Array(std::move(o));
    }
    static Array of(std::initializer_list<Value> items) {
        auto o = std::make_shared<ArrayObj>();
        o->v.assign(items.begin(), items.end());
        return Array(std::move(o));
    }

    Value& operator[](int idx) {
        if (idx < 0) {
            static Value dummy;
            dummy = Value();
            return dummy;
        }
        auto& v = p_->v;
        if (static_cast<size_t>(idx) >= v.size()) v.resize(static_cast<size_t>(idx) + 1);
        return v[static_cast<size_t>(idx)];
    }
    // Read access that never grows the array (AS3 returns undefined).
    Value get(int idx) const {
        if (!p_ || idx < 0 || static_cast<size_t>(idx) >= p_->v.size()) return Value();
        return p_->v[static_cast<size_t>(idx)];
    }
    int length() const { return p_ ? static_cast<int>(p_->v.size()) : 0; }
    void setLength(int n) { if (p_) p_->v.resize(static_cast<size_t>(n < 0 ? 0 : n)); }
    bool operator==(std::nullptr_t) const { return !p_; }
    bool operator!=(std::nullptr_t) const { return static_cast<bool>(p_); }
    bool operator==(const Array& o) const { return p_ == o.p_; }
    bool operator!=(const Array& o) const { return p_ != o.p_; }
    explicit operator bool() const { return static_cast<bool>(p_); }
    const std::shared_ptr<ArrayObj>& ptr() const { return p_; }

private:
    std::shared_ptr<ArrayObj> p_;
};

inline Value::Value(const Array& a) : t(a ? Arr : Null), d(0), ref(a.ptr()) {}
inline Array Value::arr() const {
    return t == Arr ? Array(std::static_pointer_cast<ArrayObj>(ref)) : Array();
}
inline Value& Value::operator[](int idx) {
    static Value dummy;
    if (t != Arr) {
        dummy = Value();
        return dummy;
    }
    Array a = arr();
    return a[idx];
}
inline int Value::length() const { return arr().length(); }
inline Value Value::get(int idx) const { return arr().get(idx); }

inline std::string str(const Value& v) { return v.s(); }

// ----------------------------------------------------------------- misc
// Opaque stand-ins for Flash display/network classes the native port never uses.
struct Opaque {};
struct URLRequest {
    std::string url;
    URLRequest() = default;
    explicit URLRequest(const std::string& u) : url(u) {}
};
inline void navigateToURL(URLRequest*) {}

// flash.utils.ByteArray (subset used by the data loaders / save files).
struct ByteArray {
    std::vector<uint8_t> data;
    int position = 0;
    int length() const { return static_cast<int>(data.size()); }
    int operator[](int idx) const {
        return (idx >= 0 && static_cast<size_t>(idx) < data.size()) ? data[static_cast<size_t>(idx)] : 0;
    }
    // Write access grows the buffer like AS3 does.
    uint8_t& at(int idx) {
        static uint8_t dummy;
        if (idx < 0) { dummy = 0; return dummy; }
        if (static_cast<size_t>(idx) >= data.size()) data.resize(static_cast<size_t>(idx) + 1);
        return data[static_cast<size_t>(idx)];
    }
    std::string toString() const { return std::string(data.begin(), data.end()); }
    void uncompress() {}  // assets are stored decompressed
};

// flash.net.SharedObject replacement: one file per name in the save directory.
// data[0] holds a ByteArray* (exactly how Library.saveFile/loadFile use it).
void setSaveDir(const std::string& dir);
struct SharedObject {
    std::string name;
    Array data = Array::make();
    static SharedObject* getLocal(const std::string& name);
    int size() const;
    void clear();
    void flush();
};

} // namespace as3
