alias adbm='adb shell screenrecord /sdcard/screenrecord.mp4' # https://developer.android.com/tools/adb#screenrecord

# stands for adb screencapture
adbs() {
  cd ~/Desktop
  local timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
  adb exec-out screencap -p > "${timestamp}.png"
  local webp_file=$(my_cwebp "${timestamp}.png")
  open "$webp_file"
  cd -
}

# stands for adb pull mp4.
adbpm() {
  cd ~/Desktop
  local timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
  adb pull /sdcard/screenrecord.mp4 "${timestamp}.mp4"
  adb shell rm /sdcard/screenrecord.mp4
  my_ffmpeg "${timestamp}.mp4"
  open "${timestamp}.mp4"
  cd -
}
