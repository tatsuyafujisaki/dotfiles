# adds "flutter" to PATH.
[[ -d "$HOME/development/flutter/bin" ]] && export PATH="$PATH:$HOME/development/flutter/bin"

# adds "fvm" to PATH.
[[ -d "$HOME/.fvm_flutter/bin" ]] && export PATH="$PATH:$HOME/.fvm_flutter/bin"

# adds "dart" and "flutter", which are installed via FVM, to PATH.
# fvm_latest_installed_flutter_version=$(ls -1 "$HOME/fvm/versions" 2>/dev/null | tail -1)
# [[ -n "$fvm_latest_installed_flutter_version" && -d "$HOME/fvm/versions/$fvm_latest_installed_flutter_version/bin" ]] && export PATH="$PATH:$HOME/fvm/versions/$fvm_latest_installed_flutter_version/bin"

# adds executables such as "flutterfire" and "protoc", which are installed via "dart pub global activate <package_name>", to PATH.
# https://firebase.google.com/docs/flutter/setup
# https://grpc.io/docs/languages/dart/quickstart
# https://pub.dev/packages/protoc_plugin
[[ -d "$HOME/.pub-cache/bin" ]] && export PATH="$PATH:$HOME/.pub-cache/bin"

#
# https://dart.dev/tools/dart-tool
#

alias dfa='command -v fvm >/dev/null && fvm dart fix --apply || dart fix --apply'
alias dfd='command -v fvm >/dev/null && fvm dart format . || dart format .'
alias drbrb='command -v fvm >/dev/null && fvm dart dart run build_runner build || dart run build_runner build'
alias drbrw='command -v fvm >/dev/null && fvm dart run build_runner watch || dart run build_runner watch'

#
# https://docs.flutter.dev/reference/flutter-cli#flutter-commands
#

# > Run `flutter analyze --suggestions` to see if your Android Gradle Plugin (AGP), Java, and Gradle versions are compatible.
# https://docs.flutter.dev/release/breaking-changes/android-java-gradle-migration-guide#solution-2-command-line
alias fa='command -v fvm >/dev/null && (fvm flutter analyze && fvm flutter analyze --suggestions) || (flutter analyze && flutter analyze --suggestions)'
alias fc='command -v fvm >/dev/null && fvm flutter clean || flutter clean'
alias fcp='command -v fvm >/dev/null && fvm flutter create --platforms=android,ios delete_me || flutter create --platforms=android,ios delete_me' # useful for checking the structure of modern projects and the contents of files, especially those in the android and ios folders.
alias fd='command -v fvm >/dev/null && fvm flutter doctor || flutter doctor'
alias fds='command -v fvm >/dev/null && fvm flutter devices || flutter devices'
alias fpa='command -v fvm >/dev/null && fvm flutter flutter pub add || flutter pub add'
alias fpc='command -v fvm >/dev/null && fvm flutter pub cache clean --force || flutter pub cache clean --force'
alias fpg='command -v fvm >/dev/null && fvm flutter pub get || flutter pub get'
alias fpo='command -v fvm >/dev/null && fvm flutter pub outdated || flutter pub outdated'
alias fpr='command -v fvm >/dev/null && fvm flutter pub remove || flutter pub remove'
alias fpum='command -v fvm >/dev/null && fvm flutter pub upgrade --major-versions || flutter pub upgrade --major-versions'
alias fput='command -v fvm >/dev/null && fvm flutter pub upgrade --tighten || flutter pub upgrade --tighten'
alias fu='command -v flutter >/dev/null && flutter upgrade --force'
alias fv='command -v fvm >/dev/null && fvm flutter --version || flutter --version'

my_flutter_clean() {
  if command -v fvm >/dev/null
  then
    fvm flutter clean && \
    fvm flutter pub cache clean --force
  else
    flutter clean && \
    flutter pub cache clean --force
  fi
}

my_flutter_pub_global_activate() {
  if [[ $# -lt 1 ]]
  then
    echo "Usage: $0 <package>"
    return
  fi

  command -v fvm >/dev/null && fvm flutter pub global activate $1 || flutter pub global activate $1
}

my_flutter() {
  if command -v fvm >/dev/null
  then
    fvm flutter pub get && \
    fvm dart run build_runner build && \
    fvm dart fix --apply && \
    fvm dart format . && \
    fvm flutter analyze
  else
    flutter pub get && \
    dart run build_runner build && \
    dart fix --apply && \
    dart format . && \
    flutter analyze
  fi
}

my_flutter_screenshot() {
  filepath="$HOME/Desktop/${1:-screenshot}.png" && \
  command -v fvm >/dev/null && fvm flutter screenshot --out="$filepath" || flutter screenshot --out="$filepath" && \
  open "$filepath"
}
