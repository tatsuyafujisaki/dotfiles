# adds Flutter to PATH on macOS without asdf.
[ -d ~/development/flutter/bin ] && export PATH=$PATH:~/development/flutter/bin

# adds flutterfire to PATH.
[ -d ~/.pub-cache/bin ] && export PATH=$PATH:~/.pub-cache/bin

# adds Ruby 3, which is transitively installed for CocoaPods, to PATH before Ruby 2.
[ -d /opt/homebrew/Cellar/ruby/3.3.0/bin ] && export PATH=/opt/homebrew/Cellar/ruby/3.3.0/bin:$PATH

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
alias ff='fvm flutter'
alias fa='fvm flutter analyze'
alias fcl='fvm flutter clean'
alias fca='fvm flutter create --platforms=android .'
alias fci='fvm flutter create --platforms=ios .'
alias fd='fvm flutter doctor'
alias fds='fvm flutter devices'
alias fpa='fvm flutter pub add'
alias fpad='fvm flutter pub add --dev'
alias fpcr='fvm flutter pub cache repair'
alias fpg='fvm flutter pub get'
alias fpu='fvm flutter pub upgrade'
alias fpum='fvm flutter pub upgrade --major-versions'
alias fr='fvm flutter run'
alias frd='fvm flutter run --dart-define=FLAVOR=dev'
alias frs='fvm flutter run --dart-define=FLAVOR=stg'
alias fs='fvm flutter screenshot --out=$HOME/Desktop/screenshot.png'
alias ft='fvm flutter test'
alias fu='fvm flutter upgrade'
alias fv='fvm flutter --version'

unlock() {
  rm pubspec.lock
  rm ios/Podfile.lock
  fvm flutter pub get
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
