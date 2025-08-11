rem @echo off
:again

cd /D %~p1

ffmpeg ^
	-i "%~nx1" ^
	-vf "drawtext=fontfile=/Windows/Fonts/courbd.ttf: text='Frame \: %%{eif\:n\:d\:2}': start_number=1: x=(w-tw)/2: y=h-(2*lh): fontcolor=white: fontsize=40: box=1: boxcolor=black@0.4: boxborderw=8" ^
	-c:a copy ^
	"%~p1%~n1_framenumbered.mkv"
	pause
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
