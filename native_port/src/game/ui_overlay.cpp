#include "ui_overlay.h"

#include <string>
#include <unordered_map>

#include "lib.h"
#include "../generated/constants.h"

namespace UiOverlay {

struct ButtonDef {
    const char* text;
    int sizePx;
    uint32_t fillRgb;
    uint32_t borderRgb;
    int borderW;
    int offsetX;
    int offsetY;
};

// Global lookup table initialized on first use
static const std::unordered_map<int, ButtonDef>& getRegistry() {
    static const std::unordered_map<int, ButtonDef> reg = {
        // --- 1. TITLE SCREEN ---
        // Normal PLAY (blue crystal orb)
        { kDrawing::imgTitleBtn + 4, { "CHƠI", 40, 0xFFFFFF, 0x0F2550, 3, 0, -2 } },
        // Pressed PLAY
        { kDrawing::imgTitleBtn + 3, { "CHƠI", 40, 0xFFFFFF, 0x0F2550, 3, 0, 1 } },

        // --- 2. STAGE SELECT MAP ---
        // Normal UPGRADE
        { kDrawing::imgStageSelect + 23, { "NÂNG CẤP", 20, 0xFFD700, 0x1E053A, 2, 16, -1 } },
        // Pressed UPGRADE
        { kDrawing::imgStageSelect + 22, { "NÂNG CẤP", 20, 0xFFD700, 0x1E053A, 2, 16, 1 } },

        // --- 3. STORE / UPGRADE BOOK ---
        // Normal UPGRADE
        { kDrawing::imgStore + 24, { "NÂNG CẤP", 22, 0xFFFFFF, 0x202020, 2, 0, -1 } },
        // Pressed UPGRADE
        { kDrawing::imgStore + 25, { "NÂNG CẤP", 22, 0xFFFFFF, 0x202020, 2, 0, 1 } },
        // BUY normal & pressed
        { kDrawing::imgStore + 0, { "MUA", 22, 0xFFFFFF, 0x401A00, 2, 0, -1 } },
        { kDrawing::imgStore + 1, { "MUA", 22, 0xFFFFFF, 0x401A00, 2, 0, 1 } },
        // SELL normal & pressed
        { kDrawing::imgStore + 6, { "BÁN", 22, 0xFFFFFF, 0x400A00, 2, 0, -1 } },
        { kDrawing::imgStore + 7, { "BÁN", 22, 0xFFFFFF, 0x400A00, 2, 0, 1 } },
        // UNEQUIP normal & pressed
        { kDrawing::imgStore + 19, { "THÁO", 22, 0xFFFFFF, 0x400A00, 2, 0, -1 } },
        { kDrawing::imgStore + 20, { "THÁO", 22, 0xFFFFFF, 0x400A00, 2, 0, 1 } },
        // NEED MORE GOLD
        { kDrawing::imgStore + 35, { "THIẾU VÀNG", 17, 0xDDDDDD, 0x333333, 2, 0, 0 } },
        // Navigation tabs
        { kDrawing::imgStore + 8,  { "CỬA HÀNG", 15, 0xFFFFFF, 0x401500, 2, 0, 0 } },
        { kDrawing::imgStore + 9,  { "CỬA HÀNG", 15, 0xFFFFFF, 0x401500, 2, 0, 1 } },
        { kDrawing::imgStore + 10, { "CỬA HÀNG", 15, 0xFFFFFF, 0x401500, 2, 0, 0 } },
        { kDrawing::imgStore + 11, { "CỬA HÀNG", 15, 0xFFFFFF, 0x401500, 2, 0, 1 } },
        { kDrawing::imgStore + 2,  { "TƯỚNG", 15, 0xFFFFFF, 0x401500, 2, 0, 0 } },
        { kDrawing::imgStore + 3,  { "TƯỚNG", 15, 0xFFFFFF, 0x401500, 2, 0, 1 } },
        { kDrawing::imgStore + 4,  { "TƯỚNG", 15, 0xFFFFFF, 0x401500, 2, 0, 0 } },
        { kDrawing::imgStore + 5,  { "TƯỚNG", 15, 0xFFFFFF, 0x401500, 2, 0, 1 } },
        { kDrawing::imgStore + 21, { "QUÂN LÍNH", 15, 0xFFFFFF, 0x401500, 2, 0, 0 } },
        { kDrawing::imgStore + 22, { "QUÂN LÍNH", 15, 0xFFFFFF, 0x401500, 2, 0, 1 } },

        // --- 4. PAUSE SCREEN ---
        // Normal RESUME (gold)
        { kDrawing::imgPause + 4, { "TIẾP TỤC", 24, 0xFFFFFF, 0x301800, 2, 0, -1 } },
        // Pressed RESUME
        { kDrawing::imgPause + 3, { "TIẾP TỤC", 24, 0xFFFFFF, 0x301800, 2, 0, 1 } },
        // Normal GIVE UP (ruby red)
        { kDrawing::imgPause + 2, { "BỎ CUỘC", 24, 0xFFFFFF, 0x300505, 2, 0, -1 } },
        // Pressed GIVE UP
        { kDrawing::imgPause + 1, { "BỎ CUỘC", 24, 0xFFFFFF, 0x300505, 2, 0, 1 } },

        // --- 5. STAGE CLEAR SCREEN ---
        // Normal OK / CONTINUE
#if defined(PALADOG_HANDHELD)
        { kDrawing::imgStageClear + 3, { "[A] TIẾP TỤC", 21, 0xFFFFFF, 0x301800, 2, -6, -1 } },
        { kDrawing::imgStageClear + 2, { "[A] TIẾP TỤC", 21, 0xFFFFFF, 0x301800, 2, -6, 1 } },
        // --- 6. DEFEAT / FAIL SCREEN ---
        // Normal RETRY
        { kDrawing::imgFail + 2, { "[A] THỬ LẠI", 22, 0xFFFFFF, 0x300505, 2, 0, -1 } },
        { kDrawing::imgFail + 3, { "[A] THỬ LẠI", 22, 0xFFFFFF, 0x300505, 2, 0, 1 } },
#else
        { kDrawing::imgStageClear + 3, { "TIẾP TỤC", 24, 0xFFFFFF, 0x301800, 2, 0, -1 } },
        { kDrawing::imgStageClear + 2, { "TIẾP TỤC", 24, 0xFFFFFF, 0x301800, 2, 0, 1 } },
        // --- 6. DEFEAT / FAIL SCREEN ---
        // Normal RETRY
        { kDrawing::imgFail + 2, { "THỬ LẠI", 24, 0xFFFFFF, 0x300505, 2, 0, -1 } },
        { kDrawing::imgFail + 3, { "THỬ LẠI", 24, 0xFFFFFF, 0x300505, 2, 0, 1 } },
#endif

        // --- 7. MENU / SLOT SCREEN ---
        // START / PLAY normal & pressed
        { kDrawing::imgMenu + 2,  { "BẮT ĐẦU", 24, 0xFFFFFF, 0x0A2832, 2, 0, -1 } },
        { kDrawing::imgMenu + 13, { "BẮT ĐẦU", 24, 0xFFFFFF, 0x0A2832, 2, 0, 1 } },
        // DELETE normal & pressed
        { kDrawing::imgMenu + 14, { "XÓA", 22, 0xFFFFFF, 0x300505, 2, 0, -1 } },
        { kDrawing::imgMenu + 15, { "XÓA", 22, 0xFFFFFF, 0x300505, 2, 0, 1 } },
        // YES (CÓ) normal & pressed
        { kDrawing::imgMenu + 20, { "CÓ", 22, 0xFFFFFF, 0x201505, 2, 0, -1 } },
        { kDrawing::imgMenu + 21, { "CÓ", 22, 0xFFFFFF, 0x201505, 2, 0, 1 } },
        // NO (KHÔNG) normal & pressed
        { kDrawing::imgMenu + 22, { "KHÔNG", 20, 0xFFFFFF, 0x201505, 2, 0, -1 } },
        { kDrawing::imgMenu + 23, { "KHÔNG", 20, 0xFFFFFF, 0x201505, 2, 0, 1 } },

        // --- 8. LEVEL UP IN BATTLE ---
        { kDrawing::imgLevelUp + 1, { "CHỌN KỸ NĂNG", 20, 0xFFE020, 0x381000, 2, 0, 0 } },

        // --- 9. CINEMA SKIP ---
        { kDrawing::imgCinemaBtn + 1, { "BỎ QUA", 16, 0xFFFFFF, 0x202020, 2, 0, -1 } },
        { kDrawing::imgCinemaBtn + 0, { "BỎ QUA", 16, 0xFFFFFF, 0x202020, 2, 0, 1 } },

        // --- 10. LOADING SCREEN ---
        { kDrawing::imgLoading, { "ĐANG TẢI...", 20, 0xFFE614, 0x502000, 2, 0, 0 } },

        // --- 11. EVENT MINI-GAMES & DIALOGS ---
        { kDrawing::imgEventBtn + 0, { "TIẾP TỤC", 20, 0xFFFFFF, 0x052A30, 2, 0, -1 } },
        { kDrawing::imgEventBtn + 1, { "TIẾP TỤC", 20, 0xFFFFFF, 0x052A30, 2, 0, 1 } },
        { kDrawing::imgEventBtn + 2, { "BỎ QUA", 20, 0xFFFFFF, 0x301505, 2, 0, -1 } },
        { kDrawing::imgEventBtn + 3, { "BỎ QUA", 20, 0xFFFFFF, 0x301505, 2, 0, 1 } },
    };
    return reg;
}

bool draw(Lib* lib, int spriteIdx, int screenX, int screenY, int w, int h, int alpha) {
#if defined(PALADOG_LANG_EN)
    (void)lib; (void)spriteIdx; (void)screenX; (void)screenY; (void)w; (void)h; (void)alpha;
    return false; // In English, original Flash button sprites already have English art & text
#else
    if (!lib) return false;
    const auto& reg = getRegistry();
    auto it = reg.find(spriteIdx);
    if (it == reg.end()) return false;

    const ButtonDef& def = it->second;
    const int cx = screenX + (w / 2) + def.offsetX;
    const int cy = screenY + (h / 2) + def.offsetY;

    // Draw perfectly centered border text with active alpha
    lib->drawBorderText(
        def.text,
        def.sizePx,
        cx,
        cy,
        def.borderRgb,
        def.fillRgb,
        def.borderW,
        alpha,
        kDrawing::HCENTER | kDrawing::VCENTER
    );
    return true;
#endif
}

} // namespace UiOverlay
