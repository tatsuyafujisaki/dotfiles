# adds "flutter" to PATH.
[[ -d "$HOME/develop/flutter/bin" ]] && export PATH="$HOME/develop/flutter/bin:$PATH"

# adds executables such as "flutterfire", which is installed via "dart pub global activate <package_name>".
# https://firebase.google.com/docs/flutter/setup
[[ -d "$HOME/.pub-cache/bin" ]] && export PATH="$HOME/.pub-cache/bin:$PATH"

# adds "dart" to PATH so that "Error: exec: "dart": executable file not found in $PATH." does not occur in the Dart MCP server of Google Antigravity.
[[ -d "$HOME/Documents/GitHub/flutter-playground/.fvm/flutter_sdk/bin" ]] && export PATH="$HOME/Documents/GitHub/flutter-playground/.fvm/flutter_sdk/bin:$PATH"
[[ -d "$HOME/Documents/GitHub/enl_sample/.fvm/flutter_sdk/bin" ]] && export PATH="$HOME/Documents/GitHub/enl_sample/.fvm/flutter_sdk/bin:$PATH"

#
# https://dart.dev/tools/dart-tool
#

alias dfa='fvm dart fix --apply'
alias dfd='fvm dart format .'
alias drbrb='fvm dart run build_runner build'
alias drbrw='fvm dart run build_runner watch'

#
# https://docs.flutter.dev/reference/flutter-cli#flutter-commands
#

alias fa='fvm flutter analyze'
alias fc='fvm flutter clean'
alias fcp='fvm flutter create --platforms=android,ios delete_me' # useful for checking the structure of modern projects and the contents of files, especially those in the android and ios folders.
alias fd='fvm flutter doctor'
alias fds='fvm flutter devices'
alias fpa='fvm flutter pub add'
alias fpc='fvm flutter pub cache clean --force'
alias fpg='rm -f pubspec.lock && fvm flutter pub get'
alias fpo='fvm flutter pub outdated'
alias fpr='fvm flutter pub remove'
alias fpu='fvm flutter pub upgrade --major-versions --tighten'
alias fri="fvm flutter run --device-id"
alias fu='fvm flutter upgrade --force'
alias fv='fvm flutter --version'

#
# https://developer.apple.com/xcode
#

alias xcw='(cd ios && rm -f Podfile.lock && pod install && open Runner.xcworkspace)'

#
# https://fvm.app
#

alias my_fvm_reset='fvm remove --all && fvm use'

#
# https://cocoapods.org
#

# https://guides.cocoapods.org/using/getting-started.html#sudo-less-installation
# Enables `flutter doctor` to find `CocoaPods`.
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

alias pcc='(cd ios && rm -f Podfile.lock && pod cache clean --all)'
alias pi='(cd ios && rm -f Podfile.lock && pod install)'

#
# Miscellaneous
#

my_flutter_clean() {
  fvm flutter clean && \
  fvm flutter pub cache clean --force && \
  (cd ios && rm -f Podfile.lock && pod install)
}

my_flutter_pub_global_activate() {
  if [[ $# -lt 1 ]]
  then
    echo "Usage: $0 <package>"
    return 1
  fi

  fvm flutter pub global activate $1
}

my_flutter() {
  rm -f pubspec.lock && \
  fvm flutter pub get && \
  (cd ios && pod install) && \
  (! grep --quiet "build_runner:" pubspec.yaml || fvm dart run build_runner build) && \
  fvm dart fix --apply && \
  fvm dart format . && \
  fvm flutter analyze
}

my_flutter_screenshot() {
  local file="$HOME/Desktop/$(date +"%Y-%m-%d_%H-%M%S").png"
  fvm flutter screenshot --out="$file"
  oxipng --opt max --strip all --alpha "$file"
  open "$file"
}
