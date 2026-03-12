alias adbm='adb shell screenrecord /sdcard/screenrecord.mp4' # https://developer.android.com/tools/adb#screenrecord

# stands for "adb screencapture" in png.
adbp() {
  (
    cd ~/Desktop
    local file="$(date +"%Y-%m-%d_%H-%M-%S").png"
    adb exec-out screencap -p > "$file"
    oxipng --opt max --strip all --alpha "$file"
    open "$file"
  )
}

# stands for adb screencapture in webp.
adbw() {
  (
    cd ~/Desktop
    local png_file="$(date +"%Y-%m-%d_%H-%M-%S").png"
    adb exec-out screencap -p > "$png_file"
    local webp_file=$(my_cwebp "$png_file")
    open "$webp_file"
  )
}

# stands for adb pull mp4.
adbpm() {
  (
    cd ~/Desktop
    local file="$(date +"%Y-%m-%d_%H-%M-%S").mp4"
    adb pull /sdcard/screenrecord.mp4 "$file"
    adb shell rm /sdcard/screenrecord.mp4
    my_ffmpeg "$file"
    open "$file"
  )
}
