#include "text.h"

#include "gfx.h"

bool TextCache::init(Gfx* gfx, const std::string& fontPath) {
    gfx_ = gfx;
    fontPath_ = fontPath;
    if (TTF_Init() != 0) {
        SDL_Log("TTF_Init failed: %s", TTF_GetError());
        return false;
    }
    if (!font(20)) return false;
    return true;
}

void TextCache::shutdown() {
    for (auto& kv : cache_) gfx_->destroyTexture(kv.second.tex);
    cache_.clear();
    for (auto& kv : fonts_) TTF_CloseFont(kv.second);
    fonts_.clear();
    TTF_Quit();
}

TTF_Font* TextCache::font(int sizePx) {
    auto it = fonts_.find(sizePx);
    if (it != fonts_.end()) return it->second;
    TTF_Font* f = TTF_OpenFont(fontPath_.c_str(), sizePx);
    if (!f) {
        SDL_Log("TTF_OpenFont(%s, %d): %s", fontPath_.c_str(), sizePx, TTF_GetError());
        return nullptr;
    }
    TTF_SetFontHinting(f, TTF_HINTING_LIGHT);
    fonts_[sizePx] = f;
    return f;
}

const TextCache::Entry& TextCache::get(const std::string& utf8, int sizePx, uint32_t rgb) {
    std::string key;
    key.reserve(utf8.size() + 16);
    key += std::to_string(sizePx);
    key += '|';
    key += std::to_string(rgb & 0xFFFFFF);
    key += '|';
    key += utf8;

    auto it = cache_.find(key);
    if (it != cache_.end()) {
        it->second.lastUse = frame_;
        return it->second;
    }

    Entry e;
    e.lastUse = frame_;
    TTF_Font* f = font(sizePx);
    if (!f) return empty_;

    // TextField autosize: bitmap = text bounds + 2px gutter on every side.
    const int lineH = TTF_FontHeight(f);
    SDL_Surface* glyphs = nullptr;
    if (!utf8.empty()) {
        SDL_Color c{Uint8((rgb >> 16) & 0xFF), Uint8((rgb >> 8) & 0xFF), Uint8(rgb & 0xFF), 255};
        glyphs = TTF_RenderUTF8_Blended(f, utf8.c_str(), c);
    }
    const int tw = glyphs ? glyphs->w : 0;
    e.w = tw + 4;
    e.h = lineH + 4;
    SDL_Surface* canvas = SDL_CreateRGBSurfaceWithFormat(0, e.w, e.h, 32, SDL_PIXELFORMAT_ARGB8888);
    if (canvas) {
        SDL_FillRect(canvas, nullptr, 0);
        if (glyphs) {
            SDL_SetSurfaceBlendMode(glyphs, SDL_BLENDMODE_NONE);
            SDL_Rect dst{2, 2, glyphs->w, glyphs->h};
            SDL_BlitSurface(glyphs, nullptr, canvas, &dst);
        }
        e.tex = gfx_->createTexture(canvas);
        SDL_FreeSurface(canvas);
    }
    if (glyphs) SDL_FreeSurface(glyphs);
    return cache_.emplace(std::move(key), e).first->second;
}

void TextCache::endFrame() {
    ++frame_;
    if ((frame_ & 63) != 0) return;
    for (auto it = cache_.begin(); it != cache_.end();) {
        if (frame_ - it->second.lastUse > 180) {
            gfx_->destroyTexture(it->second.tex);
            it = cache_.erase(it);
        } else {
            ++it;
        }
    }
}
