# Add adb to PATH
[ -d ~/Library/Android/sdk/platform-tools ] && export PATH=${PATH}:~/Library/Android/sdk/platform-tools

alias adbc='adb connect' # Usage: adbc 192.168.0.1:5555 (The port number is optional and defaults to 5555.)
alias adbd='adb devices -l'
alias adbdl='adb shell am start -W -a android.intent.action.VIEW -d' # Usage: adbdl <url>
alias adbe='adb emu geo fix' # Usage: adbe <longitude> <latitude>
alias adbf="adb shell dumpsys activity top | grep 'Added Fragments' -A 5" # shows fragments.
alias adbi='adb install'
alias adbu='adb uninstall'
alias adb_list_packages='adb shell pm list package -3 | sort' # -3 is to show only third party packages.
alias adb_plug='adb shell dumpsys battery reset'
alias adb_stop='adb shell am force-stop ' # Usage: adb_stop <package>
alias adbt='adb tcpip 5555'
alias adb_unplug='adb shell dumpsys battery unplug'
alias adb_listadb shell pm list packages
alias adbw="adb kill-server && adb tcpip 5555 && sleep 5 && adb shell ip route | awk '{print \$9}' | xargs adb connect"

adb_deeplink() {
  if [ ${#} -ne 2 ]
  then
    echo "Usage: ${FUNCNAME[0]} <uri> <package>"
    return
  fi

  # "am" stands for Activity Manager.
  # -W is to wait for launch to complete.
  # Ensure <activity android:exported="true"> is in AndroidManifest.xml to avoid "java.lang.SecurityException: Permission Denial".
  # https://developer.android.com/training/app-links/deep-linking#testing-filters
  # https://codelabs.developers.google.com/codelabs/android-navigation/#10
  adb shell am start -W -a android.intent.action.VIEW -d ${1} ${2}
}

adb_pull() {
  if [ ${#} -ne 1 ]
  then
    echo "Usage: ${FUNCNAME[0]} <path_under_scard_on_android> ."
    return
  fi

  adb pull /sdcard/${1} .
}

adb_push() {
  if [ ${#} -ne 1 ]
  then
    echo "Usage: ${FUNCNAME[0]} <path_on_mac>"
    return
  fi

  adb push ${1} /sdcard
}

adb_show_activities() {
  if [ ${#} -ne 1 ]
  then
    echo "Usage: ${FUNCNAME[0]} <package>"
    return
  fi

  adb shell dumpsys activity -p ${1} | grep Hist | grep ${1} | awk '{$1=$1};1' # awk is to remove leading and trailing spaces.
}

firebase_log() {
  # Enable DebugView
  adb shell setprop debug.firebase.analytics.app com.example.myapplication

  # Enable verbose logging
  adb shell setprop log.tag.FA VERBOSE
  adb shell setprop log.tag.FA-SVC VERBOSE
  adb logcat -v time -s FA FA-SVC
}