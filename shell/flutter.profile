# adds Flutter to PATH on macOS.
[ -d ~/development/flutter/bin ] && export PATH=$PATH:~/development/flutter/bin

# adds flutterfire to PATH.
[ -d ~/.pub-cache/bin ] && export PATH=$PATH:~/.pub-cache/bin

# adds Ruby 3, which is transitively installed for CocoaPods, to PATH before Ruby 2.
[ -d /opt/homebrew/Cellar/ruby/3.3.4/bin ] && export PATH=/opt/homebrew/Cellar/ruby/3.3.4/bin:$PATH

# Dart
alias da='dart analyze'
alias dfa='dart fix --apply'
alias dfd='dart format .'
alias dpa='dart pub add'
alias dpcr='dart pub cache repair'
alias dpg='dart pub get'
alias dr='dart run build_runner watch --delete-conflicting-outputs' # https://pub.dev/packages/riverpod_generator#starting-the-code-generator
alias dv='dart --version'

# Flutter
alias f=flutter
alias ff='flutter'
alias fa='flutter analyze'
alias fcl='flutter clean'
alias fca='flutter create --platforms=android .'
alias fci='flutter create --platforms=ios .'
alias fd='flutter doctor'
alias fds='flutter devices'
alias fpa='flutter pub add'
alias fpad='flutter pub add --dev'
alias fpcr='flutter pub cache repair'
alias fpg='flutter pub get'
alias fpu='flutter pub upgrade'
alias fpum='flutter pub upgrade --major-versions'
alias fr='flutter run'
alias frd='flutter run --dart-define=FLAVOR=dev'
alias frs='flutter run --dart-define=FLAVOR=stg'
alias fs='flutter screenshot --out=$HOME/Desktop/screenshot.png'
alias ft='flutter test'
alias fu='flutter upgrade --force'
alias fv='flutter --version'

unlock() {
  rm pubspec.lock
  rm ios/Podfile.lock
  flutter pub get
  pushd ios
  pod install
  popd
}

#
# https://pub.dev/packages/flutter_gen
#

my_flutter_gen() {
  dart pub global activate flutter_gen
  fluttergen pubspec.yaml
}
