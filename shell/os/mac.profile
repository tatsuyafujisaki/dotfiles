# Adds HomeBrew to PATH.
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# Adds the executable "java_home", which returns the value of $JAVA_HOME, to PATH.
export PATH=$PATH:/usr/libexec

# Adds Ruby 3 installed via Homebrew to PATH before pre-installed Ruby 2.
[[ -d /opt/homebrew/opt/ruby/bin ]] && export PATH=/opt/homebrew/opt/ruby/bin:$PATH

l() {
  clear

  # -G is equivalent to --color of the GNU-ls.
  # Use "ls -dl *" rather than "ls -l" because the latter shows the unwanted "total 0" on the first line of the output.
  # Print dotfiles and dotdirectories, then print a blank line, redirecting errors to /dev/null when there are not such files and directories.
  ls -dFGhlv .[^.]* 2> /dev/null && echo

  # Print non-dotfiles and non-dotdirectories, redirecting errors to /dev/null when there are not such files and directories.
  ls -dFGhlv * 2> /dev/null
}

#
# Preferences
#

alias gnrl='open /System/Library/PreferencePanes/StartupDisk.prefPane'
alias kb='open /System/Library/PreferencePanes/Keyboard.prefPane'
alias nw='open /System/Library/PreferencePanes/Network.prefPane'
alias sc='open x-apple.systempreferences:com.apple.preference.universalaccess?SpokenContent'

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
# pbpaste and/or pbcopy
#

alias dq='pbpaste | sed 's/.*/"&"/' | pbcopy' # adds double quotes to the clipboard.
alias pbsort='pbpaste | sort --unique | grep . | pbcopy' # "grep ." excludes empty lines.
alias pbtrim='pbpaste | tr -d '[:space:]' | pbcopy'
alias pd='pbpaste | python3 -c "import sys, urllib.parse; print(urllib.parse.unquote_plus(sys.stdin.read().strip()))" | pbcopy' # "pd" stands for "percent decode".
alias undq='pbpaste | tr -d "\"" | pbcopy' # deletes double quotes from the clipboard.
alias z2h="pbpaste | tr '０１２３４５６７８９' '0123456789' | pbcopy" # converts zenkaku (full-width) digits to hankaku (half-width) digits.

ai() {
  local query=$(pbpaste)
  local urls=(
    "https://chatgpt.com/?q=$query"
    "https://claude.ai/new?q=$query"
    "https://copilot.microsoft.com/?q=$query"
    "https://gemini.google.com/app"
    "https://grok.com/?q=$query"
    "https://www.perplexity.ai/search/new?q=$query"
  )
  open -a 'Google Chrome' "${urls[@]}"
}

#
# Miscellaneous
#

# USB cable speed detection
# https://developer.android.com/studio/releases/past-releases/as-koala-feature-drop-release-notes#usb-check
alias print_usb_speed='system_profiler SPUSBDataType'
