#pragma once

#include <string>

class Lib;

namespace UiOverlay {

// Called from Lib::drawImg and Lib::drawImgAlpha to overlay sharp vector TTF text
// on top of clean blank button / banner sprites.
bool draw(Lib* lib, int spriteIdx, int screenX, int screenY, int w, int h, int alpha = 100);

} // namespace UiOverlay
