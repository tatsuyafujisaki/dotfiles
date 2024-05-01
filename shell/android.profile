# Zsh does not expand the tilde(~) in single-quotes or double-quotes.
# http://zsh.sourceforge.net/Guide/zshguide05.html
export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jbr/Contents/Home

# Add adb to PATH
# Zsh does not expand the tilde(~) in single-quotes or double-quotes.
# http://zsh.sourceforge.net/Guide/zshguide05.html
[ -d ~/Library/Android/sdk/emulator ] && export PATH=${PATH}:~/Library/Android/sdk/emulator
[ -d ~/Library/Android/sdk/platform-tools ] && export PATH=${PATH}:~/Library/Android/sdk/platform-tools
[ -d ~/Library/Android/sdk/tools/bin ] && export PATH=${PATH}:~/Library/Android/sdk/tools/bin

alias adb3='adb shell pm list package -3 | sort' # -3 is to show only third party packages.
alias adba='adb shell "dumpsys activity activities | grep mResumedActivity"' # shows the resumed activity.
alias adbas="adb shell \"dumpsys activity activities | grep ' Hist '\"" # shows all the actiities.
alias adbd='adb devices'
alias adbi='adb install'
alias adbm='adb shell screenrecord /sdcard/screencast.mp4'
alias adbpm='(cd ~/Desktop && adb pull /sdcard/screencast.mp4 && adb shell rm /sdcard/screencast.mp4 && open screencast.mp4)'
alias adbpw='(cd ~/Desktop && adb pull /sdcard/screencast.webm && adb shell rm /sdcard/screencast.webm && open screencast.webm)'
# alias adbs='filepath=~/Desktop/$(date +%Y%m%d-%H%M%S).png && adb exec-out screencap -p > ${filepath} && open ${filepath}'
alias adbw='adb shell screenrecord /sdcard/screencast.webm'
alias emul='emulator -list-avds'
alias px='pixel 8 34'

# --text is to avoid "grep: (standard input): binary file matches".
alias adbf="adb shell dumpsys activity top | grep --text 'Added Fragments' -A 5" # shows fragments.

adb_deeplink() {
  if [ ${#} -lt 1 ]
  then
    echo "Usage: $funcstack[1] <uri> [exact-package]"
    return
  fi

  # "am" stands for Activity Manager.
  # -W is to wait for launch to complete.
  # Ensure that AndroidManifest.xml contains <activity android:exported="true">. Otherwise, "java.lang.SecurityException: Permission Denial" will occur.
  # https://developer.android.com/training/app-links/deep-linking#testing-filters
  # https://codelabs.developers.google.com/codelabs/android-navigation/#10
  if [ ${#} -ge 2 ]
  then
    adb shell am start -W -a android.intent.action.VIEW -d ${1} ${2}
  else
    adb shell am start -W -a android.intent.action.VIEW -d ${1}
  fi
}

adbpm2() {
  adbpm
  pushd ~/Desktop
  ffmpeg -i screencast.mp4 -b:v 1m downsized.mp4
  rm screencast.mp4
  open downsized.mp4
  popd
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

adbpw2() {
  adbpw
  pushd ~/Desktop
  ffmpeg -i screencast.webm -b:v 1m downsized.webm
  rm screencast.webm
  open downsized.webm
  popd
}

pixel() {
  if [ ${#} -lt 2 ]
  then
    echo "Usage: $funcstack[1] <pixel-number> <api-level>"
    return
  fi

  emulator @Pixel_$1_API_$2 -dns-server 1.1.1.1,1.0.0.1,2606:4700:4700::1111,2606:4700:4700::1001 &|
}