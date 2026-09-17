# Adds java_home to PATH.
export PATH="/usr/libexec:$PATH"

#
# plutil
#

alias plp='plutil -p -- *.plist'

pl() {
  local json_files=(~/Desktop/*.json(N))
  if (( ${#json_files} > 0 )); then
    (cd ~/Desktop && plutil -convert xml1 -e plist -- *.json && rm -f *.json)
  fi
  cp ~/Desktop/*.plist /Users/Shared/
  open x-apple.systempreferences:com.apple.Keyboard-Settings.extension?TextReplacements
}

#
# https://developer.apple.com/documentation/xcode/xcode-command-line-tool-reference
#

alias simulators='xcrun simctl list devices'

xcss() {
  (
    cd ~/Desktop
    local file="$(date +"%Y-%m-%d_%H-%M-%S").png"
    xcrun simctl screenshot booted "$file"
    my_oxipng "$file"
    open "$file"
  )
}

xcrv() {
  (
    cd ~/Desktop
    local file="$(date +"%Y-%m-%d_%H-%M-%S").mp4"
    xcrun simctl io booted recordVideo "$file"
    my_ffmpeg "$file"
    open "$file"
  )
}

#
# https://brew.sh
#

alias bd='brew doctor'
alias bi='brew install --force'
alias bin='brew info'
alias bl='brew list -1'
alias bs='brew search'
alias bu='brew uninstall --force --zap'
alias bug='brew upgrade --greedy'

#
# Commands
#

alias mc='open ~/Documents/GitHub/dotfiles/mac/commands'
alias pb='open ~/Documents/GitHub/dotfiles/mac/commands/pasteboard'

#
# Miscellaneous
#

# USB cable speed detection
# https://developer.android.com/studio/releases/past-releases/as-koala-feature-drop-release-notes#usb-check
alias print_usb_speed='system_profiler SPUSBHostDataType | grep --extended-regexp "Link Speed|Product:"'
