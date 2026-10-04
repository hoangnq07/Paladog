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
#if defined(PALADOG_HANDHELD)
    bool used = true;                         // handheld always defaults to controller mode
#else
    bool used = false;                        // last input came from the gamepad
#endif
    int sel = 0;                              // selected unit slot (0..8)
    int levelUpSel = 0;                       // selected level-up card (0..2)
    int warRoadLane = 2;                      // selected lane in WarRoad mode (0..4)
    int stickLaneDir = 0;                     // -1 up, 1 down (for analog stick lane switching)
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
    if (!gfx.init("Paladog (Viá»‡t hoÃ¡)", 760, 570, opt.fullscreen)) return 1;
    Audio audio;
    audio.init(kLibrary::MAXSIZE_EFFECTCHANNEL);
    TextCache text;
    text.init(&gfx, assets + "fonts/BeVietnamPro-Bold.ttf");

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
        // Gameplay layout only while the stage is actually being played (not during level up or pause).
        auto inPlay = [&]() {
            return game.nMainState == kDrawing::MAIN_GAME &&
                   game.nGameScene == kDrawing::GAME_PLAY &&
                   game.nGameState == kDrawing::GAME_PLAY;
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
                            pd.used = false;
                            pd.cursor = false;
                            // Direct key shortcuts for post-battle & transition screens
                            if (game.nMainState == kDrawing::MAIN_GAME && game.nGameState == kDrawing::GAME_CLEAR) {
                                if (e.key.keysym.sym == SDLK_RETURN || e.key.keysym.sym == SDLK_SPACE ||
                                    e.key.keysym.sym == SDLK_a || e.key.keysym.sym == SDLK_z || e.key.keysym.sym == SDLK_j) {
                                    if (!game.bOkBtn) {
                                        game.lib->stopMusic();
                                        game.lib->playEffect(78);
                                        game.bOkBtn = true;
                                    }
                                }
                            } else if (game.nMainState == kDrawing::MAIN_GAME && game.nGameState == kDrawing::GAME_OVER && game.nGameScene == 2) {
                                if (e.key.keysym.sym == SDLK_RETURN || e.key.keysym.sym == SDLK_SPACE ||
                                    e.key.keysym.sym == SDLK_a || e.key.keysym.sym == SDLK_z || e.key.keysym.sym == SDLK_j ||
                                    e.key.keysym.sym == SDLK_ESCAPE) {
                                    if (!game.bOkBtn) {
                                        game.lib->stopMusic();
                                        game.lib->playEffect(15);
                                        game.bOkBtn = true;
                                    }
                                }
                            } else if (game.nMainState == kDrawing::MAIN_GAME && game.nGameState == kDrawing::GAME_CINEMA) {
                                if (e.key.keysym.sym == SDLK_RETURN || e.key.keysym.sym == SDLK_SPACE ||
                                    e.key.keysym.sym == SDLK_a || e.key.keysym.sym == SDLK_z || e.key.keysym.sym == SDLK_j) {
                                    if (game.nGameScene == 0) {
                                        game.nGameFrame = 120;
                                    } else {
                                        game.bEventNextBtn = true;
                                        game.bActive = true;
                                        game.lib->playEffect(15);
                                    }
                                } else if (e.key.keysym.sym == SDLK_ESCAPE) {
                                    game.bEventSkipBtn = true;
                                    game.bActive = true;
                                    game.lib->playEffect(15);
                                }
                            } else if (game.nMainState == kDrawing::MAIN_STAGESELECT && game.nMainScene >= 1000) {
                                if (e.key.keysym.sym == SDLK_RETURN || e.key.keysym.sym == SDLK_SPACE ||
                                    e.key.keysym.sym == SDLK_a || e.key.keysym.sym == SDLK_z || e.key.keysym.sym == SDLK_j) {
                                    game.lib->playEffect(15);
                                    game.bOkBtn = true;
                                }
                            } else if (game.nMainState == kDrawing::MAIN_STAGESELECT) {
                                if (game.nMainScene == 100) {
                                    if (e.key.keysym.sym == SDLK_e) {
                                        game.lib->playEffect(15);
                                        game.bUpgradeBtn = true;
                                    }
                                } else if (game.nMainScene == 200) {
                                    if (e.key.keysym.sym == SDLK_e) {
                                        game.lib->playEffect(15);
                                        game.bStoreBtn = true;
                                    } else if (e.key.keysym.sym == SDLK_q || e.key.keysym.sym == SDLK_ESCAPE) {
                                        game.lib->playEffect(15);
                                        game.nMainScene = 100;
                                    }
                                } else if (game.nMainScene == 300) {
                                    if (e.key.keysym.sym == SDLK_e) {
                                        game.lib->playEffect(15);
                                        game.bEquipBtn = true;
                                    } else if (e.key.keysym.sym == SDLK_q) {
                                        game.lib->playEffect(15);
                                        game.bUnitBtn = true;
                                    } else if (e.key.keysym.sym == SDLK_ESCAPE) {
                                        game.lib->playEffect(15);
                                        game.nMainScene = 100;
                                    }
                                } else if (game.nMainScene == 400) {
                                    if (e.key.keysym.sym == SDLK_e || e.key.keysym.sym == SDLK_ESCAPE) {
                                        game.bEquipItemSelect = false;
                                        game.bInvenItemSelect = false;
                                        game.bDrawSortingList = false;
                                        game.lib->playEffect(15);
                                        game.bStageSelectBtn = true;
                                    } else if (e.key.keysym.sym == SDLK_q) {
                                        game.lib->playEffect(15);
                                        game.bStoreBtn = true;
                                    }
                                }
                            }

                            // In-battle shortcuts for WarRoad lane selection and keyboard navigation
                            if (inPlay() && game.player) {
                                const int mode = game.player->nGameMode;
                                if (mode == kDrawing::MODE_WARROAD) {
                                    if (e.key.keysym.sym == SDLK_UP || e.key.keysym.sym == SDLK_w) {
                                        if (pd.warRoadLane > 0) {
                                            pd.warRoadLane--;
                                            game.lib->playEffect(15);
                                        }
                                        break;
                                    } else if (e.key.keysym.sym == SDLK_DOWN || e.key.keysym.sym == SDLK_s) {
                                        if (pd.warRoadLane < 4) {
                                            pd.warRoadLane++;
                                            game.lib->playEffect(15);
                                        }
                                        break;
                                    } else if (e.key.keysym.sym == SDLK_LEFT) {
                                        if (game.player->bWarRoadSelectUnit) game.ope->resetWarRoadUnitIcon();
                                        pd.sel = (pd.sel + 8) % 9;
                                        game.lib->playEffect(15);
                                        break;
                                    } else if (e.key.keysym.sym == SDLK_RIGHT) {
                                        if (game.player->bWarRoadSelectUnit) game.ope->resetWarRoadUnitIcon();
                                        pd.sel = (pd.sel + 1) % 9;
                                        game.lib->playEffect(15);
                                        break;
                                    }

                                    if (game.player->bWarRoadSelectUnit) {
                                        if (e.key.keysym.sym == SDLK_RETURN || e.key.keysym.sym == SDLK_SPACE) {
                                            game.keyDown('1' + pd.warRoadLane);
                                            break;
                                        } else if (e.key.keysym.sym == SDLK_ESCAPE) {
                                            game.ope->resetWarRoadUnitIcon();
                                            game.lib->playEffect(15);
                                            break;
                                        } else if (e.key.keysym.sym >= SDLK_1 && e.key.keysym.sym <= SDLK_5) {
                                            pd.warRoadLane = e.key.keysym.sym - SDLK_1;
                                            game.keyDown('1' + pd.warRoadLane);
                                            break;
                                        }
                                    } else {
                                        if (e.key.keysym.sym >= SDLK_1 && e.key.keysym.sym <= SDLK_9) {
                                            pd.sel = e.key.keysym.sym - SDLK_1;
                                        } else if (e.key.keysym.sym == SDLK_RETURN || e.key.keysym.sym == SDLK_SPACE) {
                                            game.keyDown('1' + pd.sel);
                                            break;
                                        }
                                    }
                                } else {
                                    if (e.key.keysym.sym >= SDLK_1 && e.key.keysym.sym <= SDLK_9) {
                                        pd.sel = e.key.keysym.sym - SDLK_1;
                                    } else if (e.key.keysym.sym == SDLK_SPACE) {
                                        game.keyDown('1' + pd.sel);
                                        break;
                                    }
                                }
                            }

                            const int k = flashKeyCode(e.key.keysym.sym);
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
                        // Track lane and unit hover/clicks during gameplay
                        if (inPlay() && game.player) {
                            const int mode = game.player->nGameMode;
                            if (mode == kDrawing::MODE_WARROAD) {
                                if (y >= kPlayer::WARROAD_ROADTOUCHBASEY && y < kPlayer::WARROAD_ROADTOUCHBASEY + kPlayer::WARROAD_UNITBASEYGAGAP * 5) {
                                    pd.warRoadLane = (y - kPlayer::WARROAD_ROADTOUCHBASEY) / kPlayer::WARROAD_UNITBASEYGAGAP;
                                }
                                for (int i = 0; i < 9; ++i) {
                                    const int ux = 20 + i * 81;
                                    if (x >= ux && x < ux + 78 && y >= 470 && y < 470 + 78) pd.sel = i;
                                }
                            } else if (mode == kDrawing::MODE_DESTINY) {
                                for (int i = 0; i < 9; ++i) {
                                    const int ux = 24 + i * 77;
                                    if (x >= ux && x < ux + 77 && y >= 431 && y < 431 + 79) pd.sel = i;
                                }
                            } else {
                                for (int i = 0; i < 9; ++i) {
                                    const int ux = 20 + i * 81;
                                    if (x >= ux && x < ux + 78 && y >= 398 && y < 398 + 78) pd.sel = i;
                                }
                            }
                        }
                        // Hover selection tracking for Level Up cards and Upgrade Book
                        if (game.nMainState == kDrawing::MAIN_GAME && game.nGameState == kDrawing::GAME_LEVELUP) {
                            if (x >= 39 && x < 39 + 210) pd.levelUpSel = 0;
                            else if (x >= 275 && x < 275 + 210) pd.levelUpSel = 1;
                            else if (x >= 511 && x < 511 + 210) pd.levelUpSel = 2;
                        } else if (game.nMainState == kDrawing::MAIN_STAGESELECT && game.nMainScene == 200) {
                            for (int r = 0; r < 3; ++r) {
                                int ry = 125 + r * 114;
                                if (y >= ry && y < ry + 81) {
                                    for (int c = 0; c < 3; ++c) {
                                        int rx = 11 + c * 89;
                                        if (x >= rx && x < rx + 81) game.nMenuPos = r * 3 + c;
                                    }
                                }
                            }
                        }
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
                        const bool isFullPadScreen = play ||
                            (game.nMainState == kDrawing::MAIN_GAME && (game.nGameState == kDrawing::GAME_CLEAR || game.nGameState == kDrawing::GAME_OVER || game.nGameState == kDrawing::GAME_CINEMA || game.nGameState == kDrawing::GAME_LEVELUP)) ||
                            (game.nMainState == kDrawing::MAIN_TUTORIAL) ||
                            (game.nMainState == kDrawing::MAIN_INTRO) ||
                            (game.nMainState == kDrawing::MAIN_USEAGE) ||
                            (game.nMainState == kDrawing::MAIN_TITLE) ||
                            (game.nMainState == kDrawing::MAIN_STAGESELECT && game.nMainScene >= 1000);
                        if (!isFullPadScreen) pd.cursor = true;
                        auto send = [&](int key) {
                            game.keyDown(key);
                            pd.sentKey[b] = key;
                        };

                        // --- 1. In-battle Level Up screen ---
                        if (game.nMainState == kDrawing::MAIN_GAME && game.nGameState == kDrawing::GAME_LEVELUP) {
                            switch (b) {
                                case SDL_CONTROLLER_BUTTON_DPAD_LEFT:
                                    pd.levelUpSel = (pd.levelUpSel + 2) % 3;
                                    game.lib->playEffect(15);
                                    break;
                                case SDL_CONTROLLER_BUTTON_DPAD_RIGHT:
                                    pd.levelUpSel = (pd.levelUpSel + 1) % 3;
                                    game.lib->playEffect(15);
                                    break;
                                case SDL_CONTROLLER_BUTTON_A:
                                    send('1' + pd.levelUpSel);
                                    break;
                                case SDL_CONTROLLER_BUTTON_X:
                                    send('1');
                                    break;
                                case SDL_CONTROLLER_BUTTON_Y:
                                    send('2');
                                    break;
                                case SDL_CONTROLLER_BUTTON_B:
                                    send('3');
                                    break;
                                default: break;
                            }
                            break;
                        }

                        // --- 2. In-battle Pause Menu ---
                        if (game.nMainState == kDrawing::MAIN_GAME && game.nGameState == kDrawing::GAME_MENU) {
                            if (b == SDL_CONTROLLER_BUTTON_START || b == SDL_CONTROLLER_BUTTON_B) {
                                send(27);  // unpause / resume
                                break;
                            }
                        }

                        // --- 3. Stage Select (Map, Unit Upgrade Book, Store, Hero Equip) ---
                        if (game.nMainState == kDrawing::MAIN_STAGESELECT) {
                            if (game.nMainScene == 200) {
                                // Unit Upgrade Book
                                switch (b) {
                                    case SDL_CONTROLLER_BUTTON_DPAD_LEFT:
                                        if (game.nMenuPos % 3 > 0) {
                                            game.nMenuPos -= 1;
                                            game.lib->playEffect(15);
                                            game.bUnitUpgradeAct = false;
                                        }
                                        break;
                                    case SDL_CONTROLLER_BUTTON_DPAD_RIGHT:
                                        if (game.nMenuPos % 3 < 2) {
                                            game.nMenuPos += 1;
                                            game.lib->playEffect(15);
                                            game.bUnitUpgradeAct = false;
                                        }
                                        break;
                                    case SDL_CONTROLLER_BUTTON_DPAD_UP:
                                        if (game.nMenuPos >= 3) {
                                            game.nMenuPos -= 3;
                                            game.lib->playEffect(15);
                                            game.bUnitUpgradeAct = false;
                                        }
                                        break;
                                    case SDL_CONTROLLER_BUTTON_DPAD_DOWN:
                                        if (game.nMenuPos <= 5) {
                                            game.nMenuPos += 3;
                                            game.lib->playEffect(15);
                                            game.bUnitUpgradeAct = false;
                                        }
                                        break;
                                    case SDL_CONTROLLER_BUTTON_X:
                                    case SDL_CONTROLLER_BUTTON_A: {
                                        // Trigger Upgrade for selected unit
                                        if (game.player->UNITOPEN.get(game.nMenuPos).b_()) {
                                            if (game.player->UNITUPGRADE.get(game.nMenuPos).num() < kDrawing::MAX_UNITLEVEL) {
                                                int curLvl = game.player->UNITUPGRADE.get(game.nMenuPos).num();
                                                int cost = (game.player->UNITUPGRADEMONEY.get((game.nMenuPos * 20) + curLvl)).num();
                                                if (game.player->nMoney >= cost && !game.bUpgradeBtn) {
                                                    game.bUnitUpgradeAct = true;
                                                    game.nUnitUpgradeActFrame = 0;
                                                    game.nUnitUpgradeFrame = 0;
                                                    game.lib->playEffect(15);
                                                    game.bUpgradeBtn = true;
                                                }
                                            }
                                        }
                                        break;
                                    }
                                    case SDL_CONTROLLER_BUTTON_B:
                                    case SDL_CONTROLLER_BUTTON_LEFTSHOULDER:
                                        game.lib->playEffect(15);
                                        game.nMainScene = 100;  // return to map
                                        break;
                                    case SDL_CONTROLLER_BUTTON_RIGHTSHOULDER:
                                        game.lib->playEffect(15);
                                        game.bStoreBtn = true;  // go to store
                                        break;
                                    default: break;
                                }
                                break;
                            } else if (game.nMainScene == 100) {
                                // Stage select map
                                switch (b) {
                                    case SDL_CONTROLLER_BUTTON_X:
                                    case SDL_CONTROLLER_BUTTON_RIGHTSHOULDER:
                                        game.lib->playEffect(15);
                                        game.bUpgradeBtn = true;  // open Unit Upgrade
                                        break;
                                    case SDL_CONTROLLER_BUTTON_B:
                                        game.lib->playEffect(15);
                                        game.bNoBtn = true;  // return to Title
                                        break;
                                    case SDL_CONTROLLER_BUTTON_A:
                                        game.mouseDown(static_cast<int>(pd.cx), static_cast<int>(pd.cy));
                                        pd.sentKey[b] = -2;
                                        break;
                                    default: break;
                                }
                                break;
                            } else if (game.nMainScene == 300) {
                                // Store
                                switch (b) {
                                    case SDL_CONTROLLER_BUTTON_LEFTSHOULDER:
                                        game.lib->playEffect(15);
                                        game.bUnitBtn = true;
                                        break;
                                    case SDL_CONTROLLER_BUTTON_RIGHTSHOULDER:
                                        game.lib->playEffect(15);
                                        game.bEquipBtn = true;
                                        break;
                                    case SDL_CONTROLLER_BUTTON_B:
                                        game.lib->playEffect(15);
                                        game.nMainScene = 100;
                                        break;
                                    case SDL_CONTROLLER_BUTTON_A:
                                        game.mouseDown(static_cast<int>(pd.cx), static_cast<int>(pd.cy));
                                        pd.sentKey[b] = -2;
                                        break;
                                    default: break;
                                }
                                break;
                            } else if (game.nMainScene == 400) {
                                // Hero Equip
                                switch (b) {
                                    case SDL_CONTROLLER_BUTTON_LEFTSHOULDER:
                                        game.lib->playEffect(15);
                                        game.bStoreBtn = true;
                                        break;
                                    case SDL_CONTROLLER_BUTTON_RIGHTSHOULDER:
                                    case SDL_CONTROLLER_BUTTON_B:
                                        game.bEquipItemSelect = false;
                                        game.bInvenItemSelect = false;
                                        game.bDrawSortingList = false;
                                        game.lib->playEffect(15);
                                        game.bStageSelectBtn = true;
                                        break;
                                    case SDL_CONTROLLER_BUTTON_A:
                                        game.mouseDown(static_cast<int>(pd.cx), static_cast<int>(pd.cy));
                                        pd.sentKey[b] = -2;
                                        break;
                                    default: break;
                                }
                                break;
                            }
                        }

                        // --- 4. Tutorial & Usage Slides ---
                        if (game.nMainState == kDrawing::MAIN_TUTORIAL || game.nMainState == kDrawing::MAIN_USEAGE) {
                            if (b == SDL_CONTROLLER_BUTTON_A || b == SDL_CONTROLLER_BUTTON_START || b == SDL_CONTROLLER_BUTTON_X) {
                                game.lib->playEffect(71);
                                game.bOkBtn = true;
                                break;
                            }
                        }

                        // --- 5. Intro dialogues ---
                        if (game.nMainState == kDrawing::MAIN_INTRO) {
                            if (b == SDL_CONTROLLER_BUTTON_A || b == SDL_CONTROLLER_BUTTON_START || b == SDL_CONTROLLER_BUTTON_X) {
                                game.bOkBtn = true;
                                break;
                            }
                        }

                        // --- 6. Stage Clear Screen ---
                        if (game.nMainState == kDrawing::MAIN_GAME && game.nGameState == kDrawing::GAME_CLEAR) {
                            if (b == SDL_CONTROLLER_BUTTON_A || b == SDL_CONTROLLER_BUTTON_START || b == SDL_CONTROLLER_BUTTON_X) {
                                if (!game.bOkBtn) {
                                    game.lib->stopMusic();
                                    game.lib->playEffect(78);
                                    game.bOkBtn = true;
                                }
                                break;
                            }
                        }

                        // --- 7. Game Over / Defeat Screen ---
                        if (game.nMainState == kDrawing::MAIN_GAME && game.nGameState == kDrawing::GAME_OVER) {
                            if (game.nGameScene == 2) {
                                if (b == SDL_CONTROLLER_BUTTON_A || b == SDL_CONTROLLER_BUTTON_START || b == SDL_CONTROLLER_BUTTON_X || b == SDL_CONTROLLER_BUTTON_B) {
                                    if (!game.bOkBtn) {
                                        game.lib->stopMusic();
                                        game.lib->playEffect(15);
                                        game.bOkBtn = true;
                                    }
                                    break;
                                }
                            }
                        }

                        // --- 8. Cinema & Chapter Clear ---
                        if (game.nMainState == kDrawing::MAIN_GAME && game.nGameState == kDrawing::GAME_CINEMA) {
                            if (game.nGameScene == 0) {
                                if (b == SDL_CONTROLLER_BUTTON_A || b == SDL_CONTROLLER_BUTTON_START || b == SDL_CONTROLLER_BUTTON_X) {
                                    game.nGameFrame = 120;
                                    break;
                                }
                            } else if (game.nGameScene == 1) {
                                if (b == SDL_CONTROLLER_BUTTON_A || b == SDL_CONTROLLER_BUTTON_START || b == SDL_CONTROLLER_BUTTON_X) {
                                    game.bEventNextBtn = true;
                                    game.bActive = true;
                                    game.lib->playEffect(15);
                                    break;
                                } else if (b == SDL_CONTROLLER_BUTTON_B) {
                                    game.bEventSkipBtn = true;
                                    game.bActive = true;
                                    game.lib->playEffect(15);
                                    break;
                                }
                            }
                        }

                        // --- 9. Stage Select Tutorial Dialogs (Scene 1000..1002) ---
                        if (game.nMainState == kDrawing::MAIN_STAGESELECT && game.nMainScene >= 1000) {
                            if (b == SDL_CONTROLLER_BUTTON_A || b == SDL_CONTROLLER_BUTTON_START || b == SDL_CONTROLLER_BUTTON_X) {
                                game.lib->playEffect(15);
                                game.bOkBtn = true;
                                break;
                            }
                        }

                        // --- 10. Title Screen ---
                        if (game.nMainState == kDrawing::MAIN_TITLE) {
                            if (b == SDL_CONTROLLER_BUTTON_A || b == SDL_CONTROLLER_BUTTON_START) {
                                pd.cx = 110;
                                pd.cy = 490;
                                game.mouseDown(110, 490);
                                pd.clickUpIn = 3;
                                break;
                            }
                        }

                        // --- 6. In-game battle & fallback actions ---
                        if (play) {
                            const bool isWarRoad = (game.player && game.player->nGameMode == kDrawing::MODE_WARROAD);
                            if (isWarRoad && game.player->bWarRoadSelectUnit) {
                                switch (b) {
                                    case SDL_CONTROLLER_BUTTON_DPAD_UP:
                                        if (pd.warRoadLane > 0) {
                                            pd.warRoadLane--;
                                            game.lib->playEffect(15);
                                        }
                                        break;
                                    case SDL_CONTROLLER_BUTTON_DPAD_DOWN:
                                        if (pd.warRoadLane < 4) {
                                            pd.warRoadLane++;
                                            game.lib->playEffect(15);
                                        }
                                        break;
                                    case SDL_CONTROLLER_BUTTON_DPAD_LEFT:
                                    case SDL_CONTROLLER_BUTTON_LEFTSHOULDER:
                                        game.ope->resetWarRoadUnitIcon();
                                        pd.sel = (pd.sel + 8) % 9;
                                        game.lib->playEffect(15);
                                        break;
                                    case SDL_CONTROLLER_BUTTON_DPAD_RIGHT:
                                    case SDL_CONTROLLER_BUTTON_RIGHTSHOULDER:
                                        game.ope->resetWarRoadUnitIcon();
                                        pd.sel = (pd.sel + 1) % 9;
                                        game.lib->playEffect(15);
                                        break;
                                    case SDL_CONTROLLER_BUTTON_A:
                                        send('1' + pd.warRoadLane);  // confirm deploy to targeted lane
                                        break;
                                    case SDL_CONTROLLER_BUTTON_B:
                                        game.ope->resetWarRoadUnitIcon();  // cancel lane selection
                                        game.lib->playEffect(15);
                                        break;
                                    case SDL_CONTROLLER_BUTTON_START:
                                        send(27);  // pause
                                        break;
                                    default: break;
                                }
                                break;
                            }

                            switch (b) {
                                case SDL_CONTROLLER_BUTTON_DPAD_LEFT:
                                    if (isWarRoad) {
                                        pd.sel = (pd.sel + 8) % 9;
                                        game.lib->playEffect(15);
                                    } else {
                                        send(37);
                                    }
                                    break;
                                case SDL_CONTROLLER_BUTTON_DPAD_RIGHT:
                                    if (isWarRoad) {
                                        pd.sel = (pd.sel + 1) % 9;
                                        game.lib->playEffect(15);
                                    } else {
                                        send(39);
                                    }
                                    break;
                                case SDL_CONTROLLER_BUTTON_DPAD_UP:
                                    if (isWarRoad && pd.warRoadLane > 0) {
                                        pd.warRoadLane--;
                                        game.lib->playEffect(15);
                                    }
                                    break;
                                case SDL_CONTROLLER_BUTTON_DPAD_DOWN:
                                    if (isWarRoad && pd.warRoadLane < 4) {
                                        pd.warRoadLane++;
                                        game.lib->playEffect(15);
                                    }
                                    break;
                                case SDL_CONTROLLER_BUTTON_A:
                                    send('1' + pd.sel);
                                    break;
                                case SDL_CONTROLLER_BUTTON_B: send('L'); break;
                                case SDL_CONTROLLER_BUTTON_X: send('J'); break;
                                case SDL_CONTROLLER_BUTTON_Y: send('K'); break;
                                case SDL_CONTROLLER_BUTTON_LEFTSHOULDER:
                                    pd.sel = (pd.sel + 8) % 9;
                                    game.lib->playEffect(15);
                                    break;
                                case SDL_CONTROLLER_BUTTON_RIGHTSHOULDER:
                                    pd.sel = (pd.sel + 1) % 9;
                                    game.lib->playEffect(15);
                                    break;
                                case SDL_CONTROLLER_BUTTON_START:
                                    send(27);
                                    break;
                                default: break;
                            }
                        } else {
                            switch (b) {
                                case SDL_CONTROLLER_BUTTON_A:
                                    game.mouseDown(static_cast<int>(pd.cx), static_cast<int>(pd.cy));
                                    pd.sentKey[b] = -2;
                                    break;
                                case SDL_CONTROLLER_BUTTON_B: send(27); break;
                                case SDL_CONTROLLER_BUTTON_X: send(13); break;
                                case SDL_CONTROLLER_BUTTON_START:
                                    if (game.nMainState == kDrawing::MAIN_TITLE) {
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
                            if (play && game.player && game.player->nGameMode == kDrawing::MODE_WARROAD) {
                                const int sDir = v < -20000 ? -1 : (v > 20000 ? 1 : 0);
                                if (sDir != pd.stickDir) {
                                    if (sDir < 0) {
                                        if (game.player->bWarRoadSelectUnit) game.ope->resetWarRoadUnitIcon();
                                        pd.sel = (pd.sel + 8) % 9;
                                        game.lib->playEffect(15);
                                    } else if (sDir > 0) {
                                        if (game.player->bWarRoadSelectUnit) game.ope->resetWarRoadUnitIcon();
                                        pd.sel = (pd.sel + 1) % 9;
                                        game.lib->playEffect(15);
                                    }
                                    pd.stickDir = sDir;
                                }
                            } else {
                                // In gameplay the left stick walks (like the D-pad).
                                const int dir = !play ? 0 : (v < -16000 ? -1 : (v > 16000 ? 1 : 0));
                                if (dir != pd.stickDir) {
                                    if (pd.stickDir != 0) game.keyUp(pd.stickDir < 0 ? 37 : 39);
                                    if (dir != 0) game.keyDown(dir < 0 ? 37 : 39);
                                    pd.stickDir = dir;
                                }
                            }
                        } else if (a == SDL_CONTROLLER_AXIS_LEFTY) {
                            if (play && game.player && game.player->nGameMode == kDrawing::MODE_WARROAD && game.player->bWarRoadSelectUnit) {
                                const int lDir = v < -20000 ? -1 : (v > 20000 ? 1 : 0);
                                if (lDir != pd.stickLaneDir) {
                                    if (lDir < 0 && pd.warRoadLane > 0) {
                                        pd.warRoadLane--;
                                        game.lib->playEffect(15);
                                    } else if (lDir > 0 && pd.warRoadLane < 4) {
                                        pd.warRoadLane++;
                                        game.lib->playEffect(15);
                                    }
                                    pd.stickLaneDir = lDir;
                                }
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
                // Virtual cursor: D-pad + both sticks (L1 = slow, R1 = fast).
                auto ax = [&](int a) {
                    const float v = pd.axis[a] / 32768.f;
                    return std::fabs(v) < 0.25f ? 0.f : v;
                };
                const bool dpadNav = (game.nMainState == kDrawing::MAIN_GAME && game.nGameState == kDrawing::GAME_LEVELUP) ||
                                     (game.nMainState == kDrawing::MAIN_STAGESELECT && game.nMainScene == 200);
                const float dpadX = dpadNav ? 0.f : ((pd.btn[SDL_CONTROLLER_BUTTON_DPAD_RIGHT] ? 1.f : 0.f) -
                                                     (pd.btn[SDL_CONTROLLER_BUTTON_DPAD_LEFT] ? 1.f : 0.f));
                const float dpadY = dpadNav ? 0.f : ((pd.btn[SDL_CONTROLLER_BUTTON_DPAD_DOWN] ? 1.f : 0.f) -
                                                     (pd.btn[SDL_CONTROLLER_BUTTON_DPAD_UP] ? 1.f : 0.f));
                float dx = ax(SDL_CONTROLLER_AXIS_LEFTX) + ax(SDL_CONTROLLER_AXIS_RIGHTX) + dpadX;
                float dy = ax(SDL_CONTROLLER_AXIS_LEFTY) + ax(SDL_CONTROLLER_AXIS_RIGHTY) + dpadY;
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
                    // Update selection when cursor moves
                    if (game.nMainState == kDrawing::MAIN_GAME && game.nGameState == kDrawing::GAME_LEVELUP) {
                        int cx = static_cast<int>(pd.cx);
                        if (cx >= 39 && cx < 39 + 210) pd.levelUpSel = 0;
                        else if (cx >= 275 && cx < 275 + 210) pd.levelUpSel = 1;
                        else if (cx >= 511 && cx < 511 + 210) pd.levelUpSel = 2;
                    } else if (game.nMainState == kDrawing::MAIN_STAGESELECT && game.nMainScene == 200) {
                        int cx = static_cast<int>(pd.cx), cy = static_cast<int>(pd.cy);
                        for (int r = 0; r < 3; ++r) {
                            int ry = 125 + r * 114;
                            if (cy >= ry && cy < ry + 81) {
                                for (int c = 0; c < 3; ++c) {
                                    int rx = 11 + c * 89;
                                    if (cx >= rx && cx < rx + 81) game.nMenuPos = r * 3 + c;
                                }
                            }
                        }
                    }
                }
            }

            game.runFrame(leak);
            text.endFrame();

            auto drawGlowingBorder = [&](int x, int y, int w, int h, uint32_t mainColor) {
                const int t = 3;
                // Outer cyan glow accent
                gfx.fillRect(x - 2, y - 2, w + 4, 1, 0x00E5FF, 0.6);
                gfx.fillRect(x - 2, y + h + 1, w + 4, 1, 0x00E5FF, 0.6);
                gfx.fillRect(x - 2, y - 2, 1, h + 4, 0x00E5FF, 0.6);
                gfx.fillRect(x + w + 1, y - 2, 1, h + 4, 0x00E5FF, 0.6);
                // Main solid border (3px)
                gfx.fillRect(x, y, w, t, mainColor);
                gfx.fillRect(x, y + h - t, w, t, mainColor);
                gfx.fillRect(x, y, t, h, mainColor);
                gfx.fillRect(x + w - t, y, t, h, mainColor);
                // Inner bright white highlight (1px)
                gfx.fillRect(x + t, y + t, w - t * 2, 1, 0xFFFFFF, 0.7);
                gfx.fillRect(x + t, y + h - t - 1, w - t * 2, 1, 0xFFFFFF, 0.7);
                gfx.fillRect(x + t, y + t, 1, h - t * 2, 0xFFFFFF, 0.7);
                gfx.fillRect(x + w - t - 1, y + t, 1, h - t * 2, 0xFFFFFF, 0.7);
            };

            // Gamepad overlays: selected unit slot while playing, glowing selection border elsewhere.
            if (inPlay()) {
#if defined(PALADOG_HANDHELD)
                const bool showPad = true;
#else
                const bool showPad = pd.used;
#endif
                const int mode = game.player ? game.player->nGameMode : kDrawing::MODE_NORMAL;
                const bool isDestiny = (mode == kDrawing::MODE_DESTINY);
                const bool isWarRoad = (mode == kDrawing::MODE_WARROAD);

                // Mode-aware coordinates for unit card selector
                int x0, y0, w, h, promptY;
                if (isDestiny) {
                    x0 = 24 + pd.sel * 77;
                    y0 = 431;
                    w = 77;
                    h = 79;
                    promptY = 408;
                } else if (isWarRoad) {
                    x0 = 20 + pd.sel * 81;
                    y0 = 470;
                    w = 78;
                    h = 78;
                    promptY = 448;
                } else {
                    x0 = 20 + pd.sel * 81;
                    y0 = 398;
                    w = 78;
                    h = 78;
                    promptY = 376;
                }

                // In WarRoad mode, when a unit is picked, highlight the targeted deployment lane!
                if (isWarRoad && game.player && game.player->bWarRoadSelectUnit) {
                    const int ly = kPlayer::WARROAD_ROADTOUCHBASEY + pd.warRoadLane * kPlayer::WARROAD_UNITBASEYGAGAP; // 123 + lane * 54
                    // Highlight lane with glowing cyan band across the entire road
                    gfx.fillRect(10, ly + 2, 740, 50, 0x00E5FF, 0.25);
                    gfx.fillRect(10, ly + 2, 740, 2, 0x00E5FF, 0.95);
                    gfx.fillRect(10, ly + 50, 740, 2, 0x00E5FF, 0.95);
                    gfx.fillRect(10, ly + 2, 2, 50, 0x00E5FF, 0.95);
                    gfx.fillRect(748, ly + 2, 2, 50, 0x00E5FF, 0.95);

                    // Lane pointer badge on the left side
                    const char* laneNames[5] = {"LÀN 1", "LÀN 2", "LÀN 3", "LÀN 4", "LÀN 5"};
                    const int bX = 18, bY = ly + 11;
                    gfx.fillRect(bX, bY, 80, 28, 0x001B33, 0.90);
                    gfx.fillRect(bX, bY, 80, 1, 0x00E5FF);
                    gfx.fillRect(bX, bY + 27, 80, 1, 0x00E5FF);
                    gfx.fillRect(bX, bY, 1, 28, 0x00E5FF);
                    gfx.fillRect(bX + 79, bY, 1, 28, 0x00E5FF);
                    game.lib->drawBorderText(laneNames[pd.warRoadLane], 13, bX + 40, bY + 6, 0x000000, 0x00FFFF, 2, 100, kDrawing::TOP | kDrawing::HCENTER);

                    // Instruction banner at top
                    gfx.fillRect(160, 92, 440, 24, 0x000000, 0.88);
                    gfx.fillRect(160, 92, 440, 1, 0xFFEA00);
                    gfx.fillRect(160, 115, 440, 1, 0xFFEA00);
                    game.lib->drawBorderText("D-PAD: Chọn Làn    [A]: Ra Quân    [B]: Hủy", 13, 380, 96, 0x000000, 0xFFEA00, 2, 100, kDrawing::TOP | kDrawing::HCENTER);

                    // Chosen unit card at bottom gets a green glowing border to indicate it is ready to deploy
                    drawGlowingBorder(x0, y0, w, h, 0x00FF66);
                    gfx.fillRect(x0 + 4, y0 + 4, 38, 18, 0x1E7E34, 0.9);
                    gfx.fillRect(x0 + 4, y0 + 4, 38, 1, 0x55FF55);
                    gfx.fillRect(x0 + 4, y0 + 21, 38, 1, 0x55FF55);
                    gfx.fillRect(x0 + 4, y0 + 4, 1, 18, 0x55FF55);
                    gfx.fillRect(x0 + 41, y0 + 4, 1, 18, 0x55FF55);
                    game.lib->drawBorderText("CHỌN", 11, x0 + 23, y0 + 5, 0x000000, 0xFFFFFF, 1, 100, kDrawing::TOP | kDrawing::HCENTER);
                } else if (showPad) {
                    drawGlowingBorder(x0, y0, w, h, 0xFFEA00);

                    // Badge [A] inside top-left of selected unit card
                    gfx.fillRect(x0 + 4, y0 + 4, 22, 18, 0x1E7E34, 0.9);
                    gfx.fillRect(x0 + 4, y0 + 4, 22, 1, 0x55FF55);
                    gfx.fillRect(x0 + 4, y0 + 21, 22, 1, 0x55FF55);
                    gfx.fillRect(x0 + 4, y0 + 4, 1, 18, 0x55FF55);
                    gfx.fillRect(x0 + 25, y0 + 4, 1, 18, 0x55FF55);
                    game.lib->drawBorderText("A", 13, x0 + 15, y0 + 4, 0x000000, 0xFFFFFF, 1, 100, kDrawing::TOP | kDrawing::HCENTER);

                    // Prompts [L1] and [R1] to cycle units
                    const int lPromptX = isDestiny ? 24 : 20;
                    const int rPromptX = isDestiny ? 736 : 740;
                    game.lib->drawBorderText("[L1] ◀", 13, lPromptX, promptY, 0x000000, 0xFFEA00, 2, 100, kDrawing::TOP | kDrawing::LEFT);
                    game.lib->drawBorderText("▶ [R1]", 13, rPromptX, promptY, 0x000000, 0xFFEA00, 2, 100, kDrawing::TOP | kDrawing::RIGHT);
                }
            } else if (game.nMainState == kDrawing::MAIN_GAME && game.nGameState == kDrawing::GAME_LEVELUP) {
                // In-battle Level Up screen: highlight selected card and draw controller prompts
                const int cardX[3] = {39, 275, 511};
                const int cardW = 210, cardH = 320;
                const int selIdx = std::max(0, std::min(2, pd.levelUpSel));
                const int selX = cardX[selIdx];
                const int selY = 160;
                drawGlowingBorder(selX, selY, cardW, cardH, 0xFFEA00);
                game.lib->drawBorderString("[A] CHỌN", selX + cardW / 2, 485, 0x000000, 0xFFEA00, 100, kDrawing::TOP | kDrawing::HCENTER);
                game.lib->drawBorderString("[X] Thẻ 1", cardX[0] + cardW / 2, 102, 0x000000, 0x00E5FF, 100, kDrawing::TOP | kDrawing::HCENTER);
                game.lib->drawBorderString("[Y] Thẻ 2", cardX[1] + cardW / 2, 102, 0x000000, 0x00E5FF, 100, kDrawing::TOP | kDrawing::HCENTER);
                game.lib->drawBorderString("[B] Thẻ 3", cardX[2] + cardW / 2, 102, 0x000000, 0x00E5FF, 100, kDrawing::TOP | kDrawing::HCENTER);
                if (pd.cursor) gfx.drawCursor(static_cast<int>(pd.cx), static_cast<int>(pd.cy));
            } else if (game.nMainState == kDrawing::MAIN_STAGESELECT && game.nMainScene == 200) {
                // Unit Upgrade Book: highlight selected unit cell and upgrade button
                const int col = game.nMenuPos % 3;
                const int row = game.nMenuPos / 3;
                const int ux = 11 + col * 89;
                const int uy = 125 + row * 114;
                drawGlowingBorder(ux - 2, uy - 2, 85, 85, 0x00E5FF);
                drawGlowingBorder(311, 275, 204, 65, 0xFFEA00);
#if defined(PALADOG_LANG_EN)
                game.lib->drawBorderString("PRESS [X] TO UPGRADE", 413, 252, 0x000000, 0xFFEA00, 100, kDrawing::TOP | kDrawing::HCENTER);
                game.lib->drawBorderString("[B] BACK      [R1] SHOP", 380, 538, 0x000000, 0xFFFFFF, 100, kDrawing::TOP | kDrawing::HCENTER);
                if (pd.cursor) gfx.drawCursor(static_cast<int>(pd.cx), static_cast<int>(pd.cy));
            } else if (game.nMainState == kDrawing::MAIN_STAGESELECT && game.nMainScene == 300) {
                // Store screen: draw L1 / R1 hints on top navigation buttons
                game.lib->drawBorderString("[L1] UNITS", 78, 59, 0x000000, 0x00FFFF, 100, kDrawing::TOP | kDrawing::HCENTER);
                game.lib->drawBorderString("[R1] HERO", 680, 59, 0x000000, 0x00FFFF, 100, kDrawing::TOP | kDrawing::HCENTER);
                if (pd.cursor) gfx.drawCursor(static_cast<int>(pd.cx), static_cast<int>(pd.cy));
            } else if (game.nMainState == kDrawing::MAIN_STAGESELECT && game.nMainScene == 400) {
                // Hero Equip screen: draw L1 / R1 hints on top navigation buttons
                game.lib->drawBorderString("[L1] SHOP", 78, 59, 0x000000, 0x00FFFF, 100, kDrawing::TOP | kDrawing::HCENTER);
                game.lib->drawBorderString("[R1] STAGES", 680, 59, 0x000000, 0xFFEA00, 100, kDrawing::TOP | kDrawing::HCENTER);
#else
                game.lib->drawBorderString("BẤM [X] ĐỂ NÂNG CẤP", 413, 252, 0x000000, 0xFFEA00, 100, kDrawing::TOP | kDrawing::HCENTER);
                game.lib->drawBorderString("[B] QUAY LẠI      [R1] CỬA HÀNG", 380, 538, 0x000000, 0xFFFFFF, 100, kDrawing::TOP | kDrawing::HCENTER);
                if (pd.cursor) gfx.drawCursor(static_cast<int>(pd.cx), static_cast<int>(pd.cy));
            } else if (game.nMainState == kDrawing::MAIN_STAGESELECT && game.nMainScene == 300) {
                // Store screen: draw L1 / R1 hints on top navigation buttons
                game.lib->drawBorderString("[L1] QUÂN LÍNH", 78, 59, 0x000000, 0x00FFFF, 100, kDrawing::TOP | kDrawing::HCENTER);
                game.lib->drawBorderString("[R1] ANH HÙNG", 680, 59, 0x000000, 0x00FFFF, 100, kDrawing::TOP | kDrawing::HCENTER);
                if (pd.cursor) gfx.drawCursor(static_cast<int>(pd.cx), static_cast<int>(pd.cy));
            } else if (game.nMainState == kDrawing::MAIN_STAGESELECT && game.nMainScene == 400) {
                // Hero Equip screen: draw L1 / R1 hints on top navigation buttons
                game.lib->drawBorderString("[L1] CỬA HÀNG", 78, 59, 0x000000, 0x00FFFF, 100, kDrawing::TOP | kDrawing::HCENTER);
                game.lib->drawBorderString("[R1] CHỌN ẢI", 680, 59, 0x000000, 0xFFEA00, 100, kDrawing::TOP | kDrawing::HCENTER);
#endif
                if (pd.cursor) gfx.drawCursor(static_cast<int>(pd.cx), static_cast<int>(pd.cy));
            } else if (game.nMainState == kDrawing::MAIN_GAME && game.nGameState == kDrawing::GAME_CLEAR) {
                // Highlight continue button
                const int bx = 460, by = 437, bw = 180, bh = 68;
                drawGlowingBorder(bx, by, bw, bh, 0xFFEA00);
                if (pd.cursor) gfx.drawCursor(static_cast<int>(pd.cx), static_cast<int>(pd.cy));
            } else if (game.nMainState == kDrawing::MAIN_GAME && game.nGameState == kDrawing::GAME_OVER && game.nGameScene == 2) {
                // Highlight retry button
                const int bx = 544, by = 494, bw = 204, bh = 65;
                drawGlowingBorder(bx, by, bw, bh, 0xFFEA00);
                if (pd.cursor) gfx.drawCursor(static_cast<int>(pd.cx), static_cast<int>(pd.cy));
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
