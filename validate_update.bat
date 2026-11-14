@echo off
setlocal
cd /d "%~dp0"
where python >nul 2>&1
if errorlevel 1 (
  echo ERROR: Install Python 3 and add it to PATH.
  exit /b 1
)
python tools\validate_checkpoint.py
if errorlevel 1 (
  echo BUILD OR TEST FAILED. Nothing has been gameplay-confirmed.
  exit /b 1
)
echo.
echo Code-level checks PASSED. See build\CHECKPOINT_VALIDATION.json.
echo NOTE: Real NES gameplay and 60 FPS under load remain unverified.
endlocal
