@echo off
cd /d "%~dp0"
py -3 tools\build_speed_mod.py
if errorlevel 1 (
  echo EXPERIMENTAL BUILD FAILED
  pause
  exit /b 1
)
echo.
echo Experimental ROM:
echo build\TMNT_NES_Lag_Reduction_v1_EXPERIMENTAL.nes
echo.
echo IMPORTANT: This is a low-risk cycle reduction, NOT a verified 60fps fix.
pause
