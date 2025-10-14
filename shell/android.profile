# https://developer.android.com/tools/variables#set
export ANDROID_HOME=~/Library/Android/sdk
[[ -d $ANDROID_HOME/cmdline-tools/latest/bin ]] && export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
[[ -d $ANDROID_HOME/emulator ]] && export PATH=$PATH:$ANDROID_HOME/emulator
[[ -d $ANDROID_HOME/platform-tools ]] && export PATH=$PATH:$ANDROID_HOME/platform-tools
[[ -d $ANDROID_HOME/tools/bin ]] && export PATH=$PATH:$ANDROID_HOME/tools/bin

#
# https://developer.android.com/tools/adb
#

#
# `adb` except `adb shell`
#

alias adbd='adb devices'
alias adbi='adb install -r *.apk'

# Transfers files between Android and macOS.
alias m2a='adb push ~/Desktop/my-quick-share/. /sdcard/Download && adb shell ls /sdcard/Download'
alias a2m='adb pull /sdcard/Download/. ~/Desktop/my-quick-share && open ~/Desktop/my-quick-share'


#
# adb shell
#

alias adba='adb shell am start -a'
alias adbdo='adb shell am start -a android.settings.APPLICATION_DEVELOPMENT_SETTINGS' # https://developer.android.com/about/versions/12/reference/common-intents-31
alias adbl='adb shell am start -a android.settings.LOCALE_SETTINGS' # https://developer.android.com/about/versions/12/reference/common-intents-31
alias adbps='adb shell getconf PAGE_SIZE' # https://developer.android.com/guide/practices/page-sizes
alias adb3='adb shell pm list package -3 | sort' # -3 is to show only third party packages.
# https://stackoverflow.com/a/30390647
alias adbu="adb shell pm list packages -3 | cut -d: -f2 | tr '\r' ' ' |\
grep -v com.piriform.ccleaner |\
grep -v com.blogspot.newapphorizons.fakegps |\
grep -v com.Slack |\
xargs -n1 -r -t adb uninstall"
alias layout='adb shell setprop debug.layout true'
alias layou='adb shell setprop debug.layout false'
alias logcat='adb logcat --clear && adb logcat -v tag' # https://developer.android.com/tools/logcat
alias showtap='adb shell settings put system show_touches 1'
alias showta='adb shell settings put system show_touches 0'

# Settings > System > Gestures > System navigation or 3-button navigation
alias gstr='adb shell cmd overlay enable com.android.internal.systemui.navbar.gestural'
alias 3btn='adb shell cmd overlay enable com.android.internal.systemui.navbar.threebutton'

my_adb_emu_geo_fix() {
  if [[ $# -lt 2 ]]
  then
    echo "Usage: $0 <longitude> <latitude>"
    return
  fi
  adb emu geo fix ${1} ${2}
}

my_adb_pull_camera_image_or_video() {
  if [[ $# -lt 1 ]]
  then
    echo "Usage: $0 <image or video filename>"
    return
  fi
  adb pull /storage/emulated/0/DCIM/Camera/${1} ~/Desktop
}

#
# https://developer.android.com/studio/run/emulator-commandline
#

alias emu='emulator -avd $(emulator -list-avds | tail -1) &'
alias emul='emulator -list-avds'

my_start_emulator() {
  if [[ $# -lt 1 ]]
  then
    echo "Usage: $0 <adb-device>"
    return
  fi

  emulator @${1} &
}

#
# Miscellaneous
#

alias keytool_list='keytool -list -keystore' # takes the path of .store or .jks
