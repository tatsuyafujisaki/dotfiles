# Adds homebrew to PATH.
export PATH="$(brew --prefix)/bin:$(brew --prefix)/sbin:$PATH"

# Adds java_home to PATH.
export PATH="/usr/libexec:$PATH"

# Adds python (Pyton 3) to PATH.
export PATH="$(brew --prefix python)/libexec/bin:$PATH"

# Adds ruby (Ruby 3) to PATH.
export PATH="$(brew --prefix ruby)/bin:$PATH"

#
# plutil
#

alias cppl='(cd ~/Desktop && plutil -convert xml1 -e plist -- *.json && sudo cp *.plist /Users/work/Desktop && rm -f *.json)'
alias pl2json='plutil -convert json -r -e json -- *.plist'
alias pl2xml='plutil -convert xml1 -e plist -- *.json'
alias plp='plutil -p -- *.plist'

#
# https://developer.apple.com/documentation/xcode/xcode-command-line-tool-reference
#

alias simulators='xcrun simctl list devices'

# "xcrv" stands for recording video.
xcrv() {
  local timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
  xcrun simctl io booted recordVideo "$timestamp.mp4"
  my_ffmpeg "${timestamp}.mp4"
  open "${timestamp}.mp4"
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
# Miscellaneous
#

# USB cable speed detection
# https://developer.android.com/studio/releases/past-releases/as-koala-feature-drop-release-notes#usb-check
alias print_usb_speed='system_profiler SPUSBHostDataType | grep --extended-regexp "Link Speed|Product:"'
