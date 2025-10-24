# adds "flutter" to PATH.
[[ -d "$HOME/development/flutter/bin" ]] && export PATH="$PATH:$HOME/development/flutter/bin"

# adds "fvm" to PATH.
[[ -d "$HOME/.fvm_flutter/bin" ]] && export PATH="$PATH:$HOME/.fvm_flutter/bin"

# adds "dart" and "flutter", which are installed via FVM, to PATH.
fvm_latest_installed_flutter_version=$(ls -1 "$HOME/fvm/versions" 2>/dev/null | tail -1)
[[ -n "$fvm_latest_installed_flutter_version" && -d "$HOME/fvm/versions/$fvm_latest_installed_flutter_version/bin" ]] && export PATH="$PATH:$HOME/fvm/versions/$fvm_latest_installed_flutter_version/bin"

# adds executables such as "flutterfire" and "protoc", which are installed via "dart pub global activate <package_name>", to PATH.
# https://firebase.google.com/docs/flutter/setup
# https://grpc.io/docs/languages/dart/quickstart
# https://pub.dev/packages/protoc_plugin
[[ -d "$HOME/.pub-cache/bin" ]] && export PATH="$PATH:$HOME/.pub-cache/bin"

#
# https://dart.dev/tools/dart-tool
#

alias da='dart analyze'
alias dfa='dart fix --apply'
alias dfd='dart format .'
alias dpc='dart pub cache clean --force'
alias dpcr='dart pub cache repair'
alias dpg='dart pub get'
alias drbrb='dart run build_runner build'
alias drbrw='dart run build_runner watch'

#
# https://docs.flutter.dev/reference/flutter-cli#flutter-commands
#

# > Run `flutter analyze --suggestions` to see if your Android Gradle Plugin (AGP), Java, and Gradle versions are compatible.
# https://docs.flutter.dev/release/breaking-changes/android-java-gradle-migration-guide#solution-2-command-line
alias fa='flutter analyze && flutter analyze --suggestions'
alias fc='flutter clean'
alias fcjdk17='flutter config --jdk-dir "$(/usr/libexec/java_home -v 17)"' # updates ~/.config/flutter/settings
alias fcp='flutter create --platforms=android,ios delete_me' # useful for checking the structure of modern projects and the contents of files, especially those in the android and ios folders.
alias fd='flutter doctor'
alias fds='flutter devices'
alias ff='flutter'
alias ffc='flutter pub global activate flutterfire_cli && flutterfire configure'
alias fpa='flutter pub add'
alias fpcc='flutter pub cache clean --force'
alias fpcr='flutter pub cache repair'
alias fpg='flutter pub get'
alias fpo='flutter pub outdated'
alias fpr='flutter pub remove'
alias fpum='flutter pub upgrade --major-versions'
alias fput='flutter pub upgrade --tighten'
alias fu='flutter upgrade --force'
alias fv='flutter --version'

my_dart() {
  dart pub get && \
  dart run build_runner build --delete-conflicting-outputs && \
  dart fix --apply && \
  dart format . && \
  dart analyze
}

my_dart_clean() {
  dart pub cache clean --force
}

my_flutter_clean() {
  flutter clean && \
  flutter pub cache clean --force
}

my_flutter() {
  # `flutter pub get` not only downloads packages but also generates app_localizations.dart.
  # https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization
  flutter pub get && \
  dart run build_runner build --delete-conflicting-outputs && \
  dart fix --apply && \
  dart format . && \
  flutter analyze --suggestions

}

my_flutter_screenshot() {
  filepath="$HOME/Desktop/${1:-screenshot}.png"
  flutter screenshot --out="$filepath"
  open "$filepath"
}
