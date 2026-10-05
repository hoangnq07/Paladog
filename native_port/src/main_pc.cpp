// Paladog native (C++/SDL2) entry point for Windows/Linux PCs and the R36S
// (ArkOS / PortMaster). Emulates the Flash runtime loop: a 60 Hz timer that
// calls Drawing.paint() and reports missed frames through nLeakFrame.
#include <SDL.h>
#include <SDL_image.h>

#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <map>
#include <string>
#include <vector>

#include "engine/audio.h"
#include "engine/gfx.h"
#include "engine/text.h"
#include "gen/classes.h"
#include "generated/constants.h"

namespace {

FILE* gLogFile = nullptr;

void logOutput(void*, int, SDL_LogPriority, const char* msg) {
    std::fprintf(stderr, "%s\n", msg);
    if (gLogFile) {
        std::fprintf(gLogFile, "%s\n", msg);
        std::fflush(gLogFile);
    }
}

bool fileExists(const std::string& p) {
    SDL_RWops* rw = SDL_RWFromFile(p.c_str(), "rb");
    if (!rw) return false;
    SDL_RWclose(rw);
    return true;
}

std::string findAssetDir() {
    std::vector<std::string> candidates;
    if (const char* env = SDL_getenv("PALADOG_ASSETS")) candidates.emplace_back(std::string(env) + "/");
    if (char* base = SDL_GetBasePath()) {
        candidates.emplace_back(std::string(base) + "assets/");
        candidates.emplace_back(std::string(base) + "../assets/");
        SDL_free(base);
    }
    candidates.emplace_back("assets/");
    candidates.emplace_back("../assets/");
    for (const auto& c : candidates)
        if (fileExists(c + "atlases/fdat_31.txt")) return c;
    return "assets/";
}

// SDL keycode -> Flash Keyboard.keyCode.
int flashKeyCode(SDL_Keycode k) {
    if (k >= SDLK_a && k <= SDLK_z) return 'A' + (k - SDLK_a);
    if (k >= SDLK_0 && k <= SDLK_9) return '0' + (k - SDLK_0);
    if (k >= SDLK_KP_1 && k <= SDLK_KP_9) return '1' + (k - SDLK_KP_1);
    if (k == SDLK_KP_0) return '0';
    switch (k) {
        case SDLK_RETURN: case SDLK_KP_ENTER: return 13;
        case SDLK_ESCAPE: return 27;
        case SDLK_SPACE: return 32;
        case SDLK_LEFT: return 37;
        case SDLK_UP: return 38;
        case SDLK_RIGHT: return 39;
        case SDLK_DOWN: return 40;
        case SDLK_BACKSPACE: return 8;
        case SDLK_TAB: return 9;
        case SDLK_LSHIFT: case SDLK_RSHIFT: return 16;
        case SDLK_LCTRL: case SDLK_RCTRL: return 17;
        default: return -1;
    }
}

// Gamepad state. Button/axis state is kept from events (not polled) so that the
// synthetic --pad/--axis test events behave like a real controller.
//
// Gameplay (MAIN_GAME + GAME_PLAY): D-pad/left stick = move, L1/R1 = select unit,
// A = summon selected unit, X/Y/B = mace skills J/K/L, L2/R2 = scroll camera,
// Start = pause (ESC).
// Everywhere else the original UI is mouse/touch only, so a virtual cursor is
// driven by D-pad/sticks (L1 = slow, R1 = fast); A = click, B = ESC, X = ENTER,
// Start = ENTER (title screen: click PLAY).
struct Pad {
    bool btn[SDL_CONTROLLER_BUTTON_MAX] = {};
    int axis[SDL_CONTROLLER_AXIS_MAX] = {};
    int sentKey[SDL_CONTROLLER_BUTTON_MAX];  // key sent on press (-1 none, -2 mouse click)
    float cx = 380, cy = 285;                 // virtual cursor (stage coordinates)
    bool cursor = false;                      // cursor visible
    bool used = false;                        // last input came from the gamepad
    int sel = 0;                              // selected unit slot (0..8)
    int clickUpIn = -1;                       // frames until a synthetic mouse release
    int stickDir = 0;                         // -1 left, 1 right
    bool trig[2] = {false, false};            // L2 / R2 held
    Pad() {
        for (int& k : sentKey) k = -1;
    }
};

struct Options {
    bool fullscreen = false;
    std::map<int, std::string> shots;  // frame -> png path
    int quitAfter = -1;
    std::vector<std::pair<int, int>> keyScript;  // frame -> flash key
    struct Click { int frame, x, y; };
    std::vector<Click> clicks;  // frame -> stage coordinates
    struct PadEv { int frame, id, value; };
    std::vector<PadEv> padButtons;  // --pad FRAME:BUTTON:1|0 (synthetic controller events)
    std::vector<PadEv> padAxes;     // --axis FRAME:AXIS:VALUE
    bool fast = false;          // --fast: no frame pacing (automated tests)
};

Options parseArgs(int argc, char** argv) {
    Options o;
#if defined(PALADOG_HANDHELD)
    o.fullscreen = true;
#endif
    for (int i = 1; i < argc; ++i) {
        const std::string a = argv[i];
        if (a == "--fullscreen") {
            o.fullscreen = true;
        } else if (a == "--windowed") {
            o.fullscreen = false;
        } else if (a == "--fast") {
            o.fast = true;
        } else if (a == "--shot" && i + 1 < argc) {
            // --shot FRAME:path.png
            const std::string v = argv[++i];
            const size_t c = v.find(':');
            if (c != std::string::npos) o.shots[std::atoi(v.substr(0, c).c_str())] = v.substr(c + 1);
        } else if (a == "--quit-after" && i + 1 < argc) {
            o.quitAfter = std::atoi(argv[++i]);
        } else if (a == "--key" && i + 1 < argc) {
            // --key FRAME:KEYCODE (automated tests)
            const std::string v = argv[++i];
            const size_t c = v.find(':');
            if (c != std::string::npos)
                o.keyScript.emplace_back(std::atoi(v.substr(0, c).c_str()), std::atoi(v.substr(c + 1).c_str()));
        } else if (a == "--click" && i + 1 < argc) {
            // --click FRAME:X:Y (automated tests, stage coordinates)
            int f = 0, x = 0, y = 0;
            if (std::sscanf(argv[++i], "%d:%d:%d", &f, &x, &y) == 3) o.clicks.push_back({f, x, y});
        } else if (a == "--pad" && i + 1 < argc) {
            int f = 0, b = 0, d = 1;
            if (std::sscanf(argv[++i], "%d:%d:%d", &f, &b, &d) >= 2) o.padButtons.push_back({f, b, d});
        } else if (a == "--axis" && i + 1 < argc) {
            int f = 0, ax = 0, v = 0;
            if (std::sscanf(argv[++i], "%d:%d:%d", &f, &ax, &v) == 3) o.padAxes.push_back({f, ax, v});
        }
    }
    return o;
}

} // namespace

int main(int argc, char** argv) {
    const Options opt = parseArgs(argc, argv);
    gLogFile = std::fopen("paladog.log", "w");
    SDL_LogSetOutputFunction(logOutput, nullptr);
    SDL_SetHint(SDL_HINT_RENDER_SCALE_QUALITY, "1");
    if (SDL_Init(SDL_INIT_VIDEO | SDL_INIT_AUDIO | SDL_INIT_GAMECONTROLLER | SDL_INIT_TIMER) != 0) {
        std::fprintf(stderr, "SDL_Init failed: %s\n", SDL_GetError());
        return 1;
    }
    IMG_Init(IMG_INIT_PNG);

    const std::string assets = findAssetDir();
    SDL_Log("Assets: %s", assets.c_str());

    Gfx gfx;
#if defined(PALADOG_LANG_EN)
    if (!gfx.init("Paladog", 760, 570, opt.fullscreen)) return 1;
#else
    if (!gfx.init("Paladog (Việt hoá)", 760, 570, opt.fullscreen)) return 1;
#endif
    Audio audio;
    audio.init(kLibrary::MAXSIZE_EFFECTCHANNEL);
    TextCache text;
    std::string fontPath = assets + "fonts/font.ttf";
    if (FILE* f = std::fopen(fontPath.c_str(), "rb")) {
        std::fclose(f);
    } else {
        fontPath = assets + "fonts/BeVietnamPro-Bold.ttf";
    }
    text.init(&gfx, fontPath);

    SDL_GameController* pad = nullptr;
    for (int i = 0; i < SDL_NumJoysticks() && !pad; ++i)
        if (SDL_IsGameController(i)) pad = SDL_GameControllerOpen(i);
    if (opt.fullscreen) SDL_ShowCursor(SDL_DISABLE);

    {
        Drawing game;
        game.setNative(&gfx, &audio, &text, assets);
        as3::setTimerOrigin();
        if (char* pref = SDL_GetPrefPath("paladog", "paladog-vn")) {
            as3::setSaveDir(pref);
            SDL_free(pref);
        }
        game.initApp();

        const double periodMs = 1000.0 / kDrawing::FPS;
        const double freq = static_cast<double>(SDL_GetPerformanceFrequency());
        auto nowMs = [&]() { return SDL_GetPerformanceCounter() * 1000.0 / freq; };
        double next = nowMs();
        int frame = 0;
        bool running = true;
        Pad pd;
        // Gameplay layout only while the stage is actually being played.
        auto inPlay = [&]() {
            return game.nMainState == kDrawing::MAIN_GAME && game.nGameScene == kDrawing::GAME_PLAY;
        };

        while (running) {
            SDL_Event e;
            while (SDL_PollEvent(&e)) {
                switch (e.type) {
                    case SDL_QUIT: running = false; break;
                    case SDL_KEYDOWN:
                        if (e.key.keysym.sym == SDLK_F11 ||
                            (e.key.keysym.sym == SDLK_RETURN && (e.key.keysym.mod & KMOD_ALT))) {
                            gfx.toggleFullscreen();
                        } else if (e.key.keysym.sym == SDLK_F12) {
                            gfx.saveScreenshot("paladog_screenshot.png");
                        } else if (!e.key.repeat) {
                            const int k = flashKeyCode(e.key.keysym.sym);
                            pd.used = false;
                            pd.cursor = false;
                            if (k >= 0) game.keyDown(k);
                        }
                        break;
                    case SDL_KEYUP: {
                        const int k = flashKeyCode(e.key.keysym.sym);
                        if (k >= 0) game.keyUp(k);
                        break;
                    }
                    case SDL_MOUSEBUTTONDOWN:
                    case SDL_MOUSEBUTTONUP:
                    case SDL_MOUSEMOTION: {
                        int x = 0, y = 0;
                        const int wx = e.type == SDL_MOUSEMOTION ? e.motion.x : e.button.x;
                        const int wy = e.type == SDL_MOUSEMOTION ? e.motion.y : e.button.y;
                        gfx.windowToLogical(wx, wy, x, y);
                        if (e.type == SDL_MOUSEBUTTONDOWN && e.button.button == SDL_BUTTON_LEFT) {
                            game.mouseDown(x, y);
                        } else if (e.type == SDL_MOUSEBUTTONUP && e.button.button == SDL_BUTTON_LEFT) {
                            game.mouseUp(x, y);
                        } else if (e.type == SDL_MOUSEMOTION) {
                            game.mouseMove(x, y);
                        }
                        // A real mouse takes over from the virtual gamepad cursor.
                        pd.cx = static_cast<float>(x);
                        pd.cy = static_cast<float>(y);
                        pd.cursor = false;
                        pd.used = false;
                        break;
                    }
                    case SDL_CONTROLLERDEVICEADDED:
                        if (!pad && SDL_IsGameController(e.cdevice.which)) pad = SDL_GameControllerOpen(e.cdevice.which);
                        break;
                    case SDL_CONTROLLERBUTTONDOWN: {
                        const int b = e.cbutton.button;
                        if (b < 0 || b >= SDL_CONTROLLER_BUTTON_MAX) break;
                        pd.btn[b] = true;
                        // Select + Start quits (PortMaster convention).
                        if (pd.btn[SDL_CONTROLLER_BUTTON_BACK] && pd.btn[SDL_CONTROLLER_BUTTON_START]) {
                            running = false;
                            break;
                        }
                        pd.used = true;
                        const bool play = inPlay();
                        if (!play) pd.cursor = true;
                        auto send = [&](int key) {
                            game.keyDown(key);
                            pd.sentKey[b] = key;
                        };
                        switch (b) {
                            case SDL_CONTROLLER_BUTTON_DPAD_LEFT: if (play) send(37); break;
                            case SDL_CONTROLLER_BUTTON_DPAD_RIGHT: if (play) send(39); break;
                            case SDL_CONTROLLER_BUTTON_A:
                                if (play) {
                                    send('1' + pd.sel);  // summon the selected unit
                                } else {
                                    game.mouseDown(static_cast<int>(pd.cx), static_cast<int>(pd.cy));
                                    pd.sentKey[b] = -2;
                                }
                                break;
                            case SDL_CONTROLLER_BUTTON_B: send(play ? 'L' : 27); break;
                            case SDL_CONTROLLER_BUTTON_X: send(play ? 'J' : 13); break;
                            case SDL_CONTROLLER_BUTTON_Y: if (play) send('K'); break;
                            case SDL_CONTROLLER_BUTTON_LEFTSHOULDER: if (play) pd.sel = (pd.sel + 8) % 9; break;
                            case SDL_CONTROLLER_BUTTON_RIGHTSHOULDER: if (play) pd.sel = (pd.sel + 1) % 9; break;
                            case SDL_CONTROLLER_BUTTON_START:
                                if (play) {
                                    send(27);  // pause
                                } else if (game.nMainState == kDrawing::MAIN_TITLE) {
                                    // Title PLAY is mouse-only (ENTER opens the password box).
                                    pd.cx = 110;
                                    pd.cy = 490;
                                    game.mouseDown(110, 490);
                                    pd.clickUpIn = 3;
                                } else {
                                    send(13);
                                }
                                break;
                            default: break;
                        }
                        break;
                    }
                    case SDL_CONTROLLERBUTTONUP: {
                        const int b = e.cbutton.button;
                        if (b < 0 || b >= SDL_CONTROLLER_BUTTON_MAX) break;
                        pd.btn[b] = false;
                        const int k = pd.sentKey[b];
                        if (k >= 0) game.keyUp(k);
                        else if (k == -2) game.mouseUp(static_cast<int>(pd.cx), static_cast<int>(pd.cy));
                        pd.sentKey[b] = -1;
                        break;
                    }
                    case SDL_CONTROLLERAXISMOTION: {
                        const int a = e.caxis.axis;
                        const int v = e.caxis.value;
                        if (a < 0 || a >= SDL_CONTROLLER_AXIS_MAX) break;
                        pd.axis[a] = v;
                        if (std::abs(v) > 16000) pd.used = true;
                        const bool play = inPlay();
                        if (a == SDL_CONTROLLER_AXIS_LEFTX) {
                            // In gameplay the left stick walks (like the D-pad).
                            const int dir = !play ? 0 : (v < -16000 ? -1 : (v > 16000 ? 1 : 0));
                            if (dir != pd.stickDir) {
                                if (pd.stickDir != 0) game.keyUp(pd.stickDir < 0 ? 37 : 39);
                                if (dir != 0) game.keyDown(dir < 0 ? 37 : 39);
                                pd.stickDir = dir;
                            }
                        } else if (a == SDL_CONTROLLER_AXIS_TRIGGERLEFT || a == SDL_CONTROLLER_AXIS_TRIGGERRIGHT) {
                            // L2/R2 scroll the camera (Q/E).
                            const int i = a == SDL_CONTROLLER_AXIS_TRIGGERLEFT ? 0 : 1;
                            const bool on = play && v > 16000;
                            if (on != pd.trig[i]) {
                                pd.trig[i] = on;
                                if (on) game.keyDown(i ? 'E' : 'Q');
                                else game.keyUp(i ? 'E' : 'Q');
                            }
                        }
                        break;
                    }
                    default: break;
                }
            }

            const double now = nowMs();
            if (opt.fast) next = now;
            if (now + 0.25 < next) {
                const double wait = next - now;
                if (wait > 2.0) SDL_Delay(static_cast<Uint32>(wait - 1.0));
                continue;
            }
            // Missed periods become nLeakFrame (like Drawing.sleep()).
            int leak = static_cast<int>((now - next) / periodMs);
            if (leak > 4) leak = 4;
            next += periodMs * (1 + leak);
            if (now - next > 250.0) next = now + periodMs;  // resync after stalls (loading)

            if (opt.fast) as3::setVirtualTimer(static_cast<int>(frame * periodMs));
            for (const auto& c : opt.clicks) {
                if (c.frame == frame) game.mouseDown(c.x, c.y);
                if (c.frame + 3 == frame) game.mouseUp(c.x, c.y);
            }
            for (const auto& ks : opt.keyScript) {
                if (ks.first == frame) game.keyDown(ks.second);
                if (ks.first + 2 == frame) game.keyUp(ks.second);
            }

            // Synthetic controller events for automated tests (--pad / --axis).
            for (const auto& pe : opt.padButtons) {
                if (pe.frame != frame) continue;
                SDL_Event ev;
                SDL_zero(ev);
                ev.type = pe.value ? SDL_CONTROLLERBUTTONDOWN : SDL_CONTROLLERBUTTONUP;
                ev.cbutton.button = static_cast<Uint8>(pe.id);
                SDL_PushEvent(&ev);
            }
            for (const auto& pa : opt.padAxes) {
                if (pa.frame != frame) continue;
                SDL_Event ev;
                SDL_zero(ev);
                ev.type = SDL_CONTROLLERAXISMOTION;
                ev.caxis.axis = static_cast<Uint8>(pa.id);
                ev.caxis.value = static_cast<Sint16>(pa.value);
                SDL_PushEvent(&ev);
            }

            if (pd.clickUpIn > 0 && --pd.clickUpIn == 0)
                game.mouseUp(static_cast<int>(pd.cx), static_cast<int>(pd.cy));
            if (!inPlay()) {
                if (pad) {
                    pd.axis[SDL_CONTROLLER_AXIS_LEFTX] = SDL_GameControllerGetAxis(pad, SDL_CONTROLLER_AXIS_LEFTX);
                    pd.axis[SDL_CONTROLLER_AXIS_LEFTY] = SDL_GameControllerGetAxis(pad, SDL_CONTROLLER_AXIS_LEFTY);
                    pd.btn[SDL_CONTROLLER_BUTTON_DPAD_LEFT] = SDL_GameControllerGetButton(pad, SDL_CONTROLLER_BUTTON_DPAD_LEFT);
                    pd.btn[SDL_CONTROLLER_BUTTON_DPAD_RIGHT] = SDL_GameControllerGetButton(pad, SDL_CONTROLLER_BUTTON_DPAD_RIGHT);
                    pd.btn[SDL_CONTROLLER_BUTTON_DPAD_UP] = SDL_GameControllerGetButton(pad, SDL_CONTROLLER_BUTTON_DPAD_UP);
                    pd.btn[SDL_CONTROLLER_BUTTON_DPAD_DOWN] = SDL_GameControllerGetButton(pad, SDL_CONTROLLER_BUTTON_DPAD_DOWN);
                }

                auto getAxis = [&](int a, float deadzone = 0.32f) {
                    const float raw = pd.axis[a] / 32768.f;
                    const float mag = std::fabs(raw);
                    if (mag <= deadzone) return 0.f;
                    const float rescaled = (mag - deadzone) / (1.f - deadzone);
                    return raw > 0.f ? rescaled : -rescaled;
                };

                const float dpadX = (pd.btn[SDL_CONTROLLER_BUTTON_DPAD_RIGHT] ? 1.f : 0.f) -
                                    (pd.btn[SDL_CONTROLLER_BUTTON_DPAD_LEFT] ? 1.f : 0.f);
                const float dpadY = (pd.btn[SDL_CONTROLLER_BUTTON_DPAD_DOWN] ? 1.f : 0.f) -
                                    (pd.btn[SDL_CONTROLLER_BUTTON_DPAD_UP] ? 1.f : 0.f);
                float stickX = getAxis(SDL_CONTROLLER_AXIS_LEFTX, 0.32f);
                float stickY = getAxis(SDL_CONTROLLER_AXIS_LEFTY, 0.32f);

                float dx = stickX + dpadX;
                float dy = stickY + dpadY;
                dx = std::max(-1.f, std::min(1.f, dx));
                dy = std::max(-1.f, std::min(1.f, dy));
                if (dx != 0.f || dy != 0.f) {
                    const float speed = pd.btn[SDL_CONTROLLER_BUTTON_RIGHTSHOULDER]  ? 18.f
                                        : pd.btn[SDL_CONTROLLER_BUTTON_LEFTSHOULDER] ? 3.f
                                                                                      : 8.f;
                    pd.cx = std::max(0.f, std::min(759.f, pd.cx + dx * speed));
                    pd.cy = std::max(0.f, std::min(569.f, pd.cy + dy * speed));
                    pd.cursor = true;
                    pd.used = true;
                    game.mouseMove(static_cast<int>(pd.cx), static_cast<int>(pd.cy));
                }
            }

            game.runFrame(leak);
            text.endFrame();
            // Gamepad overlays: selected unit slot while playing, cursor elsewhere.
            if (inPlay()) {
                if (pd.used) {
                    const int x0 = 20 + pd.sel * 81, y0 = 398, w = 78, h = 78, t = 3;
                    gfx.fillRect(x0, y0, w, t, 0xFFE23A);
                    gfx.fillRect(x0, y0 + h - t, w, t, 0xFFE23A);
                    gfx.fillRect(x0, y0, t, h, 0xFFE23A);
                    gfx.fillRect(x0 + w - t, y0, t, h, 0xFFE23A);
                }
            } else if (pd.cursor) {
                gfx.drawCursor(static_cast<int>(pd.cx), static_cast<int>(pd.cy));
            }
            auto shot = opt.shots.find(frame);
            if (shot != opt.shots.end()) {
                if (gfx.saveScreenshot(shot->second))
                    SDL_Log("frame %d -> %s (textures: %d, %d MB)", frame, shot->second.c_str(),
                            static_cast<int>(gfx.liveTextures()),
                            static_cast<int>(gfx.liveTextureBytes() >> 20));
            }
            gfx.endFrame();
            ++frame;
            if (opt.quitAfter >= 0 && frame >= opt.quitAfter) running = false;
        }
    }

    if (pad) SDL_GameControllerClose(pad);
    text.shutdown();
    audio.shutdown();
    gfx.shutdown();
    IMG_Quit();
    SDL_Quit();
    return 0;
}
