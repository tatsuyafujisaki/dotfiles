# Add adb to PATH
# Note that Zsh does not expand the tilde(~) if it is in double-quotes.
# http://zsh.sourceforge.net/Guide/zshguide05.html
[ -d ~/Library/Android/sdk/emulator ] && export PATH={$PATH}:~/Library/Android/sdk/emulator
[ -d ~/Library/Android/sdk/platform-tools ] && export PATH=${PATH}:~/Library/Android/sdk/platform-tools
[ -d ~/Library/Android/sdk/tools/bin ] && export PATH=${PATH}:~/Library/Android/sdk/tools/bin

alias adba='adb shell "dumpsys activity activities | grep mResumedActivity"' # shows the resumed activity.
alias adbe='adb emu geo fix' # Usage: adbe <longitude> <latitude>
alias adbf="adb shell dumpsys activity top | grep 'Added Fragments' -A 5" # shows fragments.
alias adbi='adb install -r' # -r is to replace an existing app.
alias adbpv='(cd ~/Desktop && adb pull /sdcard/video.mp4 && adb shell rm /sdcard/video.mp4 && open video.mp4)' # "pv" means pull a video.
alias adbu='adb uninstall'
alias adbv='adb shell screenrecord /sdcard/video.mp4'
alias adb_thirdparty_packages='adb shell pm list package -3 | sort' # -3 is to show only third party packages.

adb_deeplink() {
  if [ ${#} -lt 1 ]
  then
    echo "Usage: $funcstack[1] <uri> [package]"
    return
  fi

  # "am" stands for Activity Manager.
  # -W is to wait for launch to complete.
  # Ensure <activity android:exported="true"> is in AndroidManifest.xml to avoid "java.lang.SecurityException: Permission Denial".
  # https://developer.android.com/training/app-links/deep-linking#testing-filters
  # https://codelabs.developers.google.com/codelabs/android-navigation/#10
  if [ ${#} -ge 2 ]
  then
    adb shell am start -W -a android.intent.action.VIEW -d ${1} ${2}
  else
    adb shell am start -W -a android.intent.action.VIEW -d ${1}
  fi
}

adb_show_dependent_modules() {
  if [ ${#} -ne 1 ]
  then
    echo "Usage: $funcstack[1] <module>"
    return
  fi

  # -q is to suppress non-error logs.
  # --configuration is to filter only "implementation".
  # https://docs.gradle.org/current/userguide/viewing_debugging_dependencies.html
  ./gradlew -q ${1}:dependencies --configuration implementation | grep '+--- project' | sort
}

launch_emulator() {
  # Kill a running emumulator.
  adb -s emulator-5554 emu kill

  # "&|" is to keep an emulator running even after Zsh is closed.
  # http://zsh.sourceforge.net/Doc/Release/Shell-Builtin-Commands.html
  ~/Library/Android/sdk/emulator/emulator -avd $(~/Library/Android/sdk/emulator/emulator -list-avds) &|

  # Close Zsh.
  exit
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
