@echo off
setlocal ENABLEDELAYEDEXPANSION
chcp 65001 >nul

:: Prompt for rotation
:askRotation
echo Choose rotation:
echo   1 =  90° ↻ Clockwise (Default)
echo   2 =  90° ↺ Counter-Clockwise
echo   3 = 180° ↻ Clockwise
echo   4 = 180° ↺ Counter-Clockwise
set /p rotChoice="Enter number (1/2/3/4): "

:: Default to 0 if Enter pressed with no input
if "%rotChoice%"=="" set "rotChoice=1"

:: Validate input
if "%rotChoice%"=="1" goto:valid
if "%rotChoice%"=="2" goto:valid
if "%rotChoice%"=="3" goto:valid
if "%rotChoice%"=="4" goto:valid


echo Invalid choice.
echo.
goto:askRotation

:valid
:again

set "input=%~1"
if "%~1"=="" goto:end

:: map the user choice to the appropriate filter
if "%rotChoice%"=="0" set "vf=transpose=1"
if "%rotChoice%"=="1" set "vf=transpose=2"
if "%rotChoice%"=="2" set "vf=transpose=1,transpose=1"
if "%rotChoice%"=="3" set "vf=transpose=2,transpose=2"

:: VP9 re-encode (pixel-rotation — works in all players)
ffmpeg ^
    -i "%~1" ^
    -vf "%vf%" ^
    -c:v libvpx-vp9 ^
    -b:v 0 ^
    -crf 30 ^
    -cpu-used 2 ^
    -row-mt 1 ^
    -tile-columns 4 ^
    -threads %NUMBER_OF_PROCESSORS% ^
    -c:a libopus ^
    -b:a 96k ^
    "%~p1%~n1_rotated.mkv"

if NOT ["%errorlevel%"]==["0"] goto:error
echo [92m%~n1 Done![0m

shift
if "%~1" == "" goto:end
goto:again

:error

echo [93mThere was an error. Please check your input file or report an issue on https://github.com/Lauloque/FFmpeg-bat-collection/issues.[0m
pause
exit 0

:end

cls
echo [92mEncoding succesful. This window will close after 10 seconds.[0m
timeout /t 10
