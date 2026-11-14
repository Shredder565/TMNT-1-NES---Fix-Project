@echo off
cd /d "%~dp0"
echo ===========================================
echo TMNT NES: Leonardo buff + optional experimental enemy respawn
python tools\build_character_update.py
if errorlevel 1 goto fail
python tools\build_respawn_prototype.py
if errorlevel 1 goto fail
python -m unittest discover -s tests -v
if errorlevel 1 goto fail
echo.
echo SUCCESS: See build\ for ROMs, IPS patches, and JSON reports.
echo WARNING: No-respawn ROM is an untested prototype, not gameplay verified!
pause
exit /b 0
:fail
echo BUILD OR TEST FAILED. Do not play or redistribute the failed output.
pause
exit /b 1
