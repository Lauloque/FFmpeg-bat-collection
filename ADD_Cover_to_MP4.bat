@echo off
:again

cd /D %~p1

ffmpeg ^
	-i "%~nx1" ^
	-i "cover.jpg" ^
	-map 0 -map 1 ^
	-c copy ^
	-c:v:1 png ^
	-disposition:v:1 attached_pic ^
	"%~p1%~n1_covered.mp4"
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
