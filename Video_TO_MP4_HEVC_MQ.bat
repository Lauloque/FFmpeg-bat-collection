@echo off
:again

ffmpeg ^
	-i "%~1" ^
	-c:v libx265 ^
	-preset medium ^
	-tune fastdecode ^
	-crf 23 ^
	-map 0 ^
	-map_metadata -1 ^
	-pix_fmt yuv420p10le ^
	-c:a aac ^
	-q:a 5 ^
	"%~p1%~n1_MP4_HEVC_MQ.mp4"
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