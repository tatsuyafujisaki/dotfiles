alias adbm='adb shell screenrecord /sdcard/screenrecord.mp4' # https://developer.android.com/tools/adb#screenrecord

# A parenthesized command runs in a subshell.
alias adbs='(cd ~/Desktop && adb exec-out screencap -p > screenshot.png && open screenshot.png)'
alias adbmp='(cd ~/Desktop && adb pull /sdcard/screenrecord.mp4 && adb shell rm /sdcard/screenrecord.mp4 && myffmpeg screenrecord.mp4 && open screenrecord.mp4)'
