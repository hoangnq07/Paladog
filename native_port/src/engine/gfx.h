// Sprite rendering emulating Flash: every game image is its own texture (like
// Flash's per-image BitmapData), so there is no atlas bleeding when scaled.
#pragma once

#include <SDL.h>

#include <cstdint>
#include <string>
#include <vector>

#include "flash.h"

class Gfx {
public:
    bool init(const char* title, int logicalW, int logicalH, bool fullscreen);
    void shutdown();

    // Textures ------------------------------------------------------------
    // The caller keeps ownership of `surf`. Returns texture id or -1.
    int createTexture(SDL_Surface* surf);
    void destroyTexture(int id);
    int textureWidth(int id) const;
    int textureHeight(int id) const;

    // Applies a ColorTransform offset preset in place (ARGB8888 surface).
    static void applyTint(SDL_Surface* s, flash::Tint tint);

    // Frame ---------------------------------------------------------------
    void beginFrame();
    void endFrame();

    // Drawing (back-buffer coordinates) -------------------------------------
    // Equivalent of BitmapData.draw(img, matrix, alphaMultiplier, blendMode).
    void drawImage(int id, const flash::Matrix& m, double alpha = 1.0,
                   flash::Blend blend = flash::Blend::Normal);
    // Flash clipRect (destination coordinates). Empty rect => draw nothing.
    void setClip(int x, int y, int w, int h);
    void clearClip();
    // BitmapData.fillRect (alpha == 1 replaces pixels like Flash does).
    void fillRect(int x, int y, int w, int h, uint32_t rgb, double alpha = 1.0);
    // Library.drawFillGray: replace the whole back buffer by its grey version.
    void grayscaleBackBuffer();
    // Arrow cursor for gamepad navigation (back-buffer coordinates).
    void drawCursor(int x, int y);

    // Misc ----------------------------------------------------------------
    bool windowToLogical(int wx, int wy, int& lx, int& ly) const;
    bool saveScreenshot(const std::string& path);
    void toggleFullscreen();
    int logicalW() const { return lw_; }
    int logicalH() const { return lh_; }
    SDL_Renderer* renderer() const { return renderer_; }
    size_t liveTextures() const { return textures_.size() - freeIds_.size(); }
    size_t liveTextureBytes() const { return textureBytes_; }

private:
    struct Tex {
        SDL_Texture* tex = nullptr;
        int w = 0, h = 0;
    };

    SDL_Rect presentRect() const;

    SDL_Window* window_ = nullptr;
    SDL_Renderer* renderer_ = nullptr;
    SDL_Texture* backBuffer_ = nullptr;
    int lw_ = 760, lh_ = 570;
    bool fullscreen_ = false;
    bool clipEmpty_ = false;
    std::vector<Tex> textures_;
    size_t textureBytes_ = 0;
    std::vector<int> freeIds_;
};
