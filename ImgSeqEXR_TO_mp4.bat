@echo off
ffmpeg ^
	-apply_trc iec61966_2_1 ^
	-framerate 24 ^
	-start_number 1 ^
	-i "frame_%%03d.exr" ^
	-c:v libx264 -pix_fmt yuv420p -crf 23 ^
	-preset faster -tune fastdecode ^
	"%~p1%~n1ImgSeqEXR_MP4.mp4"
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