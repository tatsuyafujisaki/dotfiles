alias adbm='adb shell screenrecord /sdcard/screenrecord.mp4' # https://developer.android.com/tools/adb#screenrecord

# A parenthesized command runs in a subshell.
alias adbs='(cd ~/Desktop && adb exec-out screencap -p > screenshot.png && my_cwebp screenshot.png && open screenshot.webp)'
alias adbmp='(cd ~/Desktop && adb pull /sdcard/screenrecord.mp4 && adb shell rm /sdcard/screenrecord.mp4 && my_ffmpeg screenrecord.mp4 && open screenrecord.mp4)'
