alias adbm='adb shell screenrecord /sdcard/screenrecord.mp4' # https://developer.android.com/tools/adb#screenrecord
alias adbmp='(cd ~/Desktop && adb pull /sdcard/screenrecord.mp4 && adb shell rm /sdcard/screenrecord.mp4 && open screenrecord.mp4)' # A parenthesized command runs in a subshell.
alias adbw='adb shell screenrecord /sdcard/screenrecord.webm' # https://developer.android.com/tools/adb#screenrecord
alias adbwp='(cd ~/Desktop && adb pull /sdcard/screenrecord.webm && adb shell rm /sdcard/screenrecord.webm && open screenrecord.webm)' # A parenthesized command runs in a subshell.

adbp() {
  pushd ~/Desktop
  adb pull /sdcard/screenrecord.${1}
  adb shell rm /sdcard/screenrecord.${1}
  myffmpeg screenrecord.${1}
  open screenrecord.${1}
  popd
}

adbmp2() {
  adbp mp4
}

adbpw2() {
  adb webm
}

adbs() {
  if [ ${#} -lt 1 ]
  then
    filepath=~/Desktop/screenshot.png
  else
    filepath=~/Desktop/${1}.png
  fi

  adb exec-out screencap -p > ${filepath}
  open ${filepath}
}
