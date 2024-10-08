# https://developer.android.com/tools/variables#set
export ANDROID_HOME=~/Library/Android/sdk
[ -d $ANDROID_HOME/emulator ] && export PATH=$PATH:~/Library/Android/sdk/emulator
[ -d $ANDROID_HOME/platform-tools ] && export PATH=$PATH:~/Library/Android/sdk/platform-tools
[ -d $ANDROID_HOME/tools/bin ] && export PATH=$PATH:~/Library/Android/sdk/tools/bin

. $(dirname $0)/android-screencap-screenrecord.profile

alias adbd='adb devices'
alias adbi='adb install'

#
# adb shell
#
alias adb3='adb shell pm list package -3 | sort' # -3 is to show only third party packages.
alias adba='adb shell "dumpsys activity activities | grep mResumedActivity"' # shows the resumed activity.
alias adbas="adb shell \"dumpsys activity activities | grep ' Hist '\"" # shows all the actiities.
# https://stackoverflow.com/a/30390647
alias adbu="adb shell pm list packages -3 | cut -d: -f2 | tr '\r' ' ' |\
grep -v com.piriform.ccleaner |\
grep -v com.Slack |\
xargs -n1 -r -t adb uninstall"
alias layout='adb shell setprop debug.layout true'
alias layou='adb shell setprop debug.layout false'
alias showtap='adb shell settings put system show_touches 1'
alias showta='adb shell settings put system show_touches 0'

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

alias emu='emulator -list-avds | tail -1 | xargs emulator -avd &|'

pixel() {
  if [ ${#} -lt 2 ]
  then
    echo "Usage: $funcstack[1] <pixel-number> <api-level>"
    return
  fi

  emulator @Pixel_$1_API_$2 &|
}