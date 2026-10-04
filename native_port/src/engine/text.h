// Replacement for the TextField -> BitmapData rendering used by drawString*.
// Rendered strings are cached as textures because the game redraws the same
// text every frame.
#pragma once

#include <SDL_ttf.h>

#include <cstdint>
#include <map>
#include <string>
#include <unordered_map>

class Gfx;

class TextCache {
public:
    struct Entry {
        int tex = -1;
        int w = 0;   // bitmap size incl. the 2px TextField gutter on each side
        int h = 0;
        uint32_t lastUse = 0;
    };

    bool init(Gfx* gfx, const std::string& fontPath);
    void shutdown();
    // Returns a cached rendering of `utf8` at `sizePx` in colour `rgb`.
    const Entry& get(const std::string& utf8, int sizePx, uint32_t rgb);
    // Frees textures that have not been used for a while; call once per frame.
    void endFrame();

private:
    TTF_Font* font(int sizePx);

    Gfx* gfx_ = nullptr;
    std::string fontPath_;
    std::map<int, TTF_Font*> fonts_;
    std::unordered_map<std::string, Entry> cache_;
    uint32_t frame_ = 0;
    Entry empty_;
};
