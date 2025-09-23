alias adbm='adb shell screenrecord /sdcard/screenrecord.mp4' # https://developer.android.com/tools/adb#screenrecord

# A parenthesized command runs in a subshell.
# alias adbmp='(cd ~/Desktop && adb pull /sdcard/screenrecord.mp4 && adb shell rm /sdcard/screenrecord.mp4 && open screenrecord.mp4)'

adbmp() {
  pushd ~/Desktop
  adb pull /sdcard/screenrecord.mp4
  adb shell rm /sdcard/screenrecord.mp4
  myffmpeg screenrecord.mp4
  open screenrecord.mp4
  popd
}

adbs() {
  local filepath=~/Desktop/$basename.png
  adb exec-out screencap -p > "$filepath" && open "$filepath"
}
