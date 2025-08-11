@echo off
:again

mkdir frames
ffmpeg ^
	-i "%~1" -y ^
	-filter_complex "[0:v] palettegen" ^
	"frames/palette.png"
ffmpeg ^
	-i "%~1" ^
	-vf scale=320:-2:flags=bicubic ^
	"frames/ffout%%03d.png"
ffmpeg ^
	-framerate 24 ^
	-i "frames/ffout%%03d.png" ^
	-i "frames/palette.png" ^
	-filter_complex "[0:v][1:v] paletteuse" ^
	"%~p1%~n1_GIF_24fps_w320px.gif"
rmdir frames /s /q
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