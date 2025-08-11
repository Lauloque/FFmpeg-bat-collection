@echo off
:again

cd /D %~p1

ffmpeg ^
	-i "%~nx1" ^
	-attach "cover.jpg" ^
	-metadata:s:t mimetype=image/jpeg ^
	-c copy ^
	-map 0 ^
	"%~p1%~n1_covered.mkv"
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
