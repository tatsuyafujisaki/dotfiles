# adds "flutter" to PATH.
[[ -d "$HOME/develop/flutter/bin" ]] && export PATH="$HOME/develop/flutter/bin:$PATH"

# adds executables such as "flutterfire", which is installed via "dart pub global activate <package_name>".
# https://firebase.google.com/docs/flutter/setup
[[ -d "$HOME/.pub-cache/bin" ]] && export PATH="$HOME/.pub-cache/bin:$PATH"

# adds "dart" to PATH so that "Error: exec: "dart": executable file not found in $PATH." does not occur in the Dart MCP server of Google Antigravity.
[[ -d "$HOME/Documents/GitHub/flutter-playground/.fvm/flutter_sdk/bin" ]] && export PATH="$HOME/Documents/GitHub/flutter-playground/.fvm/flutter_sdk/bin:$PATH"

#
# https://dart.dev/tools/dart-tool
#

alias dfa='dart fix --apply'
alias dfd='dart format .'
alias drbrb='dart run build_runner build'
alias drbrw='dart run build_runner watch'

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
alias fpg='fvm flutter pub get'
alias fpo='fvm flutter pub outdated'
alias fpr='fvm flutter pub remove'
alias fpum='fvm flutter pub upgrade --major-versions'
alias fput='fvm flutter pub upgrade --tighten'
alias fra="fvm flutter run --device-id 'sdk gphone64 arm64'"
alias fri="fvm flutter run --device-id ios"
alias fu='fvm flutter upgrade --force'
alias fv='fvm flutter --version'

#
# https://fvm.app
#

alias my_fvm_reset='fvm remove --all && fvm use'

my_flutter_clean() {
  fvm flutter clean && \
  fvm flutter pub cache clean --force
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
  fvm flutter pub get && \
  ([ ! -d "ios" ] || (cd ios && pod install)) && \
  dart run build_runner build && \
  dart fix --apply && \
  dart format . && \
  fvm flutter analyze # The `--suggestions` flag is not used because it triggers a false alarm for a high version of Gradle.
}

my_flutter_screenshot() {
  local output="$HOME/Desktop/$(date +"%Y-%m-%d_%H-%M%S").png"
  fvm flutter screenshot --out="$output" && open "$output"
}
