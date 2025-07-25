# https://developer.android.com/tools/variables#set
export ANDROID_HOME=~/Library/Android/sdk
[ -d $ANDROID_HOME/cmdline-tools/latest/bin ] && export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
[ -d $ANDROID_HOME/emulator ] && export PATH=$PATH:$ANDROID_HOME/emulator
[ -d $ANDROID_HOME/platform-tools ] && export PATH=$PATH:$ANDROID_HOME/platform-tools
[ -d $ANDROID_HOME/tools/bin ] && export PATH=$PATH:$ANDROID_HOME/tools/bin

#
# https://developer.android.com/tools/adb
#

alias adbd='adb devices'
alias adbi='adb install -r *.apk'
alias adb3='adb shell pm list package -3 | sort' # -3 is to show only third party packages.
# https://stackoverflow.com/a/30390647
alias adbu="adb shell pm list packages -3 | cut -d: -f2 | tr '\r' ' ' |\
grep -v com.piriform.ccleaner |\
grep -v com.blogspot.newapphorizons.fakegps |\
grep -v com.Slack |\
xargs -n1 -r -t adb uninstall"
alias layout='adb shell setprop debug.layout true'
alias layou='adb shell setprop debug.layout false'
alias showtap='adb shell settings put system show_touches 1'
alias showta='adb shell settings put system show_touches 0'


# Transfers files between Android and macOS.
alias m2a='adb push ~/Desktop/my-quick-share/. /sdcard/Download && adb shell ls /sdcard/Download'
alias a2m='adb pull /sdcard/Download/. ~/Desktop/my-quick-share && open ~/Desktop/my-quick-share'

# Settings > System > Gestures > System navigation or 3-button navigation
alias gstr='adb shell cmd overlay enable com.android.internal.systemui.navbar.gestural'
alias 3btn='adb shell cmd overlay enable com.android.internal.systemui.navbar.threebutton'

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

adb_pull_camera_image_or_video() {
  if [ ${#} -lt 1 ]
  then
    echo "Usage: $funcstack[1] <image or video filename>"
    return
  fi
  adb pull /storage/emulated/0/DCIM/Camera/${1} ~/Desktop
}

#
# https://developer.android.com/tools/logcat
#

alias my_logcat='adb logcat --clear && adb logcat -v brief'

# "flutter:I" shows logs with the tag "flutter" at the Info level. These are debugPrint logs.
# "*:S" silences all other tags.
adb_logcat_flutter() {
  adb logcat --clear

  if [ ${#} -ge 1 ]
  then
    adb -s $1 logcat flutter:I *:S | grep 👀
  else
    adb logcat flutter:I *:S | grep 👀
  fi
}

#
# emulator
#

alias emu='emulator -list-avds | tail -1 | xargs emulator -avd &|'
alias emul='emulator -list-avds'

pixel() {
  if [ ${#} -lt 2 ]
  then
    echo "Usage: $funcstack[1] <pixel-number> <api-level>"
    return
  fi

  emulator @Pixel_$1_API_$2 &|
}

print_aab() {
  aab_path="app/build/outputs/bundle/release/app-release.aab"
  rm -f $aab_path && \
  ./gradlew bundleRelease && \
  bundletool dump manifest --bundle=$aab_path && \
  cp $aab_path ~/Desktop
}

#
# Language
#

# finds the language of Android
alias adblc=adb shell getprop persist.sys.locale

# sets the language of Android
alias adbcn='my_set_android_language zh-Hans-CN'
alias adbja='my_set_android_language ja-JP'
alias adbkr='my_set_android_language ko-KR'
alias adbtw='my_set_android_language zh-Hans-TW'
alias adbus='my_set_android_language en-US'

my_set_android_language() {
  if [ ${#} -lt 1 ]
  then
    echo "Usage: $funcstack[1] <locale>"
    return
  fi

  adb shell settings put system system_locales ${1} && adb reboot
}
