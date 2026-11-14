@echo off
cd /d "%~dp0"
py -3 tools\build.py --source-dir mods/lag_reduction_v1/source --output build/TMNT_NES_My_Custom_Edit.nes
if errorlevel 1 (
  echo BUILD FAILED
  pause
  exit /b 1
)
echo Your edited ROM is in build\TMNT_NES_My_Custom_Edit.nes
pause
