// Port of com.fazecat.web.paladog.Library (rendering / resource / sound part).
// Method names and parameter order intentionally match the ActionScript so the
// rest of the game code can be translated mechanically.
#pragma once

#include <array>
#include <cstdint>
#include <string>
#include <vector>

#include "../engine/flash.h"
#include "../runtime/as3.h"

class Gfx;
class Audio;
class TextCache;
struct Drawing;
struct SDL_Surface;

struct BmpImage {
    int nOrgW = 0, nOrgH = 0, nX = 0, nY = 0, nW = 0, nH = 0;
    int tex = -1;                                     // "img" (null when -1)
    std::array<int, static_cast<size_t>(flash::Tint::Count)> tinted{};  // lazily built
    int16_t fdat = -1;                                // source atlas for tint rebuilds
    int ax = 0, ay = 0;                               // position inside the atlas
    BmpImage() { tinted.fill(-1); }
};

struct ASEFrame {
    std::array<int, 10> v{};
    int& operator[](int i) { return v[i]; }
    int operator[](int i) const { return v[i]; }
};

struct ASEData {
    int nImgIndex = 0;
    int nFileVersion = 0;
    int nTotalAni = 0;
    int nAniFrame = 0;
    // ANI[ani][object][keyframe][value]
    std::vector<std::vector<std::vector<std::vector<int>>>> ANI;
    // DRAWANI[ani][object][frame] (interpolated and z-sorted)
    std::vector<std::vector<std::vector<ASEFrame>>> DRAWANI;
};

class Lib {
public:
    static constexpr int ANIVALUE_IMGINDEX = 0;
    static constexpr int ANIVALUE_POSX = 1;
    static constexpr int ANIVALUE_POSY = 2;
    static constexpr int ANIVALUE_POSZ = 3;
    static constexpr int ANIVALUE_ANGLE = 4;
    static constexpr int ANIVALUE_SCALEX = 5;
    static constexpr int ANIVALUE_SCALEY = 6;
    static constexpr int ANIVALUE_ALPHA = 7;
    static constexpr int ANIVALUE_FLIPX = 8;
    static constexpr int ANIVALUE_FLIPY = 9;

    Lib(Drawing* draw, Gfx* gfx, Audio* audio, TextCache* text, std::string assetDir);
    ~Lib();

    // Layout helpers ------------------------------------------------------
    int getHorAlign(int w, int anchor);
    int getVerAlign(int h, int anchor);

    // Primitive fills -----------------------------------------------------
    void fillRect(int x, int y, int w, int h, int rgb, int anchor);
    void fillRectAlpha(int x, int y, int w, int h, int rgb, int alpha, int anchor);
    void gradationH(int x, int y, int w, int h, int rgb1, int rgb2, int anchor);
    void gradationHAlpha(int x, int y, int w, int h, int rgb, int alpha, int anchor);
    void gradationV(int x, int y, int w, int h, int rgb1, int rgb2, int anchor);

    // Resource loading ----------------------------------------------------
    void loadEmbedImg();
    void loadImgFlashDat(int fdat, int baseIndex);
    void freeImg(int index);
    void loadASEAni(int embedAni, int aseIndex, int imgIndex);
    void setASEDrawAni(int aseIndex, int smooth);
    void loadMusic(int embedSnd, int slot);
    void loadEffect(int embedSnd, int slot);
    // Raw DB file (zlib already removed), indexed like EMBEDDB.
    bool loadDBFile(int embedDB, std::vector<uint8_t>& out);
    // `new this.EMBEDDB[x]() as ByteArray` of the original: the exported DB file as a ByteArray.
    as3::ByteArray* newEmbedDB(int embedDB);

    // Sound ---------------------------------------------------------------
    void playMusic(int slot, bool loop);
    void setMusicVolume();
    void stopMusic();
    void pauseMusic(int slot);
    void resumeMusic(int slot);
    void playEffect(int slot);
    void playEffectLoop(int slot, int times);
    void setEffectVolume(int slot);
    void sndEffectStop(int channel);
    void sndEffectAllStop();

    // Clip ----------------------------------------------------------------
    void setClip(int x, int y, int w, int h);
    void resetClip();
    bool bDrawImg(int x, int y, int w, int h) { (void)x; (void)y; (void)w; (void)h; return true; }

    // Embedded (logo) images ------------------------------------------------
    void drawEmbedImg(int idx, int x, int y, int anchor);
    void drawEmbedImgZoom(int idx, int x, int y, int zx, int zy, int anchor);
    void drawEmbedImgAlpha(int idx, int x, int y, int alpha, int anchor);
    void drawEmbedImgZoomAlpha(int idx, int x, int y, int zx, int zy, int alpha, int anchor);

    // Images ----------------------------------------------------------------
    void drawImg(int idx, int x, int y, int anchor);
    void drawObjDmg(int idx, int x, int y, int anchor);
    void drawObjIceDmg(int idx, int x, int y, int anchor);
    void drawClipImg(int idx, int x, int y, int anchor);
    void drawClipImgAlpha(int idx, int x, int y, int alpha, int anchor);
    void drawImgAlpha(int idx, int x, int y, int alpha, int anchor);
    void drawImgDodge(int idx, int x, int y, const std::string& blend, int anchor);
    void drawImgZoomDodge(int idx, int x, int y, int zx, int zy, const std::string& blend, int anchor);
    void drawObjDmgZoomDodge(int idx, int x, int y, int zx, int zy, const std::string& blend, int anchor);
    void drawObjIceDmgZoomDodge(int idx, int x, int y, int zx, int zy, const std::string& blend, int anchor);
    void drawImgZoomAlpha(int idx, int x, int y, int zx, int zy, int alpha, int anchor);
    void drawImgZoom(int idx, int x, int y, int zx, int zy, int anchor);
    void drawObjDmgZoomAlpha(int idx, int x, int y, int zx, int zy, int alpha, int anchor);
    void drawObjIceDmgZoomAlpha(int idx, int x, int y, int zx, int zy, int alpha, int anchor);
    void drawObjDmgZoom(int idx, int x, int y, int zx, int zy, int anchor);
    void drawObjIceDmgZoom(int idx, int x, int y, int zx, int zy, int anchor);
    void drawAttackedImgZoomDodge(bool hit, int idx, int x, int y, int zx, int zy, const std::string& blend, int anchor);
    void drawImgMirror(int idx, int x, int y, int anchor);
    void drawObjDmgMirror(int idx, int x, int y, int anchor);
    void drawImgRotationZoom(int idx, int x, int y, int zx, int zy, int anchor);
    void drawGrayImg(int idx, int x, int y, int anchor);

    // Bitmap-font numbers ---------------------------------------------------
    void drawNumImg(const std::string& s, int x, int y, int font, int anchor);
    void drawNumImgAlpha(const std::string& s, int x, int y, int font, int alpha, int anchor);

    // ASE skeletal animations ----------------------------------------------
    void drawASEAni(int ase, int ani, int imgBase, int frame, int x, int y, int zx, int zy, bool dmg);
    void drawASEAniMirror(int ase, int ani, int imgBase, int frame, int x, int y, int zx, int zy, bool dmg);
    void drawASEAniBoss(int ase, int ani, int imgBase, int frame, int x, int y, int zx, int zy, bool dmg,
                        const std::string& blend, int alpha);
    void drawASEAniEffect(int ase, int ani, int imgBase, int frame, int x, int y, int zx, int zy, bool dmg);
    void drawASEAniFrame(int idx, double x, double y, double sx, double sy, double angle, double alpha,
                         int flipX, int flipY, int anchor, double zx, double zy, bool dmg);
    void drawASEAniFrameEffect(int idx, double x, double y, double sx, double sy, double angle, double alpha,
                               int flipX, int flipY, int anchor, double zx, double zy, bool dmg);
    void drawASEAniFrameMirror(int idx, double x, double y, double sx, double sy, double angle, double alpha,
                               int flipX, int flipY, int anchor, double zx, double zy, bool dmg, int mirrorX);
    void drawASEAniFrameBoss(int idx, double x, double y, double sx, double sy, double angle, double alpha,
                             int flipX, int flipY, int anchor, double zx, double zy, bool dmg,
                             std::string blend, double bossAlpha);

    // Text ----------------------------------------------------------------
    void drawString(const std::string& s, int x, int y, int rgb, int alpha, int anchor);
    void drawBorderString(const std::string& s, int x, int y, int borderRgb, int rgb, int alpha, int anchor);
    void drawBorderText(const std::string& s, int sizePx, int x, int y, int borderRgb, int rgb, int borderW = 2, int alpha = 100, int anchor = 0);
    void drawIntroString(const std::string& s, int x, int y, int borderRgb, int rgb, int alpha, int anchor);
    void drawString24(const std::string& s, int x, int y, int rgb, int alpha, int anchor);
    void drawString30(const std::string& s, int x, int y, int rgb, int alpha, int anchor);

    int getRand(int n);
    uint32_t getTimer() const;
    std::string setStrMoney(int money);
    void drawFillGray();
    void drawOptics(int idx, int x, int y, int anchor);

    // State mirrored from the ActionScript class ---------------------------
    std::vector<BmpImage> IMAGE;
    bool bLoading = false;
    int nRectX = 0, nRectY = 0, nRectW = 760, nRectH = 570;
    int nMusicVolume = 3, nEffectVolume = 3;
    int nSaveMusicVolume = 3, nSaveEffectVolume = 3;
    int nPlayingMusic = -10000;
    int nMusicPosition = 0;
    int nEffectChannelPos = 0;
    std::vector<bool> bPlayingSndEff;
    std::vector<int> nSndEffStartTime;
    std::vector<bool> MUSICCHANNEL;   // "channel != null"
    std::vector<bool> EFFECTCHANNEL;
    int nLoadImgCount = 0;

    // Everything else of Library.as, transpiled by tools/as3cpp.py.
#include "../gen/Lib_members.inc"

private:
    enum class Blit { Plain, Clip };
    int texFor(int idx, flash::Tint tint);
    void blit(int idx, const flash::Matrix& m, double alpha, flash::Tint tint, flash::Blend blend, bool clip);
    void blitTex(int tex, const flash::Matrix& m, double alpha, flash::Blend blend);
    void drawText(const std::string& s, int sizePx, int x, int y, int rgb, int alpha, int anchor);
    static flash::Blend blendOf(const std::string& mode);
    SDL_Surface* atlasSurface(int fdat);
    void drawImgZoomCore(int idx, int x, int y, int zx, int zy, double alpha, flash::Tint tint,
                         flash::Blend blend, int anchor);

    Drawing* draw;
    Gfx* gfx_;
    Audio* audio_;
    TextCache* text_;
    std::string assetDir_;
    uint32_t startTicks_ = 0;

    std::array<int, 10> embedTex_{};
    std::array<int, 10> embedW_{};
    std::array<int, 10> embedH_{};

    // Small cache of decoded atlas surfaces used when building tint variants.
    int cachedAtlasId_[2] = {-1, -1};
    SDL_Surface* cachedAtlas_[2] = {nullptr, nullptr};
    int cachedAtlasNext_ = 0;
};
