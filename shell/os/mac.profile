# Adds HomeBrew to PATH.
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# Adds the executable "java_home", which returns the value of $JAVA_HOME, to PATH.
export PATH=$PATH:/usr/libexec

# Adds Ruby 3 installed via Homebrew to PATH before pre-installed Ruby 2.
[[ -d /opt/homebrew/opt/ruby/bin ]] && export PATH=/opt/homebrew/opt/ruby/bin:$PATH

l() {
  clear

  # Prints non-dotfiles and non-dotdirectories and a blank line.
  # `.[^.]*` is a Zsh glob pattern to except `.` and `..`.
  ls -d -F -G -h -l .[^.]* 2> /dev/null && echo

  # Prints non-dotfiles and non-dotdirectories.
  ls -d -F -G -h -l * 2> /dev/null
}

#
# Preferences
#

alias gnrl='open /System/Library/PreferencePanes/StartupDisk.prefPane'
alias dsp='open /System/Library/PreferencePanes/Displays.prefPane'
alias kb='open /System/Library/PreferencePanes/Keyboard.prefPane'
alias nw='open /System/Library/PreferencePanes/Network.prefPane'
alias sc='open x-apple.systempreferences:com.apple.preference.universalaccess?SpokenContent'

#
# Pasteboard
#

alias pbsort='pbpaste | sort --unique | grep . | pbcopy' # "grep ." excludes empty lines.
alias pbtrim='pbpaste | tr -d '[:space:]' | pbcopy'
alias pd='pbpaste | python3 -c "import sys, urllib.parse; print(urllib.parse.unquote_plus(sys.stdin.read().strip()))" | pbcopy' # "pd" stands for "percent decode".
alias undq='pbpaste | tr -d "\"" | pbcopy' # deletes double quotes from the clipboard.
alias z2h="pbpaste | tr '０１２３４５６７８９' '0123456789' | pbcopy" # converts zenkaku (fullwidth) digits to hankaku (halfwidth) digits.

#
# Xcode
#

# "simctl" stands for simulator control, which means it does not apply to physical iOS devices.
xcrv() {
  local outputfile=screencast.mp4
  rm $outputfile
  xcrun simctl io booted recordVideo $outputfile
}

alias oas='open -a simulator'
alias oios='open ios/Runner.xcworkspace'

#
# CocoaPods
#

alias pcca='pod cache clean --all'

#
# Homebrew
#

alias bd='brew doctor'
alias bi='brew install --force'
alias bin='brew info'
alias bl='brew list -1'
alias bs='brew search'
alias bu='brew uninstall --force --zap'
# Update both formulae and casks.
# --greedy applies only to casks.
# Casks that have auto_updates=true such as google-chrome are not upgraded by default, but this flag updates even those casks.
alias bug='brew upgrade --greedy'

#
# Python
#

export PATH=$(brew --prefix python)/libexec/bin:$PATH

#
# Miscellaneous
#

# USB cable speed detection
# https://developer.android.com/studio/releases/past-releases/as-koala-feature-drop-release-notes#usb-check
alias print_usb_speed='system_profiler SPUSBDataType'
