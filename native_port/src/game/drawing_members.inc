// Hand-written members of the generated `struct Drawing` (included from src/gen/classes.h).
// Everything that has no ActionScript counterpart (SDL glue, input state, ...) goes here;
// the implementations live in src/game/drawing_ext.cpp.
Gfx* gfx = nullptr;
Audio* audio = nullptr;
TextCache* text = nullptr;
std::string assetDir;

// Native replacement for the Flash display-list / event plumbing.
void setNative(Gfx* g, Audio* a, TextCache* t, const std::string& assets);
void runFrame(int leakFrames);  // one Timer tick: nLeakFrame = leak; paint()
void keyDown(int flashKeyCode);
void keyUp(int flashKeyCode);
void mouseDown(int x, int y);
void mouseUp(int x, int y);
void mouseMove(int x, int y);
