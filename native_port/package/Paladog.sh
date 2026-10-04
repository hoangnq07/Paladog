#!/bin/bash
# Paladog - native port launcher for PortMaster (ArkOS, AmberELEC, ROCKNIX, muOS, etc.)
# Copy this file and the "paladog" folder into /roms/ports (or /roms2/ports).

XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}

if [ -d "/opt/system/Tools/PortMaster/" ]; then
  controlfolder="/opt/system/Tools/PortMaster"
elif [ -d "/opt/tools/PortMaster/" ]; then
  controlfolder="/opt/tools/PortMaster"
elif [ -d "$XDG_DATA_HOME/PortMaster/" ]; then
  controlfolder="$XDG_DATA_HOME/PortMaster"
else
  controlfolder="/roms/ports/PortMaster"
fi

source $controlfolder/control.txt
[ -f "${controlfolder}/mod_${CFW_NAME}.txt" ] && source "${controlfolder}/mod_${CFW_NAME}.txt"
get_controls

GAMEDIR="/$directory/ports/paladog"
cd "$GAMEDIR" || exit 1

> "$GAMEDIR/log.txt" && exec > >(tee "$GAMEDIR/log.txt") 2>&1

# The game talks to the controller through SDL_GameController directly,
# so no gptokeyb mapping is needed.
export SDL_GAMECONTROLLERCONFIG="$sdl_controllerconfig"
export PALADOG_ASSETS="$GAMEDIR/assets"
# Save files (SharedObject .sol) stay inside the game folder.
export XDG_DATA_HOME="$GAMEDIR/conf"
mkdir -p "$XDG_DATA_HOME"

chmod +x ./paladog
$ESUDO ./paladog

pm_finish
