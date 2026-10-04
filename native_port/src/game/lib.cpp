// Port of Library.as. Line references in comments point to the decompiled
// extracted/scripts/.../Library.as so behaviour can be cross-checked.
#include "lib.h"
#include "ui_overlay.h"

#include <SDL.h>
#include <SDL_image.h>

#include <algorithm>
#include <cmath>
#include <cstdio>
#include <cstring>
#include <random>

#include "../engine/audio.h"
#include "../engine/gfx.h"
#include "../engine/text.h"
#include "../generated/constants.h"
#include "../gen/classes.h"

using flash::Blend;
using flash::Matrix;
using flash::Tint;
using flash::toInt;

namespace {

constexpr double kPI = 3.141592653589793;

bool readWholeFile(const std::string& path, std::vector<uint8_t>& out) {
    SDL_RWops* rw = SDL_RWFromFile(path.c_str(), "rb");
    if (!rw) return false;
    const Sint64 size = SDL_RWsize(rw);
    if (size < 0) {
        SDL_RWclose(rw);
        return false;
    }
    out.resize(static_cast<size_t>(size));
    size_t got = 0;
    while (got < out.size()) {
        const size_t n = SDL_RWread(rw, out.data() + got, 1, out.size() - got);
        if (n == 0) break;
        got += n;
    }
    SDL_RWclose(rw);
    out.resize(got);
    return true;
}

// Library.readInt32Len (little endian).
int readInt32Len(const std::vector<uint8_t>& b, size_t pos) {
    if (pos + 4 > b.size()) return 0;
    return static_cast<int>(static_cast<uint32_t>(b[pos]) | (static_cast<uint32_t>(b[pos + 1]) << 8) |
                            (static_cast<uint32_t>(b[pos + 2]) << 16) | (static_cast<uint32_t>(b[pos + 3]) << 24));
}

SDL_Surface* loadArgb(const std::string& path) {
    SDL_Surface* s = IMG_Load(path.c_str());
    if (!s) {
        SDL_Log("IMG_Load(%s): %s", path.c_str(), IMG_GetError());
        return nullptr;
    }
    if (s->format->format != SDL_PIXELFORMAT_ARGB8888) {
        SDL_Surface* c = SDL_ConvertSurfaceFormat(s, SDL_PIXELFORMAT_ARGB8888, 0);
        SDL_FreeSurface(s);
        s = c;
    }
    return s;
}

SDL_Surface* extract(SDL_Surface* atlas, int x, int y, int w, int h) {
    SDL_Surface* sub = SDL_CreateRGBSurfaceWithFormat(0, std::max(1, w), std::max(1, h), 32, SDL_PIXELFORMAT_ARGB8888);
    if (!sub) return nullptr;
    SDL_FillRect(sub, nullptr, 0);
    if (atlas && w > 0 && h > 0) {
        SDL_SetSurfaceBlendMode(atlas, SDL_BLENDMODE_NONE);
        SDL_Rect src{x, y, w, h};
        SDL_BlitSurface(atlas, &src, sub, nullptr);
    }
    return sub;
}

std::mt19937& rng() {
    static std::mt19937 g{std::random_device{}()};
    return g;
}

} // namespace

Lib::Lib(Drawing* d, Gfx* gfx, Audio* audio, TextCache* text, std::string assetDir)
    : draw(d), gfx_(gfx), audio_(audio), text_(text), assetDir_(std::move(assetDir)) {
    initGenFields();
    // Library() constructor (line 1987).
    nEffectChannelPos = 0;
    bPlayingSndEff.assign(kLibrary::MAXSIZE_SNDEFFECT, false);
    nSndEffStartTime.assign(kLibrary::MAXSIZE_SNDEFFECT, kDrawing::INITDATA);
    MUSICCHANNEL.assign(kLibrary::MAXSIZE_MUSICCHANNEL, false);
    EFFECTCHANNEL.assign(kLibrary::MAXSIZE_EFFECTCHANNEL, false);
    IMAGE.resize(kLibrary::MAXSIZE_IMG);
    embedTex_.fill(-1);
    startTicks_ = SDL_GetTicks();
}

Lib::~Lib() {
    for (int i = 0; i < static_cast<int>(IMAGE.size()); ++i) freeImg(i);
    for (int t : embedTex_) gfx_->destroyTexture(t);
    for (SDL_Surface*& s : cachedAtlas_) {
        if (s) SDL_FreeSurface(s);
        s = nullptr;
    }
}

// ---------------------------------------------------------------------------
// Layout (line 2008)
// ---------------------------------------------------------------------------
int Lib::getHorAlign(int w, int anchor) {
    if ((anchor & 0xF0) == 32) return w;
    if ((anchor & 0xF0) == 48) return w >> 1;
    return 0;
}

int Lib::getVerAlign(int h, int anchor) {
    if ((anchor & 0x0F) == 2) return h;
    if ((anchor & 0x0F) == 3) return h >> 1;
    return 0;
}

// ---------------------------------------------------------------------------
// Fills (line 2034)
// ---------------------------------------------------------------------------
void Lib::fillRect(int x, int y, int w, int h, int rgb, int anchor) {
    x -= getHorAlign(w, anchor);
    y -= getVerAlign(h, anchor);
    gfx_->fillRect(x, y, w, h, static_cast<uint32_t>(rgb) & 0xFFFFFF, 1.0);
}

void Lib::fillRectAlpha(int x, int y, int w, int h, int rgb, int alpha, int anchor) {
    x -= getHorAlign(w, anchor);
    y -= getVerAlign(h, anchor);
    gfx_->fillRect(x, y, w, h, static_cast<uint32_t>(rgb) & 0xFFFFFF, alpha / 100.0);
}

void Lib::gradationH(int x, int y, int w, int h, int c1, int c2, int anchor) {
    const int r1 = (c1 & 0xFF0000) >> 16, g1 = (c1 & 0xFF00) >> 8, b1 = c1 & 0xFF;
    const int r2 = (c2 & 0xFF0000) >> 16, g2 = (c2 & 0xFF00) >> 8, b2 = c2 & 0xFF;
    for (int i = 0; i < w; ++i) {
        const int r = toInt(static_cast<double>(r2 - r1) * i / w + r1);
        const int g = toInt(static_cast<double>(g2 - g1) * i / w + g1);
        const int b = toInt(static_cast<double>(b2 - b1) * i / w + b1);
        fillRect(x + i, y, 1, h, (r << 16) + (g << 8) + b, anchor);
    }
}

void Lib::gradationHAlpha(int x, int y, int w, int h, int rgb, int alpha, int anchor) {
    for (int i = 0; i < w; ++i) fillRectAlpha(x + i, y, 1, h, rgb, toInt(static_cast<double>(alpha) * i / w), anchor);
}

void Lib::gradationV(int x, int y, int w, int h, int c1, int c2, int anchor) {
    const int r1 = (c1 & 0xFF0000) >> 16, g1 = (c1 & 0xFF00) >> 8, b1 = c1 & 0xFF;
    const int r2 = (c2 & 0xFF0000) >> 16, g2 = (c2 & 0xFF00) >> 8, b2 = c2 & 0xFF;
    for (int i = 0; i < h; ++i) {
        const int r = toInt(static_cast<double>(r2 - r1) * i / h + r1);
        const int g = toInt(static_cast<double>(g2 - g1) * i / h + g1);
        const int b = toInt(static_cast<double>(b2 - b1) * i / h + b1);
        fillRect(x, y + i, w, 1, (r << 16) + (g << 8) + b, anchor);
    }
}

// ---------------------------------------------------------------------------
// Resources
// ---------------------------------------------------------------------------
void Lib::loadEmbedImg() {
    for (int i = 0; i < 3; ++i) {
        const std::string path = assetDir_ + "embed/logo_" + std::to_string(i) + ".png";
        SDL_Surface* s = loadArgb(path);
        if (!s) continue;
        embedTex_[kDrawing::imgLogo + i] = gfx_->createTexture(s);
        embedW_[kDrawing::imgLogo + i] = s->w;
        embedH_[kDrawing::imgLogo + i] = s->h;
        SDL_FreeSurface(s);
    }
}

SDL_Surface* Lib::atlasSurface(int fdat) {
    for (int i = 0; i < 2; ++i)
        if (cachedAtlasId_[i] == fdat && cachedAtlas_[i]) return cachedAtlas_[i];
    std::string path = assetDir_ + "atlases/fdat_" + std::to_string(fdat);
    std::vector<uint8_t> dummy;
    if (readWholeFile(path + "_handheld.png", dummy)) {
        path += "_handheld";
    }
    SDL_Surface* s = loadArgb(path + ".png");
    if (!s) return nullptr;
    const int slot = cachedAtlasNext_;
    cachedAtlasNext_ = (cachedAtlasNext_ + 1) % 2;
    if (cachedAtlas_[slot]) SDL_FreeSurface(cachedAtlas_[slot]);
    cachedAtlas_[slot] = s;
    cachedAtlasId_[slot] = fdat;
    return s;
}

// Library.loadImgFlashDat + fbyteLoadDone (lines 3905-4003). Loading is
// synchronous here, so bLoading never stays set across frames.
void Lib::loadImgFlashDat(int fdat, int base) {
    if (bLoading) return;
    if (base < 0 || base >= static_cast<int>(IMAGE.size())) {
        ++draw->nMainScene;
        return;
    }
    if (IMAGE[base].tex != -1) {
        ++draw->nMainScene;
        return;
    }
    std::vector<uint8_t> txt;
    const std::string stem = assetDir_ + "atlases/fdat_" + std::to_string(fdat);
    if (!readWholeFile(stem + ".txt", txt)) {
        SDL_Log("missing %s.txt", stem.c_str());
        ++draw->nMainScene;
        return;
    }
    txt.push_back(0);
    const char* p = reinterpret_cast<const char*>(txt.data());
    int count = 0, used = 0;
    if (std::sscanf(p, "%d%n", &count, &used) != 1) count = 0;
    p += used;

    SDL_Surface* atlas = atlasSurface(fdat);
    for (int i = 0; i < count; ++i) {
        int ax, ay, ow, oh, nx, ny, nw, nh;
        if (std::sscanf(p, "%d %d %d %d %d %d %d %d%n", &ax, &ay, &ow, &oh, &nx, &ny, &nw, &nh, &used) != 8) break;
        p += used;
        const int idx = base + i;
        if (idx >= static_cast<int>(IMAGE.size())) break;
        freeImg(idx);
        BmpImage& im = IMAGE[idx];
        im.nOrgW = ow;
        im.nOrgH = oh;
        im.nX = nx;
        im.nY = ny;
        im.nW = nw;
        im.nH = nh;
        im.fdat = static_cast<int16_t>(fdat);
        im.ax = ax;
        im.ay = ay;
        SDL_Surface* sub = extract(atlas, ax, ay, nw, nh);
        if (sub) {
            im.tex = gfx_->createTexture(sub);
            SDL_FreeSurface(sub);
        }
    }
    ++draw->nMainScene;
}

void Lib::freeImg(int index) {
    if (index < 0 || index >= static_cast<int>(IMAGE.size())) return;
    BmpImage& im = IMAGE[index];
    if (im.tex >= 0) gfx_->destroyTexture(im.tex);
    for (int& t : im.tinted) {
        if (t >= 0) gfx_->destroyTexture(t);
        t = -1;
    }
    im.tex = -1;
}

int Lib::texFor(int idx, Tint tint) {
    if (idx < 0 || idx >= static_cast<int>(IMAGE.size())) return -1;
    BmpImage& im = IMAGE[idx];
    if (im.tex < 0 || tint == Tint::None) return im.tex;
    int& t = im.tinted[static_cast<size_t>(tint)];
    if (t >= 0) return t;
    SDL_Surface* atlas = atlasSurface(im.fdat);
    if (!atlas) return im.tex;
    SDL_Surface* sub = extract(atlas, im.ax, im.ay, im.nW, im.nH);
    if (!sub) return im.tex;
    Gfx::applyTint(sub, tint);
    t = gfx_->createTexture(sub);
    SDL_FreeSurface(sub);
    return t >= 0 ? t : im.tex;
}

// Library.loadASEAni + aseAniLoadDone (lines 3425-3505).
void Lib::loadASEAni(int embedAni, int aseIndex, int imgIndex) {
    if (bLoading) return;
    std::vector<uint8_t> b;
    const std::string path = assetDir_ + "anim/ani_" + std::to_string(embedAni) + ".bin";
    if (!readWholeFile(path, b)) {
        SDL_Log("missing %s", path.c_str());
        ++draw->nMainScene;
        return;
    }
    if (aseIndex >= static_cast<int>(draw->ASEANI.size())) draw->ASEANI.resize(aseIndex + 1);
    ASEData& d = draw->ASEANI[aseIndex];
    d = ASEData{};
    d.nImgIndex = imgIndex;
    size_t pos = 0;
    auto rd = [&]() {
        const int v = ::readInt32Len(b, pos);
        pos += 4;
        return v;
    };
    rd();  // unused header int
    d.nFileVersion = rd();
    d.nTotalAni = std::max(0, rd());
    d.ANI.resize(d.nTotalAni);
    for (int a = 0; a < d.nTotalAni && pos < b.size(); ++a) {
        const int nObj = std::max(0, rd());
        d.ANI[a].resize(nObj);
        for (int o = 0; o < nObj; ++o) {
            const int nKey = std::max(0, rd());
            d.ANI[a][o].resize(nKey);
            for (int k = 0; k < nKey; ++k) {
                const int nVal = std::max(0, rd());
                d.ANI[a][o][k].resize(nVal);
                for (int v = 0; v < nVal; ++v) d.ANI[a][o][k][v] = rd();
            }
        }
    }
    setASEDrawAni(aseIndex, kLibrary::ANI_SMOOTHLEVEL);
    bLoading = false;
    ++draw->nMainScene;
}

// Library.setASEDrawAni (line 3507): keyframe interpolation + per-frame z sort.
void Lib::setASEDrawAni(int a, int p) {
    ASEData& d = draw->ASEANI[a];
    d.DRAWANI.assign(d.nTotalAni, {});
    for (int i = 0; i < d.nTotalAni; ++i) {
        const int nObj = static_cast<int>(d.ANI[i].size());
        d.DRAWANI[i].resize(nObj);
        for (int o = 0; o < nObj; ++o) {
            const int nFrames = (static_cast<int>(d.ANI[i][o].size()) - 1) * p;
            d.DRAWANI[i][o].resize(std::max(0, nFrames));
        }
    }

    auto val = [&](int i, int o, int k, int field) -> int {
        const auto& keys = d.ANI[i][o];
        if (k < 0 || k >= static_cast<int>(keys.size())) return 0;
        const auto& rec = keys[k];
        return field < static_cast<int>(rec.size()) ? rec[field] : 0;
    };
    // int(A + (B - A) / p * (s + 1))
    auto lerpOuter = [&](int A, int B, int s) { return toInt(A + static_cast<double>(B - A) / p * (s + 1)); };

    for (int i = 0; i < static_cast<int>(d.ANI.size()); ++i) {
        if (d.ANI[i].empty()) continue;
        const int nKey = static_cast<int>(d.ANI[i][0].size()) - 1;
        for (int k = 0; k < nKey; ++k) {
            for (int o = 0; o < static_cast<int>(d.ANI[i].size()); ++o) {
                auto& frames = d.DRAWANI[i][o];
                for (int s = 0; s < p; ++s) {
                    const int f = k * p + s;
                    if (f >= static_cast<int>(frames.size())) continue;
                    ASEFrame& F = frames[f];
                    const bool mid = s < p - 1;
                    F[ANIVALUE_IMGINDEX] = val(i, o, k + 1, ANIVALUE_IMGINDEX);
                    {
                        const int A = val(i, o, k, ANIVALUE_POSX), B = val(i, o, k + 1, ANIVALUE_POSX);
                        // POSX uses A + int(delta) (note: different rounding than the others)
                        F[ANIVALUE_POSX] = mid ? A + toInt(static_cast<double>(B - A) / p * (s + 1)) : B;
                    }
                    F[ANIVALUE_POSY] = mid ? lerpOuter(val(i, o, k, ANIVALUE_POSY), val(i, o, k + 1, ANIVALUE_POSY), s)
                                           : val(i, o, k + 1, ANIVALUE_POSY);
                    F[ANIVALUE_POSZ] = val(i, o, k + 1, ANIVALUE_POSZ);
                    if (mid) {
                        F[ANIVALUE_ANGLE] = lerpOuter(val(i, o, k, ANIVALUE_ANGLE), val(i, o, k + 1, ANIVALUE_ANGLE), s);
                        F[ANIVALUE_FLIPX] = val(i, o, k, ANIVALUE_FLIPX);
                        F[ANIVALUE_FLIPY] = val(i, o, k, ANIVALUE_FLIPY);
                    } else {
                        F[ANIVALUE_ANGLE] = val(i, o, k + 1, ANIVALUE_ANGLE);
                        F[ANIVALUE_FLIPX] = val(i, o, k + 1, ANIVALUE_FLIPX);
                        F[ANIVALUE_FLIPY] = val(i, o, k + 1, ANIVALUE_FLIPY);
                    }
                    F[ANIVALUE_SCALEX] = mid ? lerpOuter(val(i, o, k, ANIVALUE_SCALEX), val(i, o, k + 1, ANIVALUE_SCALEX), s)
                                             : val(i, o, k + 1, ANIVALUE_SCALEX);
                    F[ANIVALUE_SCALEY] = mid ? lerpOuter(val(i, o, k, ANIVALUE_SCALEY), val(i, o, k + 1, ANIVALUE_SCALEY), s)
                                             : val(i, o, k + 1, ANIVALUE_SCALEY);
                    F[ANIVALUE_ALPHA] = mid ? lerpOuter(val(i, o, k, ANIVALUE_ALPHA), val(i, o, k + 1, ANIVALUE_ALPHA), s)
                                            : val(i, o, k + 1, ANIVALUE_ALPHA);
                }
            }
        }
    }

    // Exchange sort: larger POSZ first (drawn behind).
    for (auto& objs : d.DRAWANI) {
        if (objs.empty()) continue;
        const int nF = static_cast<int>(objs[0].size());
        for (size_t o1 = 0; o1 + 1 < objs.size(); ++o1) {
            for (size_t o2 = o1 + 1; o2 < objs.size(); ++o2) {
                for (int f = 0; f < nF; ++f) {
                    if (f >= static_cast<int>(objs[o1].size()) || f >= static_cast<int>(objs[o2].size())) continue;
                    if (objs[o1][f][ANIVALUE_POSZ] < objs[o2][f][ANIVALUE_POSZ]) std::swap(objs[o1][f], objs[o2][f]);
                }
            }
        }
    }
}

void Lib::loadMusic(int embedSnd, int slot) {
    audio_->loadMusic(slot, assetDir_ + "audio/snd_" + std::to_string(embedSnd) + ".mp3");
}

void Lib::loadEffect(int embedSnd, int slot) {
    audio_->loadEffect(slot, assetDir_ + "audio/snd_" + std::to_string(embedSnd) + ".mp3");
}

bool Lib::loadDBFile(int embedDB, std::vector<uint8_t>& out) {
    return readWholeFile(assetDir_ + "data/db_" + std::to_string(embedDB) + ".bin", out);
}

as3::ByteArray* Lib::newEmbedDB(int embedDB) {
    auto* ba = new as3::ByteArray();
    if (!loadDBFile(embedDB, ba->data)) SDL_Log("missing DB file %d", embedDB);
    return ba;
}

// ---------------------------------------------------------------------------
// Sound (lines 4122-4285)
// ---------------------------------------------------------------------------
void Lib::playMusic(int slot, bool loop) {
    if (slot == nPlayingMusic) return;
    if (slot >= 0 && slot < static_cast<int>(MUSICCHANNEL.size())) MUSICCHANNEL[slot] = true;
    audio_->playMusic(slot, loop);
    setMusicVolume();
    nPlayingMusic = slot;
}

void Lib::setMusicVolume() {
    audio_->setMusicVolume(nMusicVolume / 6.0);
}

void Lib::stopMusic() {
    for (size_t i = 0; i < MUSICCHANNEL.size(); ++i) {
        if (MUSICCHANNEL[i]) {
            MUSICCHANNEL[i] = false;
            nPlayingMusic = kDrawing::INITDATA;
        }
    }
    audio_->stopMusic();
}

void Lib::pauseMusic(int) { audio_->pauseMusic(); }
void Lib::resumeMusic(int) { audio_->resumeMusic(); }

void Lib::playEffect(int slot) {
    if (slot < 0 || slot >= static_cast<int>(bPlayingSndEff.size())) return;
    if (bPlayingSndEff[slot]) {
        if (static_cast<int>(getTimer()) - nSndEffStartTime[slot] <= 100) return;
    }
    audio_->stopChannel(nEffectChannelPos);
    if (!draw->bGameMenu || slot == 15) audio_->playEffect(nEffectChannelPos, slot, 1);
    EFFECTCHANNEL[nEffectChannelPos] = true;
    bPlayingSndEff[slot] = true;
    nSndEffStartTime[slot] = static_cast<int>(getTimer());
    setEffectVolume(slot);
    if (++nEffectChannelPos >= kLibrary::MAXSIZE_EFFECTCHANNEL) nEffectChannelPos = 0;
}

void Lib::playEffectLoop(int slot, int times) {
    if (slot < 0 || slot >= static_cast<int>(bPlayingSndEff.size())) return;
    if (bPlayingSndEff[slot]) {
        if (static_cast<int>(getTimer()) - nSndEffStartTime[slot] <= 100) return;
    }
    audio_->stopChannel(nEffectChannelPos);
    if (!draw->bGameMenu) audio_->playEffect(nEffectChannelPos, slot, times);
    EFFECTCHANNEL[nEffectChannelPos] = true;
    bPlayingSndEff[slot] = true;
    nSndEffStartTime[slot] = static_cast<int>(getTimer());
    setEffectVolume(slot);
    if (++nEffectChannelPos >= kLibrary::MAXSIZE_EFFECTCHANNEL) nEffectChannelPos = 0;
}

void Lib::setEffectVolume(int) {
    audio_->setChannelVolume(nEffectChannelPos, nEffectVolume / 6.0);
}

void Lib::sndEffectStop(int channel) {
    if (channel < 0 || channel >= static_cast<int>(EFFECTCHANNEL.size())) return;
    if (EFFECTCHANNEL[channel]) {
        audio_->stopChannel(channel);
        EFFECTCHANNEL[channel] = false;
    }
}

void Lib::sndEffectAllStop() {
    for (size_t i = 0; i < EFFECTCHANNEL.size(); ++i) {
        if (EFFECTCHANNEL[i]) {
            audio_->stopChannel(static_cast<int>(i));
            EFFECTCHANNEL[i] = false;
        }
    }
}

// ---------------------------------------------------------------------------
// Clip
// ---------------------------------------------------------------------------
void Lib::setClip(int x, int y, int w, int h) {
    nRectX = x;
    nRectY = y;
    nRectW = w;
    nRectH = h;
}

void Lib::resetClip() { setClip(0, 0, draw->nLcdW, draw->nLcdH); }

// ---------------------------------------------------------------------------
// Blit helpers
// ---------------------------------------------------------------------------
Blend Lib::blendOf(const std::string& mode) { return mode == "add" ? Blend::Add : Blend::Normal; }

void Lib::blitTex(int tex, const Matrix& m, double alpha, Blend blend) {
    if (tex < 0) return;
    gfx_->drawImage(tex, m, alpha, blend);
}

void Lib::blit(int idx, const Matrix& m, double alpha, Tint tint, Blend blend, bool clip) {
    const int tex = texFor(idx, tint);
    if (tex < 0) return;
    if (clip) gfx_->setClip(nRectX, nRectY, nRectW, nRectH);
    gfx_->drawImage(tex, m, alpha, blend);
    if (clip) gfx_->clearClip();
}

// ---------------------------------------------------------------------------
// Embedded images (line 4309)
// ---------------------------------------------------------------------------
void Lib::drawEmbedImg(int idx, int x, int y, int anchor) {
    if (idx < 0 || idx >= 10 || embedTex_[idx] < 0) return;
    x -= getHorAlign(embedW_[idx], anchor);
    y -= getVerAlign(embedH_[idx], anchor);
    Matrix m;
    m.translate(x, y);
    blitTex(embedTex_[idx], m, 1.0, Blend::Normal);
}

void Lib::drawEmbedImgZoom(int idx, int x, int y, int zx, int zy, int anchor) {
    drawEmbedImgZoomAlpha(idx, x, y, zx, zy, 100, anchor);
}

void Lib::drawEmbedImgAlpha(int idx, int x, int y, int alpha, int anchor) {
    if (idx < 0 || idx >= 10 || embedTex_[idx] < 0) return;
    x -= getHorAlign(embedW_[idx], anchor);
    y -= getVerAlign(embedH_[idx], anchor);
    Matrix m;
    m.translate(x, y);
    blitTex(embedTex_[idx], m, alpha / 100.0, Blend::Normal);
}

void Lib::drawEmbedImgZoomAlpha(int idx, int x, int y, int zx, int zy, int alpha, int anchor) {
    if (idx < 0 || idx >= 10 || embedTex_[idx] < 0) return;
    const double sx = zx / 100.0, sy = zy / 100.0;
    x -= getHorAlign(toInt(embedW_[idx] * sx), anchor);
    y -= getVerAlign(toInt(embedH_[idx] * sy), anchor);
    Matrix m;
    m.scale(sx, sy);
    m.translate(x, y);
    blitTex(embedTex_[idx], m, alpha / 100.0, Blend::Normal);
}

// ---------------------------------------------------------------------------
// Images (lines 4361-4805)
// ---------------------------------------------------------------------------
#define IMG_GUARD(idx)                                                     \
    if ((idx) < 0 || (idx) >= static_cast<int>(IMAGE.size())) return;   \
    BmpImage& im = IMAGE[idx];                                           \
    if (im.tex < 0) return

void Lib::drawImg(int idx, int x, int y, int anchor) {
    IMG_GUARD(idx);
    x -= getHorAlign(im.nOrgW, anchor);
    y -= getVerAlign(im.nOrgH, anchor);
    Matrix m;
    m.translate(x + im.nX, y + im.nY);
    blit(idx, m, 1.0, Tint::None, Blend::Normal, false);
    UiOverlay::draw(this, idx, x + im.nX, y + im.nY, im.nW, im.nH, 100);
}

void Lib::drawObjDmg(int idx, int x, int y, int anchor) {
    IMG_GUARD(idx);
    x -= getHorAlign(im.nOrgW, anchor);
    y -= getVerAlign(im.nOrgH, anchor);
    Matrix m;
    m.translate(x + im.nX, y + im.nY);
    blit(idx, m, 1.0, Tint::Damage, Blend::Normal, false);
}

void Lib::drawObjIceDmg(int idx, int x, int y, int anchor) {
    IMG_GUARD(idx);
    x -= getHorAlign(im.nOrgW, anchor);
    y -= getVerAlign(im.nOrgH, anchor);
    Matrix m;
    m.translate(x + im.nX, y + im.nY);
    blit(idx, m, 1.0, Tint::Ice, Blend::Normal, false);
}

void Lib::drawClipImg(int idx, int x, int y, int anchor) {
    IMG_GUARD(idx);
    x -= getHorAlign(im.nOrgW, anchor);
    y -= getVerAlign(im.nOrgH, anchor);
    Matrix m;
    m.translate(x + im.nX, y + im.nY);
    blit(idx, m, 1.0, Tint::None, Blend::Normal, true);
}

void Lib::drawClipImgAlpha(int idx, int x, int y, int alpha, int anchor) {
    IMG_GUARD(idx);
    x -= getHorAlign(im.nOrgW, anchor);
    y -= getVerAlign(im.nOrgH, anchor);
    Matrix m;
    m.translate(x + im.nX, y + im.nY);
    blit(idx, m, alpha / 100.0, Tint::None, Blend::Normal, true);
}

void Lib::drawImgAlpha(int idx, int x, int y, int alpha, int anchor) {
    IMG_GUARD(idx);
    x -= getHorAlign(im.nOrgW, anchor);
    y -= getVerAlign(im.nOrgH, anchor);
    Matrix m;
    m.translate(x + im.nX, y + im.nY);
    blit(idx, m, alpha / 100.0, Tint::None, Blend::Normal, false);
    UiOverlay::draw(this, idx, x + im.nX, y + im.nY, im.nW, im.nH, alpha);
}

void Lib::drawImgDodge(int idx, int x, int y, const std::string& blend, int anchor) {
    IMG_GUARD(idx);
    x -= getHorAlign(im.nOrgW, anchor);
    y -= getVerAlign(im.nOrgH, anchor);
    Matrix m;
    m.translate(x + im.nX, y + im.nY);
    blit(idx, m, 1.0, Tint::None, blendOf(blend), false);
}

void Lib::drawImgZoomCore(int idx, int x, int y, int zx, int zy, double alpha, Tint tint, Blend blend, int anchor) {
    IMG_GUARD(idx);
    const double sx = zx / 100.0, sy = zy / 100.0;
    x -= getHorAlign(toInt(im.nOrgW * sx), anchor);
    y -= getVerAlign(toInt(im.nOrgH * sy), anchor);
    Matrix m;
    m.scale(sx, sy);
    m.translate(x + im.nX * sx, y + im.nY * sy);
    blit(idx, m, alpha, tint, blend, false);
}

void Lib::drawImgZoomDodge(int idx, int x, int y, int zx, int zy, const std::string& blend, int anchor) {
    drawImgZoomCore(idx, x, y, zx, zy, 1.0, Tint::None, blendOf(blend), anchor);
}

void Lib::drawObjDmgZoomDodge(int idx, int x, int y, int zx, int zy, const std::string& blend, int anchor) {
    drawImgZoomCore(idx, x, y, zx, zy, 1.0, Tint::Damage, blendOf(blend), anchor);
}

void Lib::drawObjIceDmgZoomDodge(int idx, int x, int y, int zx, int zy, const std::string& blend, int anchor) {
    drawImgZoomCore(idx, x, y, zx, zy, 1.0, Tint::Ice, blendOf(blend), anchor);
}

void Lib::drawImgZoomAlpha(int idx, int x, int y, int zx, int zy, int alpha, int anchor) {
    drawImgZoomCore(idx, x, y, zx, zy, alpha / 100.0, Tint::None, Blend::Normal, anchor);
    IMG_GUARD(idx);
    const double sx = zx / 100.0, sy = zy / 100.0;
    const int px = x - getHorAlign(toInt(im.nOrgW * sx), anchor) + toInt(im.nX * sx);
    const int py = y - getVerAlign(toInt(im.nOrgH * sy), anchor) + toInt(im.nY * sy);
    UiOverlay::draw(this, idx, px, py, toInt(im.nW * sx), toInt(im.nH * sy), alpha);
}

void Lib::drawImgZoom(int idx, int x, int y, int zx, int zy, int anchor) {
    drawImgZoomCore(idx, x, y, zx, zy, 1.0, Tint::None, Blend::Normal, anchor);
    IMG_GUARD(idx);
    const double sx = zx / 100.0, sy = zy / 100.0;
    const int px = x - getHorAlign(toInt(im.nOrgW * sx), anchor) + toInt(im.nX * sx);
    const int py = y - getVerAlign(toInt(im.nOrgH * sy), anchor) + toInt(im.nY * sy);
    UiOverlay::draw(this, idx, px, py, toInt(im.nW * sx), toInt(im.nH * sy), 100);
}

void Lib::drawObjDmgZoomAlpha(int idx, int x, int y, int zx, int zy, int alpha, int anchor) {
    drawImgZoomCore(idx, x, y, zx, zy, alpha / 100.0, Tint::Damage, Blend::Normal, anchor);
}

void Lib::drawObjIceDmgZoomAlpha(int idx, int x, int y, int zx, int zy, int alpha, int anchor) {
    drawImgZoomCore(idx, x, y, zx, zy, alpha / 100.0, Tint::Ice, Blend::Normal, anchor);
}

void Lib::drawObjDmgZoom(int idx, int x, int y, int zx, int zy, int anchor) {
    drawImgZoomCore(idx, x, y, zx, zy, 1.0, Tint::Damage, Blend::Normal, anchor);
}

void Lib::drawObjIceDmgZoom(int idx, int x, int y, int zx, int zy, int anchor) {
    drawImgZoomCore(idx, x, y, zx, zy, 1.0, Tint::Ice, Blend::Normal, anchor);
}

void Lib::drawAttackedImgZoomDodge(bool hit, int idx, int x, int y, int zx, int zy, const std::string& blend,
                                   int anchor) {
    drawImgZoomCore(idx, x, y, zx, zy, 1.0, hit ? Tint::AttackHit : Tint::AttackDark, blendOf(blend), anchor);
}

// The original draws one clipped column at a time with mirrored offsets, which
// is exactly a horizontal flip at (x, y) that ignores nX/nY (line 4716).
void Lib::drawImgMirror(int idx, int x, int y, int anchor) {
    IMG_GUARD(idx);
    x -= getHorAlign(im.nOrgW, anchor);
    y -= getVerAlign(im.nOrgH, anchor);
    Matrix m(-1, 0, 0, 1, x + im.nW, y);
    blit(idx, m, 1.0, Tint::None, Blend::Normal, false);
}

void Lib::drawObjDmgMirror(int idx, int x, int y, int anchor) {
    IMG_GUARD(idx);
    x -= getHorAlign(im.nOrgW, anchor);
    y -= getVerAlign(im.nOrgH, anchor);
    Matrix m(-1, 0, 0, 1, x + im.nW, y);
    blit(idx, m, 1.0, Tint::Damage, Blend::Normal, false);
}

void Lib::drawImgRotationZoom(int idx, int x, int y, int zx, int zy, int anchor) {
    IMG_GUARD(idx);
    const double sx = zx / 100.0, sy = zy / 100.0;
    if ((anchor & 0xF0) == 32) {
        x += 0;
    } else if ((anchor & 0xF0) == 48) {
        x += toInt(im.nW * sx) >> 1;
    } else {
        x = toInt(x + im.nW * sx);
    }
    if ((anchor & 0x0F) == 2) {
        y += toInt(im.nH * sy) << 1;
    } else if ((anchor & 0x0F) == 3) {
        y += toInt(im.nH * sy) >> 1;
    } else {
        y = toInt(y + im.nH * sy);
    }
    Matrix m;
    m.rotate(kPI);
    m.scale(sx, sy);
    m.translate(x, y);
    blit(idx, m, 1.0, Tint::None, Blend::Normal, false);
}

void Lib::drawGrayImg(int idx, int x, int y, int anchor) {
    IMG_GUARD(idx);
    x -= getHorAlign(im.nOrgW, anchor);
    y -= getVerAlign(im.nOrgH, anchor);
    Matrix m;
    m.translate(x + im.nX, y + im.nY);
    blit(idx, m, 1.0, Tint::Gray, Blend::Normal, false);
}

void Lib::drawFillGray() { gfx_->grayscaleBackBuffer(); }

void Lib::drawOptics(int idx, int x, int y, int anchor) {
    // TODO(port): refraction effect reads back the frame buffer per pixel
    // (line 5949). Draw nothing for now.
    (void)idx; (void)x; (void)y; (void)anchor;
}

// ---------------------------------------------------------------------------
// Bitmap-font numbers (line 4807)
// ---------------------------------------------------------------------------
void Lib::drawNumImg(const std::string& s, int x, int y, int font, int anchor) {
    static const int L11[10] = {10, 0, 0, 0, 0, 6, 0, 0, 0, 0};
    static const int L12[24] = {47, 57, 48, 57, 48, 57, 47, 57, 48, 57, 47, 57,
                                47, 57, 48, 57, 48, 57, 47, 57, 48, 57, 47, 57};
    static const int L13[24] = {21, 22, 17, 19, 36, 44, 44, 50, 14, 15, 14, 15,
                                19, 19, 27, 34, 25, 30, 14, 15, 27, 33, 44, 50};
    static const int L14[24] = {16, 22, 13, 19, 36, 44, 44, 50, 12, 15, 11, 15,
                                13, 19, 25, 34, 23, 30, 14, 15, 25, 33, 40, 50};
    if (font < 0 || font >= 12) return;
    const int len = static_cast<int>(s.size());
    int total = len * L14[font * 2] + (L13[font * 2] - L14[font * 2]);
    const int height = L13[font * 2 + 1];
    if (font == kDrawing::NUM_MONEY || font == kDrawing::NUM_ITEMPRICE) {
        int slashes = 0;
        for (char c : s)
            if (c == '/') ++slashes;
        total -= slashes * (font < 10 ? L11[font] : 0);
        x -= getHorAlign(total, anchor);
        // draw.nMoneyDrawPosX = x;  (TODO(port): expose when Drawing is ported)
        y -= getVerAlign(height, anchor);
        slashes = 0;
        for (int i = 0; i < len; ++i) {
            const int c = static_cast<unsigned char>(s[i]);
            const int off = L14[font * 2] * i - slashes * L11[font];
            if (c == 47) ++slashes;
            if (c >= L12[font * 2] && c <= L12[font * 2 + 1]) {
                const int digit = c - L12[font * 2];
                setClip(x + off, y, L13[font * 2], L13[font * 2 + 1]);
                drawClipImg(kDrawing::imgNum + font, x + off - digit * L13[font * 2], y, kDrawing::TOP | kDrawing::LEFT);
            }
        }
    } else {
        x -= getHorAlign(total, anchor);
        y -= getVerAlign(height, anchor);
        for (int i = 0; i < len; ++i) {
            const int c = static_cast<unsigned char>(s[i]);
            if (c >= L12[font * 2] && c <= L12[font * 2 + 1]) {
                const int digit = c - L12[font * 2];
                setClip(x + L14[font * 2] * i, y, L13[font * 2], L13[font * 2 + 1]);
                drawClipImg(kDrawing::imgNum + font, x + L14[font * 2] * i - digit * L13[font * 2], y,
                            kDrawing::TOP | kDrawing::LEFT);
            }
        }
    }
    resetClip();
}

void Lib::drawNumImgAlpha(const std::string& s, int x, int y, int font, int alpha, int anchor) {
    static const int L9[24] = {47, 57, 48, 57, 48, 57, 47, 57, 48, 57, 47, 57,
                               47, 57, 48, 57, 48, 57, 47, 57, 47, 57, 47, 57};
    static const int L10[24] = {21, 22, 17, 19, 36, 44, 44, 50, 14, 15, 14, 15,
                                19, 19, 27, 34, 25, 30, 14, 15, 21, 23, 44, 50};
    static const int L11[24] = {16, 22, 13, 19, 36, 44, 44, 50, 12, 15, 11, 15,
                                13, 19, 25, 34, 23, 30, 14, 15, 21, 23, 40, 50};
    if (font < 0 || font >= 12) return;
    const int len = static_cast<int>(s.size());
    const int total = len * L11[font * 2] + (L10[font * 2] - L11[font * 2]);
    const int height = L10[font * 2 + 1];
    x -= getHorAlign(total, anchor);
    y -= getVerAlign(height, anchor);
    for (int i = 0; i < len; ++i) {
        const int c = static_cast<unsigned char>(s[i]);
        if (c >= L9[font * 2] && c <= L9[font * 2 + 1]) {
            const int digit = c - L9[font * 2];
            setClip(x + L11[font * 2] * i, y, L10[font * 2], L10[font * 2 + 1]);
            drawClipImgAlpha(kDrawing::imgNum + font, x + L11[font * 2] * i - digit * L10[font * 2], y, alpha,
                             kDrawing::TOP | kDrawing::LEFT);
        }
    }
    resetClip();
}

// ---------------------------------------------------------------------------
// ASE animations (lines 4994-5226)
// ---------------------------------------------------------------------------
#define ASE_GUARD(ase, ani)                                                          \
    if ((ase) < 0 || (ase) >= static_cast<int>(draw->ASEANI.size())) return;       \
    ASEData& d = draw->ASEANI[ase];                                                \
    if ((ani) < 0 || (ani) >= static_cast<int>(d.DRAWANI.size())) return;          \
    auto& objs = d.DRAWANI[ani];                                                   \
    if (objs.empty() || objs[0].empty()) return;                                   \
    d.nAniFrame = frame % static_cast<int>(objs[0].size());                        \
    if (d.nAniFrame < 0) return

void Lib::drawASEAni(int ase, int ani, int imgBase, int frame, int x, int y, int zx, int zy, bool dmg) {
    ASE_GUARD(ase, ani);
    for (auto& o : objs) {
        if (d.nAniFrame >= static_cast<int>(o.size())) continue;
        const ASEFrame& f = o[d.nAniFrame];
        if (f[ANIVALUE_IMGINDEX] < 0) continue;
        drawASEAniFrame(f[ANIVALUE_IMGINDEX] + imgBase, f[ANIVALUE_POSX] * (zx / 100.0) + x,
                        f[ANIVALUE_POSY] * (zy / 100.0) + y, f[ANIVALUE_SCALEX] / 10000.0,
                        f[ANIVALUE_SCALEY] / 10000.0, f[ANIVALUE_ANGLE] / 10000.0, f[ANIVALUE_ALPHA] / 100.0,
                        f[ANIVALUE_FLIPX], f[ANIVALUE_FLIPY], kDrawing::VCENTER | kDrawing::HCENTER, zx / 100.0,
                        zy / 100.0, dmg);
    }
}

void Lib::drawASEAniMirror(int ase, int ani, int imgBase, int frame, int x, int y, int zx, int zy, bool dmg) {
    ASE_GUARD(ase, ani);
    for (auto& o : objs) {
        if (d.nAniFrame >= static_cast<int>(o.size())) continue;
        const ASEFrame& f = o[d.nAniFrame];
        if (f[ANIVALUE_IMGINDEX] < 0) continue;
        drawASEAniFrameMirror(f[ANIVALUE_IMGINDEX] + imgBase, f[ANIVALUE_POSX] * (zx / 100.0),
                              f[ANIVALUE_POSY] * (zy / 100.0) + y, f[ANIVALUE_SCALEX] / 10000.0,
                              f[ANIVALUE_SCALEY] / 10000.0, f[ANIVALUE_ANGLE] / 10000.0, f[ANIVALUE_ALPHA] / 100.0,
                              f[ANIVALUE_FLIPX], f[ANIVALUE_FLIPY], kDrawing::VCENTER | kDrawing::HCENTER, zx / 100.0,
                              zy / 100.0, dmg, x);
    }
}

void Lib::drawASEAniBoss(int ase, int ani, int imgBase, int frame, int x, int y, int zx, int zy, bool dmg,
                         const std::string& blend, int alpha) {
    ASE_GUARD(ase, ani);
    for (auto& o : objs) {
        if (d.nAniFrame >= static_cast<int>(o.size())) continue;
        const ASEFrame& f = o[d.nAniFrame];
        if (f[ANIVALUE_IMGINDEX] < 0) continue;
        drawASEAniFrameBoss(f[ANIVALUE_IMGINDEX] + imgBase, f[ANIVALUE_POSX] * (zx / 100.0) + x,
                            f[ANIVALUE_POSY] * (zy / 100.0) + y, f[ANIVALUE_SCALEX] / 10000.0,
                            f[ANIVALUE_SCALEY] / 10000.0, f[ANIVALUE_ANGLE] / 10000.0, f[ANIVALUE_ALPHA] / 100.0,
                            f[ANIVALUE_FLIPX], f[ANIVALUE_FLIPY], kDrawing::VCENTER | kDrawing::HCENTER, zx / 100.0,
                            zy / 100.0, dmg, blend, alpha / 100.0);
    }
}

void Lib::drawASEAniEffect(int ase, int ani, int imgBase, int frame, int x, int y, int zx, int zy, bool dmg) {
    ASE_GUARD(ase, ani);
    for (auto& o : objs) {
        if (d.nAniFrame >= static_cast<int>(o.size())) continue;
        const ASEFrame& f = o[d.nAniFrame];
        if (f[ANIVALUE_IMGINDEX] < 0) continue;
        drawASEAniFrameEffect(f[ANIVALUE_IMGINDEX] + imgBase, f[ANIVALUE_POSX] * (zx / 100.0) + x,
                              f[ANIVALUE_POSY] * (zy / 100.0) + y, f[ANIVALUE_SCALEX] / 10000.0,
                              f[ANIVALUE_SCALEY] / 10000.0, f[ANIVALUE_ANGLE] / 10000.0, f[ANIVALUE_ALPHA] / 100.0,
                              f[ANIVALUE_FLIPX], f[ANIVALUE_FLIPY], kDrawing::VCENTER | kDrawing::HCENTER, zx / 100.0,
                              zy / 100.0, dmg);
    }
}

void Lib::drawASEAniFrame(int idx, double x, double y, double sx, double sy, double angle, double alpha, int flipX,
                          int /*flipY*/, int anchor, double zx, double zy, bool dmg) {
    if (idx >= kDrawing::imgTitleLogo + 2 && idx <= kDrawing::imgTitleLogo + 7) alpha = 20.0 / 100.0;
    IMG_GUARD(idx);
    sx *= zx;
    sy *= zy;
    x -= getHorAlign(toInt(im.nOrgW * sx), anchor);
    y -= getVerAlign(toInt(im.nOrgH * sy), anchor);
    double l18 = 0;
    if (flipX == 1) l18 = im.nW * sx;
    double l14;
    if (flipX == 1) {
        l14 = -((toInt(im.nOrgW * sx) >> 1) - (im.nX * sx + im.nW * sx));
    } else {
        l14 = (toInt(im.nOrgW * sx) >> 1) - im.nX * sx;
    }
    const double l15 = (toInt(im.nOrgH * sy) >> 1) - im.nY * sy;
    Matrix m;
    if (flipX == 1) {
        m.scale(-sx, sy);
        m.translate(l18, 0);
    } else {
        m.scale(sx, sy);
    }
    m.translate(-l14, -l15);
    m.rotate(2 * kPI * (angle / 360));
    if (flipX == 1) {
        const int l19 = toInt(im.nOrgW * sx - (im.nX * sx + im.nW * sx));
        m.translate(x + l19 * sx + l14, y + im.nY * sy + l15);
    } else {
        m.translate(x + im.nX * sx + l14, y + im.nY * sy + l15);
    }
    blit(idx, m, alpha, dmg ? Tint::Damage : Tint::None, Blend::Normal, false);
}

void Lib::drawASEAniFrameEffect(int idx, double x, double y, double sx, double sy, double angle, double alpha,
                                int /*flipX*/, int /*flipY*/, int anchor, double zx, double zy, bool dmg) {
    if (idx >= kDrawing::imgTitleLogo + 2 && idx <= kDrawing::imgTitleLogo + 7) alpha = 20.0 / 100.0;
    IMG_GUARD(idx);
    sx *= zx;
    sy *= zy;
    x -= getHorAlign(toInt(im.nOrgW * sx), anchor);
    y -= getVerAlign(toInt(im.nOrgH * sy), anchor);
    const double l14 = (toInt(im.nOrgW * sx) >> 1) - im.nX * sx;
    const double l15 = (toInt(im.nOrgH * sy) >> 1) - im.nY * sy;
    Matrix m;
    m.scale(sx, sy);
    m.translate(-l14, -l15);
    m.rotate(2 * kPI * (angle / 360));
    m.translate(x + im.nX * sx + l14, y + im.nY * sy + l15);
    blit(idx, m, alpha, dmg ? Tint::Damage : Tint::None, Blend::Add, false);
}

void Lib::drawASEAniFrameMirror(int idx, double x, double y, double sx, double sy, double angle, double alpha,
                                int /*flipX*/, int /*flipY*/, int anchor, double zx, double zy, bool dmg,
                                int mirrorX) {
    IMG_GUARD(idx);
    Matrix m(-1, 0, 0, 1, im.nW, 0);
    sx *= zx;
    sy *= zy;
    x *= -1;
    x += mirrorX;
    x -= getHorAlign(toInt(im.nOrgW * sx), anchor);
    y -= getVerAlign(toInt(im.nOrgH * sy), anchor);
    const double l15 = im.nOrgW - (im.nX + im.nW);
    const double l16 = (toInt(im.nOrgW * sx) >> 1) - l15 * sx;
    const double l17 = (toInt(im.nOrgH * sy) >> 1) - im.nY * sy;
    m.scale(sx, sy);
    m.translate(-l16, -l17);
    m.rotate(-(2 * kPI * (angle / 360)));
    m.translate(x + l15 * sx + l16, y + im.nY * sy + l17);
    blit(idx, m, alpha, dmg ? Tint::Damage : Tint::None, Blend::Normal, false);
}

void Lib::drawASEAniFrameBoss(int idx, double x, double y, double sx, double sy, double angle, double alpha,
                              int /*flipX*/, int /*flipY*/, int anchor, double zx, double zy, bool dmg,
                              std::string blend, double bossAlpha) {
    IMG_GUARD(idx);
    double a;
    Blend b = Blend::Normal;
    if (blend == "alpha") {
        a = alpha * bossAlpha;
    } else {
        a = alpha;
        if (blend == "add") b = Blend::Add;
    }
    sx *= zx;
    sy *= zy;
    x -= getHorAlign(toInt(im.nOrgW * sx), anchor);
    y -= getVerAlign(toInt(im.nOrgH * sy), anchor);
    const double l16 = (toInt(im.nOrgW * sx) >> 1) - im.nX * sx;
    const double l17 = (toInt(im.nOrgH * sy) >> 1) - im.nY * sy;
    Matrix m;
    m.scale(sx, sy);
    m.translate(-l16, -l17);
    m.rotate(2 * kPI * (angle / 360));
    m.translate(x + im.nX * sx + l16, y + im.nY * sy + l17);
    blit(idx, m, a, dmg ? Tint::Damage : Tint::None, b, false);
}

// ---------------------------------------------------------------------------
// Text (lines 5256-5430)
// ---------------------------------------------------------------------------
void Lib::drawText(const std::string& s, int sizePx, int x, int y, int rgb, int alpha, int anchor) {
    const TextCache::Entry& e = text_->get(s, sizePx, static_cast<uint32_t>(rgb));
    if (e.tex < 0) return;
    x -= getHorAlign(e.w, anchor);
    y -= getVerAlign(e.h, anchor);
    Matrix m;
    m.translate(x, y);
    gfx_->drawImage(e.tex, m, alpha / 100.0, Blend::Normal);
}

void Lib::drawString(const std::string& s, int x, int y, int rgb, int alpha, int anchor) {
    int size = 20;
    if ((anchor & 0xF0) != 32 && (anchor & 0xF0) != 48 && !s.empty()) {
        int maxW = 760 - x;
        if (x >= 430 && x <= 460) {
            maxW = 270; // Larva speech bubble (x=445)
        } else if (x >= 350 && x <= 390) {
            maxW = 340; // Pig speech bubble (x=370)
        }
        if (maxW > 50) {
            const auto& e = text_->get(s, size, static_cast<uint32_t>(rgb));
            if (e.w > maxW) {
                size = 18;
                const auto& e2 = text_->get(s, size, static_cast<uint32_t>(rgb));
                if (e2.w > maxW) {
                    size = 16;
                }
            }
        }
    } else if ((anchor & 0xF0) == 32 && x >= 740 && y == 130) {
        // Clamp store price right coordinate so it stays within the speech bubble border (x=719)
        x = 710;
    }
    drawText(s, size, x, y, rgb, alpha, anchor);
}

void Lib::drawBorderString(const std::string& s, int x, int y, int borderRgb, int rgb, int alpha, int anchor) {
    for (int i = 0; i < 2; ++i) {
        drawString(s, x - 1 + i * 2, y - 1, borderRgb, alpha, anchor);
        drawString(s, x - 1 + i * 2, y, borderRgb, alpha, anchor);
        drawString(s, x - 1 + i * 2, y + 1, borderRgb, alpha, anchor);
    }
    drawString(s, x, y, rgb, alpha, anchor);
}

void Lib::drawBorderText(const std::string& s, int sizePx, int x, int y, int borderRgb, int rgb, int borderW, int alpha, int anchor) {
    if (borderW > 0) {
        for (int dx = -borderW; dx <= borderW; ++dx) {
            for (int dy = -borderW; dy <= borderW; ++dy) {
                if (dx == 0 && dy == 0) continue;
                if (borderW > 1 && (dx * dx + dy * dy > borderW * borderW + 1)) continue;
                drawText(s, sizePx, x + dx, y + dy, borderRgb, alpha, anchor);
            }
        }
    }
    drawText(s, sizePx, x, y, rgb, alpha, anchor);
}

void Lib::drawIntroString(const std::string& s, int x, int y, int borderRgb, int rgb, int alpha, int anchor) {
    for (int pass = 0; pass < 2; ++pass) {
        const int spread = pass == 0 ? 2 : 1;
        for (int i = 0; i < 2; ++i) {
            const int px = x - spread + i * spread * 2;
            if (alpha < 1) {
                drawString24(s, px, y - 2, borderRgb, alpha / 90, anchor);
                drawString24(s, px, y + 2, borderRgb, alpha / 90, anchor);
            } else {
                for (int dy = -2; dy <= 2; ++dy) drawString24(s, px, y + dy, borderRgb, alpha, anchor);
            }
        }
    }
    drawString24(s, x, y, rgb, alpha, anchor);
}

void Lib::drawString24(const std::string& s, int x, int y, int rgb, int alpha, int anchor) {
    drawText(s, 24, x, y, rgb, alpha, anchor);
}

void Lib::drawString30(const std::string& s, int x, int y, int rgb, int alpha, int anchor) {
    drawText(s, 35, x, y, rgb, alpha, anchor);
}

// ---------------------------------------------------------------------------
// Misc
// ---------------------------------------------------------------------------
int Lib::getRand(int n) {
    std::uniform_real_distribution<double> dist(0.0, 1.0);
    return static_cast<int>(std::floor(dist(rng()) * n));
}

uint32_t Lib::getTimer() const { return SDL_GetTicks() - startTicks_; }

std::string Lib::setStrMoney(int money) {
    const std::string s = std::to_string(money);
    std::string out;
    const int groups = static_cast<int>((s.size() - 1) / 3);
    if (groups > 0) {
        int start = 0;
        for (int i = 0; i < groups; ++i) {
            start = static_cast<int>(s.size()) - 3 * (i + 1);
            out = "/" + s.substr(start, 3) + out;
        }
        out = s.substr(0, start) + out;
    } else {
        out = s;
    }
    return out;
}
