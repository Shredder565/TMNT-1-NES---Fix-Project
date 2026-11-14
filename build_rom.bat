@echo off
py -3 tools\build.py
if errorlevel 1 (
  echo BUILD FAILED
  pause
  exit /b 1
)
echo Rebuilt NES ROM is inside build\
pause
