alias adbm='adb shell screenrecord /sdcard/screenrecord.mp4' # https://developer.android.com/tools/adb#screenrecord

# A parenthesized command runs in a subshell.
# alias adbmp='(cd ~/Desktop && adb pull /sdcard/screenrecord.mp4 && adb shell rm /sdcard/screenrecord.mp4 && open screenrecord.mp4)'

adbmp() {
  if [ ${#} -lt 1 ]
  then
    filename=screenrecord.mp4
  else
    filename=$1.mp4
  fi
  pushd ~/Desktop
  adb pull /sdcard/screenrecord.mp4
  adb shell rm /sdcard/screenrecord.mp4
  myffmpeg screenrecord.mp4
  if [ ${#} -ge 1 ]
  then
    mv screenrecord.mp4 $filename
  fi
  open $filename
  popd
}

adbs() {
  if [ ${#} -lt 1 ]
  then
    filepath=~/Desktop/screenshot.png
  else
    filepath=~/Desktop/$1.png
  fi

  adb exec-out screencap -p > $filepath
  open $filepath
}
