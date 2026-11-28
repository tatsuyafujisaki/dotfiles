path=(
  # Adds executables such as "flutterfire", which is installed via "dart pub global activate <package_name>".
  # https://firebase.google.com/docs/flutter/setup
  "$HOME/.pub-cache/bin"(N-/)
  # Adds "fvm" to PATH.
  "$HOME/fvm/bin"(N-/)
  $path
)

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
alias fcp='fvm flutter create --platforms android,ios delete_me' # Useful for checking the structure of modern projects and the contents of files, especially those in the android and ios folders.
alias fd='fvm flutter doctor'
alias fds='fvm flutter devices'
alias fpa='fvm flutter pub add'
alias fpcg='fvm flutter pub cache gc --force'
alias fpg='rm -f pubspec.lock && fvm flutter pub get'
alias fpo='fvm flutter pub outdated'
alias fpr='fvm flutter pub remove'
alias fpu='fvm flutter pub upgrade --major-versions --tighten'
alias fri="fvm flutter run --device-id"
alias fu='flutter upgrade --force' # The command 'fvm flutter upgrade --force' generates an error from FVM because it is not intended to be used with the flutter upgrade process.
alias fv='fvm flutter --version'

#
# https://developer.apple.com/xcode
#

alias xc='open ios/*.xcworkspace'

#
# https://fvm.app
#

my_fvm_use() {
  fvm remove --all && fvm use "$@" && fvm flutter clean
}

#
# Miscellaneous
#

ff() {
  rm -f pubspec.lock ios/Runner.xcworkspace/xcshareddata/swiftpm/Package.resolved &&
  fvm flutter pub get &&
  (! grep --quiet "build_runner:" pubspec.yaml || fvm dart run build_runner build) &&
  fvm dart fix --apply &&
  fvm dart format . &&
  fvm flutter analyze
}
