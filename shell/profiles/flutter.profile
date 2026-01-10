# adds "flutter" to PATH.
[[ -d "$HOME/develop/flutter/bin" ]] && export PATH="$HOME/develop/flutter/bin:$PATH"

# prioritizes the "flutter" command in the current project if present.
export PATH=".fvm/flutter_sdk/bin:$PATH"

# adds executables such as "flutterfire", which is installed via "dart pub global activate <package_name>".
# https://firebase.google.com/docs/flutter/setup
[[ -d "$HOME/.pub-cache/bin" ]] && export PATH="$HOME/.pub-cache/bin:$PATH"


# Make `flutter doctor` find CocoaPods.
[[ -d "$(gem env home)/bin" ]] && export PATH="$(gem env home)/bin:$PATH"

#
# https://dart.dev/tools/dart-tool
#

alias dfa='dart fix --apply'
alias dfd='dart format .'
alias drbrb='dart run build_runner build --delete-conflicting-outputs'
alias drbrw='dart run build_runner watch'

#
# https://docs.flutter.dev/reference/flutter-cli#flutter-commands
#

alias fa='flutter analyze --suggestions --fatal-infos'
alias fc='flutter clean'
alias fcp='flutter create --platforms=android,ios delete_me' # useful for checking the structure of modern projects and the contents of files, especially those in the android and ios folders.
alias fd='flutter doctor'
alias fds='flutter devices'
alias fpa='flutter pub add'
alias fpc='flutter pub cache clean --force'
alias fpg='flutter pub get'
alias fpo='flutter pub outdated'
alias fpr='flutter pub remove'
alias fpum='flutter pub upgrade --major-versions'
alias fput='flutter pub upgrade --tighten'
alias fu='flutter upgrade --force'
alias fv='flutter --version'

my_flutter_clean() {
  flutter clean && \
  flutter pub cache clean --force
}

my_flutter_pub_global_activate() {
  if [[ $# -lt 1 ]]
  then
    echo "Usage: $0 <package>"
    return 1
  fi

  flutter pub global activate $1
}

my_flutter() {
  flutter pub get && \
  ([ ! -d "ios" ] || (cd ios && pod install)) && \
  dart run build_runner build --delete-conflicting-outputs && \
  dart fix --apply && \
  dart format . && \
  lutter analyze --suggestions --fatal-infos
}

my_flutter_screenshot() {
  cd ~/Desktop
  flutter screenshot --out="screenshot.png"

  local timestamp=$(date +"%Y-%m-%d_%H-%M%S")
  mv screenshot.png "${timestamp}.png"
  open "${timestamp}.png"
  cd -
}
