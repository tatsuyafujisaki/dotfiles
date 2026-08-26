alias adbsr='adb shell screenrecord /sdcard/screenrecord.mp4' # https://developer.android.com/tools/adb#screenrecord

# stands for "adb pull".
adbp() {
  (
    cd ~/Desktop
    local file="$(date +"%Y-%m-%d_%H-%M-%S").mp4"
    adb pull /sdcard/screenrecord.mp4 "$file"
    adb shell rm /sdcard/screenrecord.mp4
    my_ffmpeg "$file"
    open "$file"
  )
}

# stands for "android screen capture" in png.
asc() {
  (
    cd ~/Desktop
    local file="$(date +"%Y-%m-%d_%H-%M-%S").png"
    android screen capture --output "$file"
    my_oxipng "$file"
    open "$file"
  )
}
