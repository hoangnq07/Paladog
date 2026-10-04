@echo off
title Paladog Atlas & Sprite Studio
cd /d "%~dp0"
echo =======================================================
echo   PALADOG ATLAS & SPRITE STUDIO
echo   Dang khoi dong Studio tai: http://127.0.0.1:5050
echo =======================================================
start http://127.0.0.1:5050
python tools/studio/server.py
pause
