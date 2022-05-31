# Add adb to PATH
# Note that Zsh does not expand the tilde(~) if it is in double-quotes.
# http://zsh.sourceforge.net/Guide/zshguide05.html
[ -d ~/Library/Android/sdk/emulator ] && export PATH=${PATH}:~/Library/Android/sdk/emulator
[ -d ~/Library/Android/sdk/platform-tools ] && export PATH=${PATH}:~/Library/Android/sdk/platform-tools
[ -d ~/Library/Android/sdk/tools/bin ] && export PATH=${PATH}:~/Library/Android/sdk/tools/bin

alias adb3='adb shell pm list package -3 | sort' # -3 is to show only third party packages.
alias adba='adb shell "dumpsys activity activities | grep mResumedActivity"' # shows the resumed activity.
alias adbas="adb shell \"dumpsys activity activities | grep ' Hist '\"" # shows all the actiities.
alias adbd='adb devices'
alias adbe='adb emu geo fix' # Usage: adbe <longitude> <latitude>
alias adbi='adb install -r' # -r is to replace an existing app.
alias adbks='adb kill-server'
alias adbpv='(cd ~/Desktop && adb pull /sdcard/screencast.mp4 && adb shell rm /sdcard/screencast.mp4 && open screencast.mp4)' # "pv" means pull a video.
alias adbs='filepath=~/Desktop/$(date +%Y%m%d-%H%M%S).png && adb exec-out screencap -p > ${filepath} && open ${filepath}'
alias adbv='adb shell screenrecord /sdcard/screencast.mp4'

# --text is to avoid "grep: (standard input): binary file matches".
alias adbf="adb shell dumpsys activity top | grep --text 'Added Fragments' -A 5" # shows fragments.

# https://stackoverflow.com/a/30390647
alias adbu="adb shell pm list packages -3 | cut -d: -f2 | tr '\r' ' ' | grep -v com.deploygate | xargs -n1 -r -t adb uninstall"

# "dka" stands for "Don't keep activities".
alias dka='adb shell settings get global always_finish_activities'
alias dka0='adb shell settings put global always_finish_activities 0'
alias dka1='adb shell settings put global always_finish_activities 1'

alias emul='emulator -list-avds'
alias pixel4='emulator -avd Pixel_4_API_31 > /dev/null &|'

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

adb_logcat() {
  if [ ${#} -lt 1 ]
  then
    echo "Usage: $funcstack[1] <exact-package>"
    return
  fi

  # https://developer.android.com/studio/command-line/logcat
  adb logcat *:D -v color,tag --pid=$(adb shell pidof -s ${1})
}

clean_avd() {
  (cd ~/.android/avd/Pixel_4_API_30.avd && rm -fr cache.img cache.img.qcow2 data multiinstance.lock read-snapshot.txt tmpAdbCmds)
  (cd ~/.android/avd/Pixel_4a_API_30.avd && rm -fr cache.img cache.img.qcow2 data multiinstance.lock read-snapshot.txt tmpAdbCmds)
}

#
# Firebase
#

enable_firebase_log() {
  if [ ${#} -ne 1 ]
  then
    echo "Usage: $funcstack[1] <package>"
    return
  fi

  # Enable DebugView.
  adb shell setprop debug.firebase.analytics.app ${1}

  # Enable verbose logging.
  adb shell setprop log.tag.FA VERBOSE
  adb shell setprop log.tag.FA-SVC VERBOSE
  adb logcat -v time -s FA FA-SVC
}
