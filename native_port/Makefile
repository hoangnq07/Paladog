# Paladog native port.
#   Windows (MSYS2 mingw64):  mingw32-make            -> build/paladog.exe
#   Linux / R36S (aarch64):   make                    -> build/paladog
#   Handheld defaults (fullscreen):  make HANDHELD=1
#   Cross-compile for R36S/ArkOS from Windows (needs toolchain/, see
#   tools/fetch_arm64_sdl.py):  mingw32-make ARM64=1  -> build-arm64/paladog
ifeq ($(OS),Windows_NT)
SHELL := C:/msys64/usr/bin/sh.exe
MKDIR := C:/msys64/usr/bin/mkdir.exe -p
else
MKDIR := mkdir -p
endif
BUILD := build

ifeq ($(ARM64),1)
# zig c++ gives a static libc++ and lets us pin an old glibc (ArkOS is Ubuntu 19.10 based).
ZIGDIR   := $(wildcard toolchain/zig-*)
SDK      := toolchain/arm64-sdk/usr
CXX      := $(ZIGDIR)/zig.exe c++ -target aarch64-linux-gnu.2.28 -mcpu=cortex_a35
BUILD    := build-arm64
CXXFLAGS ?= -O2
CXXFLAGS += -std=c++17 -fwrapv -Wall -Wextra -Wno-unused-parameter -DPALADOG_HANDHELD \
            -I$(SDK)/include/SDL2 -I$(SDK)/include -I$(SDK)/include/aarch64-linux-gnu
LDFLAGS  += -L$(SDK)/lib/aarch64-linux-gnu
LDLIBS   += -l:libSDL2-2.0.so.0.18.2 -l:libSDL2_image-2.0.so.0.2.3 \
            -l:libSDL2_mixer-2.0.so.0.2.2 -l:libSDL2_ttf-2.0.so.0.18.0
EXE      := $(BUILD)/paladog
else
CXX      ?= g++
PKGS     := sdl2 SDL2_image SDL2_mixer SDL2_ttf
CXXFLAGS ?= -O2
CXXFLAGS += -std=c++17 -fwrapv -Wall -Wextra -Wno-unused-parameter $(shell pkg-config --cflags $(PKGS))
LDLIBS   += $(shell pkg-config --libs $(PKGS))

ifeq ($(HANDHELD),1)
CXXFLAGS += -DPALADOG_HANDHELD
endif

ifeq ($(OS),Windows_NT)
EXE := $(BUILD)/paladog.exe
ifeq ($(RELEASE),1)
LDFLAGS += -mwindows -static-libgcc -static-libstdc++
endif
else
EXE := $(BUILD)/paladog
endif
endif

ifeq ($(LANG_EN),1)
CXXFLAGS += -DPALADOG_LANG_EN
endif

ifeq ($(LANG_EN),1)
GEN_SRCS := $(filter-out src/gen/Drawing.cpp, $(wildcard src/gen/*.cpp))
else
GEN_SRCS := $(filter-out src/gen/Drawing_en.cpp, $(wildcard src/gen/*.cpp))
endif

SRCS := src/main.cpp \
        src/engine/gfx.cpp src/engine/audio.cpp src/engine/text.cpp \
        src/runtime/as3.cpp \
        src/game/lib.cpp src/game/drawing_ext.cpp src/game/ui_overlay.cpp \
        $(GEN_SRCS)
OBJS := $(patsubst src/%.cpp,$(BUILD)/obj/%.o,$(SRCS))
DEPS := $(OBJS:.o=.d)

all: $(EXE)

$(EXE): $(OBJS)
	$(CXX) $(LDFLAGS) -o $@ $^ $(LDLIBS)

$(BUILD)/obj/%.o: src/%.cpp
	@$(MKDIR) $(dir $@)
	$(CXX) $(CXXFLAGS) -MMD -MP -c $< -o $@

clean:
	rm -rf $(BUILD)

-include $(DEPS)

.PHONY: all clean
