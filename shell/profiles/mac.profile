# Adds homebrew to PATH.
export PATH="$(brew --prefix)/bin:$(brew --prefix)/sbin:$PATH"

# Adds java_home to PATH.
export PATH="/usr/libexec:$PATH"

# Adds python (Pyton 3) to PATH.
export PATH="$(brew --prefix python)/libexec/bin:$PATH"

# Adds ruby (Ruby 3) to PATH.
export PATH="$(brew --prefix ruby)/bin:$PATH"

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

alias pbbp='pbpaste | sed "s/^/- /" | pbcopy' # stands for "pasteboard bullet points".
alias pbnn='pbpaste | tr -s "\n" | pbcopy' # stands for "pasteboard removing \n\n.
alias pbsort='pbpaste | sort --unique | grep . | pbcopy' # "grep ." excludes empty lines.
alias pbtrim='pbpaste | tr -d '[:space:]' | pbcopy'
alias pd='pbpaste | python3 -c "import sys, urllib.parse; print(urllib.parse.unquote_plus(sys.stdin.read().strip()))" | pbcopy' # "pd" stands for "percent decode".
alias undq='pbpaste | tr -d "\"" | pbcopy' # deletes double quotes from the clipboard.

#
# https://developer.apple.com/xcode/
#

alias oas='open -a simulator'
alias oios='open ios/Runner.xcworkspace'

# "xcrv" stands for record video.
# "xcrun" stands for Xcode Run.
# "simctl" stands for simulator control.
xcrv() {
  local timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
  xcrun simctl io booted recordVideo "$timestamp.mp4"
  my_ffmpeg "${timestamp}.mp4"
  open "${timestamp}.mp4"
}

#
# https://cocoapods.org
#

alias pcca='pod cache clean --all'

#
# https://brew.sh
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
# Miscellaneous
#

# USB cable speed detection
# https://developer.android.com/studio/releases/past-releases/as-koala-feature-drop-release-notes#usb-check
alias print_usb_speed='system_profiler SPUSBDataType'
