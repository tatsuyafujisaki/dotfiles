# Zsh does not expand the tilde(~) in single-quotes or double-quotes.
# http://zsh.sourceforge.net/Guide/zshguide05.html
export JAVA_HOME=~/Library/Application\ Support/JetBrains/Toolbox/apps/AndroidStudio/ch-0/222.4459.24.2221.10121639/Android\ Studio.app/Contents/jbr/Contents/Home

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
alias adbi='adb install *.apk'
alias adbks='adb kill-server'
alias adbpv='(cd ~/Desktop && adb pull /sdcard/screencast.mp4 && adb shell rm /sdcard/screencast.mp4 && open screencast.mp4)' # "pv" means pull a video.
alias adbs='filepath=~/Desktop/$(date +%Y%m%d-%H%M%S).png && adb exec-out screencap -p > ${filepath} && open ${filepath}'
alias adbv='adb shell screenrecord /sdcard/screencast.mp4'
alias emul='emulator -list-avds'

# --text is to avoid "grep: (standard input): binary file matches".
alias adbf="adb shell dumpsys activity top | grep --text 'Added Fragments' -A 5" # shows fragments.

# https://stackoverflow.com/a/30390647
alias adbu="adb shell pm list packages -3 | cut -d: -f2 | tr '\r' ' ' | grep -v com.cisco.anyconnect.vpn.android.avf | grep -v com.deploygate | grep -v com.google.android.marvin.talkback | grep -v com.piriform.ccleaner | grep -v com.Slack | xargs -n1 -r -t adb uninstall"

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

pixel() {
  if [ ${#} -lt 1 ]
  then
    echo "Usage: $funcstack[1] <pixel-number> <api-level>"
    return
  fi

  emulator @Pixel_$1_API_$2 -dns-server 1.1.1.1,1.0.0.1,2606:4700:4700::1111,2606:4700:4700::1001 &|
}
