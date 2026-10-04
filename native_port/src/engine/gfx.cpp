#include "gfx.h"

#include <SDL_image.h>

#include <algorithm>
#include <cmath>
#include <cstdio>

namespace {

struct TintOffsets { int r, g, b; };

TintOffsets offsetsFor(flash::Tint t) {
    switch (t) {
        case flash::Tint::Damage:     return {0, -128, -128};
        case flash::Tint::Ice:        return {-128, -128, 0};
        case flash::Tint::AttackHit:  return {0, -64, -128};
        case flash::Tint::AttackDark: return {-32, -32, 0};
        default:                      return {0, 0, 0};
    }
}

inline Uint8 clamp8(int v) { return static_cast<Uint8>(v < 0 ? 0 : (v > 255 ? 255 : v)); }

bool isPixelAligned(const flash::Matrix& m) {
    return m.b == 0.0 && m.c == 0.0 && std::fabs(m.a) == 1.0 && m.d == 1.0 &&
           m.tx == std::floor(m.tx) && m.ty == std::floor(m.ty);
}

} // namespace

bool Gfx::init(const char* title, int logicalW, int logicalH, bool fullscreen) {
    lw_ = logicalW;
    lh_ = logicalH;
    fullscreen_ = fullscreen;

    Uint32 flags = SDL_WINDOW_RESIZABLE | SDL_WINDOW_ALLOW_HIGHDPI;
    if (fullscreen) flags |= SDL_WINDOW_FULLSCREEN_DESKTOP;
    window_ = SDL_CreateWindow(title, SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
                               logicalW, logicalH, flags);
    if (!window_) {
        SDL_Log("SDL_CreateWindow failed: %s", SDL_GetError());
        return false;
    }
    renderer_ = SDL_CreateRenderer(window_, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_TARGETTEXTURE);
    if (!renderer_) renderer_ = SDL_CreateRenderer(window_, -1, SDL_RENDERER_TARGETTEXTURE);
    if (!renderer_) {
        SDL_Log("SDL_CreateRenderer failed: %s", SDL_GetError());
        return false;
    }
    SDL_RendererInfo info;
    if (SDL_GetRendererInfo(renderer_, &info) == 0) SDL_Log("Renderer: %s", info.name);

    backBuffer_ = SDL_CreateTexture(renderer_, SDL_PIXELFORMAT_ARGB8888, SDL_TEXTUREACCESS_TARGET, lw_, lh_);
    if (!backBuffer_) {
        SDL_Log("Back buffer creation failed: %s", SDL_GetError());
        return false;
    }
    SDL_SetTextureScaleMode(backBuffer_, SDL_ScaleModeLinear);
    // Flash never clears the back buffer between frames; start from black once.
    SDL_SetRenderTarget(renderer_, backBuffer_);
    SDL_SetRenderDrawColor(renderer_, 0, 0, 0, 255);
    SDL_RenderClear(renderer_);
    SDL_SetRenderTarget(renderer_, nullptr);
    return true;
}

void Gfx::shutdown() {
    for (size_t i = 0; i < textures_.size(); ++i) destroyTexture(static_cast<int>(i));
    textures_.clear();
    freeIds_.clear();
    if (backBuffer_) SDL_DestroyTexture(backBuffer_);
    if (renderer_) SDL_DestroyRenderer(renderer_);
    if (window_) SDL_DestroyWindow(window_);
    backBuffer_ = nullptr;
    renderer_ = nullptr;
    window_ = nullptr;
}

int Gfx::createTexture(SDL_Surface* surf) {
    if (!surf) return -1;
    SDL_Texture* tex = SDL_CreateTextureFromSurface(renderer_, surf);
    if (!tex) {
        SDL_Log("CreateTexture failed: %s", SDL_GetError());
        return -1;
    }
    SDL_SetTextureBlendMode(tex, SDL_BLENDMODE_BLEND);

    Tex t;
    t.tex = tex;
    t.w = surf->w;
    t.h = surf->h;
    textureBytes_ += static_cast<size_t>(t.w) * t.h * 4;

    int id;
    if (!freeIds_.empty()) {
        id = freeIds_.back();
        freeIds_.pop_back();
        textures_[id] = t;
    } else {
        id = static_cast<int>(textures_.size());
        textures_.push_back(t);
    }
    return id;
}

void Gfx::destroyTexture(int id) {
    if (id < 0 || id >= static_cast<int>(textures_.size())) return;
    Tex& t = textures_[id];
    if (!t.tex) return;
    SDL_DestroyTexture(t.tex);
    textureBytes_ -= static_cast<size_t>(t.w) * t.h * 4;
    t = Tex{};
    freeIds_.push_back(id);
}

int Gfx::textureWidth(int id) const {
    return (id >= 0 && id < static_cast<int>(textures_.size())) ? textures_[id].w : 0;
}

int Gfx::textureHeight(int id) const {
    return (id >= 0 && id < static_cast<int>(textures_.size())) ? textures_[id].h : 0;
}

void Gfx::applyTint(SDL_Surface* s, flash::Tint tint) {
    if (!s || tint == flash::Tint::None || s->format->format != SDL_PIXELFORMAT_ARGB8888) return;
    const TintOffsets o = offsetsFor(tint);
    SDL_LockSurface(s);
    for (int y = 0; y < s->h; ++y) {
        Uint32* row = reinterpret_cast<Uint32*>(static_cast<Uint8*>(s->pixels) + y * s->pitch);
        for (int x = 0; x < s->w; ++x) {
            const Uint32 p = row[x];
            if (tint == flash::Tint::Gray) {
                if ((p >> 24) != 0) {
                    const Uint32 g = (((p >> 16) & 0xFF) + ((p >> 8) & 0xFF) + (p & 0xFF)) / 3;
                    row[x] = (p & 0xFF000000u) | (g << 16) | (g << 8) | g;
                }
                continue;
            }
            const Uint32 a = p >> 24;
            const Uint8 r = clamp8(static_cast<int>((p >> 16) & 0xFF) + o.r);
            const Uint8 g = clamp8(static_cast<int>((p >> 8) & 0xFF) + o.g);
            const Uint8 b = clamp8(static_cast<int>(p & 0xFF) + o.b);
            row[x] = (a << 24) | (Uint32(r) << 16) | (Uint32(g) << 8) | b;
        }
    }
    SDL_UnlockSurface(s);
}

void Gfx::beginFrame() {
    SDL_SetRenderTarget(renderer_, backBuffer_);
    clearClip();
}

SDL_Rect Gfx::presentRect() const {
    int ow = lw_, oh = lh_;
    SDL_GetRendererOutputSize(renderer_, &ow, &oh);
    // Fit the 4:3 back buffer into the output, centred (R36S 640x480 => full screen).
    const double s = std::min(static_cast<double>(ow) / lw_, static_cast<double>(oh) / lh_);
    SDL_Rect r;
    r.w = static_cast<int>(lw_ * s + 0.5);
    r.h = static_cast<int>(lh_ * s + 0.5);
    r.x = (ow - r.w) / 2;
    r.y = (oh - r.h) / 2;
    return r;
}

void Gfx::endFrame() {
    SDL_RenderSetClipRect(renderer_, nullptr);
    SDL_SetRenderTarget(renderer_, nullptr);
    SDL_SetRenderDrawColor(renderer_, 0, 0, 0, 255);
    SDL_RenderClear(renderer_);
    const SDL_Rect dst = presentRect();
    SDL_RenderCopy(renderer_, backBuffer_, nullptr, &dst);
    SDL_RenderPresent(renderer_);
}

void Gfx::drawImage(int id, const flash::Matrix& m, double alpha, flash::Blend blend) {
    if (clipEmpty_) return;
    if (id < 0 || id >= static_cast<int>(textures_.size())) return;
    Tex& t = textures_[id];
    if (!t.tex || alpha <= 0.0) return;

    SDL_SetTextureBlendMode(t.tex, blend == flash::Blend::Add ? SDL_BLENDMODE_ADD : SDL_BLENDMODE_BLEND);
    // Pixel-aligned blits stay pixel exact; anything scaled/rotated is smoothed
    // like Flash's BMP_FILTER (smoothing = true).
    SDL_SetTextureScaleMode(t.tex, isPixelAligned(m) ? SDL_ScaleModeNearest : SDL_ScaleModeLinear);

    const Uint8 a8 = static_cast<Uint8>(std::min(1.0, alpha) * 255.0 + 0.5);
    SDL_Vertex v[4];
    const double cx[4] = {0, double(t.w), double(t.w), 0};
    const double cy[4] = {0, 0, double(t.h), double(t.h)};
    const float u[4] = {0.f, 1.f, 1.f, 0.f};
    const float w[4] = {0.f, 0.f, 1.f, 1.f};
    for (int i = 0; i < 4; ++i) {
        m.apply(cx[i], cy[i], v[i].position.x, v[i].position.y);
        v[i].color = SDL_Color{255, 255, 255, a8};
        v[i].tex_coord = SDL_FPoint{u[i], w[i]};
    }
    static const int idx[6] = {0, 1, 2, 0, 2, 3};
    SDL_RenderGeometry(renderer_, t.tex, v, 4, idx, 6);
}

void Gfx::setClip(int x, int y, int w, int h) {
    // Intersect with the back buffer; SDL treats an empty rect as "no clip",
    // Flash treats it as "draw nothing".
    const int x0 = std::max(0, x), y0 = std::max(0, y);
    const int x1 = std::min(lw_, x + w), y1 = std::min(lh_, y + h);
    if (x1 <= x0 || y1 <= y0) {
        clipEmpty_ = true;
        return;
    }
    clipEmpty_ = false;
    SDL_Rect r{x0, y0, x1 - x0, y1 - y0};
    SDL_RenderSetClipRect(renderer_, &r);
}

void Gfx::clearClip() {
    clipEmpty_ = false;
    SDL_RenderSetClipRect(renderer_, nullptr);
}

void Gfx::fillRect(int x, int y, int w, int h, uint32_t rgb, double alpha) {
    if (clipEmpty_ || w <= 0 || h <= 0) return;
    const Uint8 a8 = static_cast<Uint8>(std::max(0.0, std::min(1.0, alpha)) * 255.0 + 0.5);
    SDL_SetRenderDrawBlendMode(renderer_, a8 == 255 ? SDL_BLENDMODE_NONE : SDL_BLENDMODE_BLEND);
    SDL_SetRenderDrawColor(renderer_, (rgb >> 16) & 0xFF, (rgb >> 8) & 0xFF, rgb & 0xFF, a8);
    SDL_Rect r{x, y, w, h};
    SDL_RenderFillRect(renderer_, &r);
}

void Gfx::grayscaleBackBuffer() {
    std::vector<Uint32> px(static_cast<size_t>(lw_) * lh_);
    SDL_RenderSetClipRect(renderer_, nullptr);
    if (SDL_RenderReadPixels(renderer_, nullptr, SDL_PIXELFORMAT_ARGB8888, px.data(), lw_ * 4) != 0) return;
    for (Uint32& p : px) {
        const Uint32 g = (((p >> 16) & 0xFF) + ((p >> 8) & 0xFF) + (p & 0xFF)) / 3;
        p = 0xFF000000u | (g << 16) | (g << 8) | g;
    }
    SDL_Texture* t = SDL_CreateTexture(renderer_, SDL_PIXELFORMAT_ARGB8888, SDL_TEXTUREACCESS_STATIC, lw_, lh_);
    if (!t) return;
    SDL_UpdateTexture(t, nullptr, px.data(), lw_ * 4);
    SDL_SetTextureBlendMode(t, SDL_BLENDMODE_NONE);
    SDL_RenderCopy(renderer_, t, nullptr, nullptr);
    SDL_DestroyTexture(t);
}

void Gfx::drawCursor(int x, int y) {
    static const float scale = 1.4f;
    static const float P[7][2] = {{0, 0},
                                  {0, 17.f * scale},
                                  {4.3f * scale, 13.f * scale},
                                  {7.2f * scale, 20.f * scale},
                                  {9.8f * scale, 18.8f * scale},
                                  {6.9f * scale, 12.2f * scale},
                                  {12.2f * scale, 12.2f * scale}};
    static const int T[5][3] = {{0, 1, 2}, {0, 2, 5}, {0, 5, 6}, {2, 3, 4}, {2, 4, 5}};
    SDL_RenderSetClipRect(renderer_, nullptr);
    SDL_SetRenderDrawBlendMode(renderer_, SDL_BLENDMODE_BLEND);
    auto draw = [&](float ox, float oy, SDL_Color c) {
        SDL_Vertex v[15];
        for (int t = 0; t < 5; ++t) {
            for (int k = 0; k < 3; ++k) {
                SDL_Vertex& s = v[t * 3 + k];
                s.position.x = x + ox + P[T[t][k]][0];
                s.position.y = y + oy + P[T[t][k]][1];
                s.color = c;
                s.tex_coord.x = 0.f;
                s.tex_coord.y = 0.f;
            }
        }
        SDL_RenderGeometry(renderer_, nullptr, v, 15, nullptr, 0);
    };
    const SDL_Color black{0, 0, 0, 255}, gold{255, 226, 58, 255}, white{255, 255, 255, 255};
    static const float off[8][2] = {{-2.0f, 0}, {2.0f, 0}, {0, -2.0f}, {0, 2.0f},
                                    {-1.5f, -1.5f}, {1.5f, -1.5f}, {-1.5f, 1.5f}, {1.5f, 1.5f}};
    for (const auto& o : off) draw(o[0] * 1.3f, o[1] * 1.3f, black);
    for (const auto& o : off) draw(o[0] * 0.7f, o[1] * 0.7f, gold);
    draw(0, 0, white);
}

bool Gfx::windowToLogical(int wx, int wy, int& lx, int& ly) const {
    // Mouse coordinates are in window points; output size may be in pixels (HiDPI).
    int winW = 1, winH = 1, outW = 1, outH = 1;
    SDL_GetWindowSize(window_, &winW, &winH);
    SDL_GetRendererOutputSize(renderer_, &outW, &outH);
    const double px = wx * static_cast<double>(outW) / winW;
    const double py = wy * static_cast<double>(outH) / winH;
    const SDL_Rect r = presentRect();
    lx = static_cast<int>((px - r.x) * lw_ / r.w);
    ly = static_cast<int>((py - r.y) * lh_ / r.h);
    return lx >= 0 && ly >= 0 && lx < lw_ && ly < lh_;
}

bool Gfx::saveScreenshot(const std::string& path) {
    SDL_Texture* prev = SDL_GetRenderTarget(renderer_);
    SDL_SetRenderTarget(renderer_, backBuffer_);
    SDL_Surface* s = SDL_CreateRGBSurfaceWithFormat(0, lw_, lh_, 32, SDL_PIXELFORMAT_ARGB8888);
    bool ok = s && SDL_RenderReadPixels(renderer_, nullptr, SDL_PIXELFORMAT_ARGB8888, s->pixels, s->pitch) == 0;
    if (ok) ok = IMG_SavePNG(s, path.c_str()) == 0;
    if (s) SDL_FreeSurface(s);
    SDL_SetRenderTarget(renderer_, prev);
    return ok;
}

void Gfx::toggleFullscreen() {
    fullscreen_ = !fullscreen_;
    SDL_SetWindowFullscreen(window_, fullscreen_ ? SDL_WINDOW_FULLSCREEN_DESKTOP : 0);
}
