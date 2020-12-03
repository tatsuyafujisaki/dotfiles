# Add adb to PATH
# Note that Zsh does not expand the tilde(~) if it is in double-quotes.
# http://zsh.sourceforge.net/Guide/zshguide05.html
[ -d ~/Library/Android/sdk/platform-tools ] && export PATH=${PATH}:~/Library/Android/sdk/platform-tools
[ -d ~/Library/Android/sdk/tools/bin ] && export PATH=${PATH}:~/Library/Android/sdk/tools/bin

alias adba='adb shell "dumpsys activity activities | grep mResumedActivity"' # shows the resumed activity.
alias adb_list_packages='adb shell pm list package -3 | sort' # -3 is to show only third party packages.
alias adb_plug='adb shell dumpsys battery reset'
alias adb_stop='adb shell am force-stop ' # Usage: adb_stop <package>
alias adb_unplug='adb shell dumpsys battery unplug'
alias adbd='adb devices -l'
alias adbe='adb emu geo fix' # Usage: adbe <longitude> <latitude>
alias adbf="adb shell dumpsys activity top | grep 'Added Fragments' -A 5" # shows fragments.
alias adbi='adb install'
alias adbu='adb uninstall'
alias adbw="adb kill-server && adb tcpip 5555 && sleep 5 && adb shell ip route | awk '{print \$9}' | xargs adb connect"

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

adb_pull() {
  if [ ${#} -ne 1 ]
  then
    echo "Usage: $funcstack[1] <path_under_scard_on_android> ."
    return
  fi

  adb pull /sdcard/${1} .
}

adb_push() {
  if [ ${#} -ne 1 ]
  then
    echo "Usage: $funcstack[1] <path_on_mac>"
    return
  fi

  adb push ${1} /sdcard
}

adb_screenshot() {
  filepath=~/Desktop/$(date +%Y%m%d-%H%M%S).png
  adb exec-out screencap -p > ${filepath} && open ${filepath}
}

adb_show_activity_count() {
  if [ ${#} -ne 1 ]
  then
    echo "Usage: $funcstack[1] <module>"
    return
  fi

  adb shell dumpsys meminfo ${1} | grep Activities
}

# Show what modules the given module depends on.
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

#
# Firebase
#

adb_enable_firebase_log() {
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

#
# The following is unrelated to adb but still related to Android development.
#

launch_emulator() {
  # Kill a running emumulator.
  adb -s emulator-5554 emu kill

  # "&!" is to keep an emulator running even after Zsh is closed.
  # http://zsh.sourceforge.net/Doc/Release/Shell-Builtin-Commands.html
  ~/Library/Android/sdk/emulator/emulator -avd $(~/Library/Android/sdk/emulator/emulator -list-avds) &|

  # Close Zsh.
  exit
}
