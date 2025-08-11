@echo off
:again

cd /D %~p0
SET output=%~p1%~n1_Discorded.mp4
set cmd="ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 %1 "
FOR /F "tokens=*" %%i IN (' %cmd% ') DO SET seconds=%%i
echo aaaa
echo aaaa
SET /A "totalBitrate=84000/seconds"
SET overheadBitrate=100
SET audioBitrate=96
SET /A "videoBitrate=totalBitrate-audioBitrate-overheadBitrate"
ffmpeg ^
	-i %1 ^
	-c:v libx264 ^
	-b:v %videoBitrate%k ^
	-pass 1 -b:a %audioBitrate%k ^
	-f mp4 NUL && \
ffmpeg ^
	-i %1 ^
	-c:v libx264 ^
	-b:v %videoBitrate%k ^
	-pass 2 ^
	-b:a %audioBitrate%k "%output%"
del /q ffmpeg2pass-*.log ffmpeg2pass-*.mbtree
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