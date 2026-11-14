@echo off
cd /d "%~dp0"
where py >nul 2>nul
if %errorlevel%==0 (
  py tools\sprite_studio.py
) else (
  python tools\sprite_studio.py
)
if errorlevel 1 (
  echo.
  echo If Pillow is missing, install it: py -m pip install Pillow
  pause
)
