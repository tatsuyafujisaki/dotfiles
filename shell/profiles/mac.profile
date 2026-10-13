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

# stands for "ios screen capture"
isc() {
  local file="$HOME/Desktop/$(date +"%Y-%m-%d_%H-%M-%S").png"
  local device_id="${1:-$(xcrun devicectl list devices --columns Identifier --hide-default-columns --hide-headers --filter 'Reality = "physical"' 2>/dev/null | awk '{print $1}' | head -n 1)}"

  if [[ -n "$device_id" ]]; then
    xcrun devicectl device capture screenshot --device "$device_id" --destination "$file" &&
    my_oxipng "$file" &&
    open "$file"
  else
    echo "No connected physical iOS device found."
    return 1
  fi
}

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
