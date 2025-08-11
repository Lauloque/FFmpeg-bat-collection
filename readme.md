# ffmpeg Bat Collection

[![GitHub license](https://img.shields.io/github/license/Lauloque/ffmpeg-bat-collection?style=for-the-badge&labelColor=rgb(64,64,64))](https://github.com/Lauloque/FFmpeg-bat-collection/blob/master/LICENSE.sql)  [![ko-fi](https://www.ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/H2H818FHX)

A collection of .bat files for some usefull ffmpeg conversions.

Bat files are supported in windows only.

## Installation

Bat files work on their own, but you need to have the latest versions of ffmpeg installed, as well as ffprobe and ffplay (those two are packed along ffmpeg.exe)

- Download the [latest release](https://github.com/L0Lock/FFmpeg-bat-collection/releases/latest) and unpack it wherever you want.
- If you don't have FFmpeg already, download the [lastest "static" ffmpeg pack](https://ffmpeg.zeranoe.com/builds/). You can either put the ffmpeg executables in the repository's `ffmpeg` folder, or register ffmpeg to your operating system (**recommended!**).

<details>
  <summary>Click to expand: <b>How to register ffmpeg in Windows</b></summary>

 - Browse in the archive up to the `bin` subfolder containing ffmpeg, ffprobe and ffplay executables. Uncompress the `bin` folder where you want. This guide will use: `C:\ffmpeg\bin`

- Register ffmpeg, ffprobe & ffplay to environment variables

  **Through command line (fastest):**
  
  - Open the terminal (press <kbd>![Windows key](http://i.imgur.com/AAjIi.png)</kbd><kbd>X</kbd> and click `Terminal`)
  - enter the following command:
    ```bash
    setx PATH "%PATH%;C:\ffmpeg\bin"
    ```
  
  **Through user interface:**

  - Startmenu Search: "Edit Environment Variables for your account"
  - <kbd>Environment variables</kbd>
  - Under "User variables for \<username\>", find and double-click "Path" 
  - <kbd>New</kbd>
  - Type in `C:\ffmpeg\bin` and <kbd>&#9166; Enter</kbd>
  - <kbd>Ok</kbd>
  - <kbd>Ok</kbd>
  - <kbd>Ok</kbd>

</details>

## How to use

### General usage

I.E. with files named as "*Video_TO_xxx.bat*".

These files are made to be the simplest to use : 

1. drag an drop your input file on the .bat file;
2. a command prompt window opens during the process;
3. once finished, the window disapears;
4. the new files are located aside the originals.

### Add Cover to X

Same general usage. But:  
To make it work, you need to have your picture file in the same folder as the source video, named as `cover.jpg`.

![demo covers](https://github.com/Lauloque/FFmpeg-bat-collection/raw/master/assets/img/covers_demo.jpg)

Do check those links first:

 - [Enabling cover thumbnails on your system](https://codecalamity.com/guides/video-thumbnails/)
 - [Cover variants](https://www.matroska.org/technical/attachments.html):

FileName | Image Orientation | Pixel Length of Smallest Side
-- | -- | --
cover.jpg | Portrait or square | 600
small_cover.png | Portrait or square | 120
cover_land.png | Landscape | 600
small_cover_land.jpg | Landscape | 120

### Add Frame Number to X

Same general usage.  
Uses Windows' "Courier New" font in bold by default, with a two-digits zero padding. If you need to customize:
- Replace the font path line 8 in `fontfile=/Windows/Fonts/courbd.ttf` (**on Windows, don't use `\` nor incllude the drive letter like `C:`)
- Change the `2` to whatever digit number line 8 in `{eif\:n\:d\:2}`

![demo frame number](https://github.com/Lauloque/FFmpeg-bat-collection/raw/master/assets/img/frame_number_demo.gif)

### Images sequence to X conversion

Use the files named as "*ImgSeq_To_xxx.bat*".

As it is more complex to manage images sequences, you need to:

Image sequence have some variable settings:

- framerate (default used: 24)
- start frame (default used: 1)
- name pattern (default used: "frame_xxx.jpg")

If your need a different frame rate or start frame, feel free to edit the .bat file.

As for the name pattern, the easiest is to have your image files created with the same name pattern. You can also edit the .bat file.

To edit the name pattern, edit the value between quote marks. As for the frames numbering, here's how it works:  
There's always a code like this one somewhere in the name pattern: `%%03d`. This is used to indicate the script that each file has a number that goes up for each file name. The way you write the code will indicate how he is compsed, and you can put the code anywhare in the name :

- `%%` indicates where the numbers should start

- if the counting is zero-padded (like `01` `02` `03`...), write a `0`

- indicate the number of digits

- end with a `d`

At the end of the filenane is always writen the file extension. It can be anything you need, like .jpg, .png, etc. Be aware that some formats like EXR need some special treatment, hence the dedicated .bat files for them.

To use the .bat files:

1. Copy the desired *.bat* file in the images' folder

2. Make sure the .bat settings fit your needs, edit the script or your files names if needed

3. Double-click the .bat file

4. A command prompt window opens during the process;

5. Once finished, the window disapears;

6. The new file is located aside the pictures.

## Descriptions

<div markdown="1" class="file-descriptions">

#### [ADD Cover to MKV](ADD_Cover_to_MKV.bat)

Sets a custom cover/thumbnail for a MKV video file.

#### [ADD Cover to MP4](ADD_Cover_to_MP4.bat)

Sets a custom cover/thumbnail for a MP4 video file.

#### [ADD Frame number to MP4](ADD_Framenumber_to_MP4.bat)

Prints the frame number on a MP4 video, with a semi-transparent background and a two-digit zero-padded number.

#### [ADD Frame number to MOV](ADD_Framenumber_to_MOV.bat)

Prints the frame number on a MOV video, with a semi-transparent background and a two-digit zero-padded number.

#### [ADD Frame number to MP4](ADD_Framenumber_to_MOV.bat)

Prints the frame number on a MP4 video, with a semi-transparent background and a two-digit zero-padded number.

#### [Image Sequence TO MP4](ImgSeq_TO_mp4.bat)

Converts a JPG image sequence into a MP4 video. The output video is 24 frames per second encoded with an AVC/H264 standard medium quality.

#### [Image Sequence EXR TO MP4](ImgSeqEXR_TO_mp4.bat)

Converts an EXR image sequence into a MP4 video, with settings specific to EXR files that are not suited for usual JPGs or PNGs. The output video is 24 frames per second encoded with an AVC/H264 standard medium quality.

#### [Video Rotate Hard](Video_Rotate_Hard.bat)

Rotates the video by 90° or 180° in either direction you like, by re-encoding the video into a VP9 stream.

#### [Video Rotate Soft](Video_Rotate_Soft.bat)

Rotates the video by 90° or 180° in either direction you like, by addin a metadata to the video. Some video players might not support this, but it's the only way to rotate a video without re-encoding.

#### [Video Comparison](Video_Comparison.bat)

Needs two input files, sort them alphabethically and produces two videos: one side-by-side horizontally and one stacked with overlay blend mode.

#### [Video TO Android](Video_TO_Android.bat)

Creates an video file suited for playback on Android devices.

#### [Video TO AV1](Video_TO_AV1.bat)

Creates a MKV file encoded with [AOMedia Video 1 (AV1)](https://www.wikiwand.com/en/AV1) codec, supposed to save 30% bitrate compared to VP9 and HEVC at the same visual quality (and 50% compared to AVC/x264). As of today, the encoder is **extremely slow** and **experimental **(encodes at ~0,01% of original video speed on my tests). Use at your own risk.

#### [Video TO GIF 24fps](Video_TO_GIF_24fps.bat)

Creates an animated GIF file playing 24 frames per second, from any video file.

#### [Video TO GIF 24fps w320px](Video_TO_GIF_24fps_w320px.bat)

Creates an animated GIF file playing 30 frames per second, resized at 320 pixels wide (with the same ratio), from any video file.

#### [Video TO Image Sequence PNG](Video_TO_ImgSeq_PNG.bat)

Turns your video into a standard PNG image sequence. The files will be stored in a folder aside your original video file, with the same name, as the following:  

```
| original_video.mp4
| original_video_name/
| | frame_xxxx.png
```

Frame counting is zero-paded and uses four digits.

#### [Video TO Instagramized](Instagramized.bat)

Made for Instagram squares in mind, but can be used for anything. It does several things:

- ensure maximum compatibility for displaying videos on mobile devices  (including old ones) ;

- ensures compatibility for Instagram ;

- Resizes the video to fit it in a square while keeping the original aspect ratio ;

- Fills the gaps left by the original video's ration by a blurred background effect.

You can change the output resolution if you want. Just open the bat file in a text editor, and edit the `SquareSize` value at line 5. The default value is 600 (pixels), you can use any integrer value you want. Just note that the higher you set, the longer it will take (because there's more data to process, blur increase time exponentially according to resolution) and Instagram doesn't displays more than ~600 pixels a square anyway.

Example:

![example Instagram video](https://media.giphy.com/media/WryeoK4u8eNbK0MfHD/giphy.gif)

#### [Video TO MKV HEVC HQ](Video_TO_MP4.bat)

Creates a high quality HEVC file contained in MKV. That's what I use for file storage with quality.

#### [Video TO MP4](Video_TO_MP4.bat)

Creates a standard MP4 file with fast h264 encoding. Good e.g. for quick previews of large files.

#### [Video TO MP4 web-friendly dividable size](Video_TO_MP4_webfriendly_dividablesize.bat)

Creates a MP4 file made to be readable in most web services. While also making sure the size is dividable by 2 (otherwise some video files might not be readable in the Internet).

#### [Video TO Discord](Video_TO_Discord.cmd)

Creates a video file readable by discord and within the 8MB file size limit. Note that it adapts the encoding quality depending of the video duration. The longer the video, the uglier it gets. Dont try to send your movies with that :wink: .

</div>
