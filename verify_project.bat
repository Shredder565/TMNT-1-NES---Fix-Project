@echo off
cd /d "%~dp0"
where py >nul 2>nul
if %errorlevel%==0 (
  py -m unittest discover -s tests -v
  py tools\build.py --expect-vanilla
) else (
  python -m unittest discover -s tests -v
  python tools\build.py --expect-vanilla
)
pause
