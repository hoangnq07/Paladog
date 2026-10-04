// Minimal re-implementation of the Flash runtime pieces Paladog relies on.
// Kept deliberately tiny: the goal is that ported game code can be a near
// line-by-line translation of the decompiled ActionScript.
#pragma once

#include <cmath>
#include <cstdint>

namespace flash {

// flash.geom.Matrix (same operation order / semantics as AS3).
struct Matrix {
    double a = 1, b = 0, c = 0, d = 1, tx = 0, ty = 0;

    Matrix() = default;
    Matrix(double a_, double b_, double c_, double d_, double tx_, double ty_)
        : a(a_), b(b_), c(c_), d(d_), tx(tx_), ty(ty_) {}

    void translate(double dx, double dy) { tx += dx; ty += dy; }

    void scale(double sx, double sy) {
        a *= sx; b *= sy;
        c *= sx; d *= sy;
        tx *= sx; ty *= sy;
    }

    void rotate(double q) {
        const double cs = std::cos(q), sn = std::sin(q);
        const double na = a * cs - b * sn, nb = a * sn + b * cs;
        const double nc = c * cs - d * sn, nd = c * sn + d * cs;
        const double ntx = tx * cs - ty * sn, nty = tx * sn + ty * cs;
        a = na; b = nb; c = nc; d = nd; tx = ntx; ty = nty;
    }

    void apply(double x, double y, float& ox, float& oy) const {
        ox = static_cast<float>(a * x + c * y + tx);
        oy = static_cast<float>(b * x + d * y + ty);
    }
};

// The game only ever uses a handful of ColorTransform offset presets; each one
// gets its own lazily generated texture variant so the result is pixel-exact.
enum class Tint : uint8_t {
    None = 0,
    Damage,     // greenOffset -128, blueOffset -128   (drawObjDmg*)
    Ice,        // redOffset -128,  greenOffset -128   (drawObjIceDmg*)
    AttackHit,  // greenOffset -64, blueOffset -128    (drawAttackedImgZoomDodge true)
    AttackDark, // redOffset -32,   greenOffset -32    (drawAttackedImgZoomDodge false)
    Gray,       // (r+g+b)/3 on non-transparent pixels  (drawGrayImg)
    Count
};

// BlendMode strings used by the game: NORMAL, ADD and ALPHA (ALPHA is turned
// into NORMAL by the game code itself before it reaches BitmapData.draw).
enum class Blend : uint8_t { Normal = 0, Add };

// AS3 int()/ToInt32 conversion of a Number.
inline int32_t toInt(double v) {
    if (!std::isfinite(v)) return 0;
    const double t = std::trunc(v);
    if (t >= -2147483648.0 && t <= 2147483647.0) return static_cast<int32_t>(t);
    return static_cast<int32_t>(static_cast<uint32_t>(static_cast<int64_t>(std::fmod(t, 4294967296.0))));
}

} // namespace flash
