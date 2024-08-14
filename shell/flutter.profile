# adds Flutter to PATH on macOS.
[ -d ~/development/flutter/bin ] && export PATH=$PATH:~/development/flutter/bin

# adds flutterfire to PATH.
[ -d ~/.pub-cache/bin ] && export PATH=$PATH:~/.pub-cache/bin

# adds Ruby 3, which is transitively installed for CocoaPods, to PATH before Ruby 2.
[ -d /opt/homebrew/Cellar/ruby/3.3.4/bin ] && export PATH=/opt/homebrew/Cellar/ruby/3.3.4/bin:$PATH

# https://dart.dev/tools/dart-tool
alias da='dart analyze'
alias dfa='dart fix --apply'
alias dfd='dart format --line-length 120 .'
alias dpc='dart pub cache clean'
alias dpcr='dart pub cache repair'
alias dpg='dart pub get'
alias dr='dart run build_runner watch --delete-conflicting-outputs' # https://pub.dev/packages/build_runner & https://pub.dev/packages/riverpod_generator
alias dv='dart --version'

# https://docs.flutter.dev/reference/flutter-cli#flutter-commands
alias f='fvm flutter'
alias fa='fvm flutter analyze'
alias fc='fvm flutter clean'
alias fd='fvm flutter doctor'
alias fds='fvm flutter devices'
alias fpa='fvm flutter pub add'
alias fpad='fvm flutter pub add --dev'
alias fpcr='fvm flutter pub cache repair'
alias fpcc='fvm flutter pub cache clean'
alias fpg='fvm flutter pub get'
alias fpu='fvm flutter pub upgrade'
alias fpum='fvm flutter pub upgrade --major-versions'
alias fs='flutter screenshot --out=$HOME/Desktop/screenshot.png'
alias fu='fvm flutter upgrade --force'
alias fv='fvm flutter --version'

ready() {
  fvm flutter pub cache repair
  dart run build_runner build --delete-conflicting-outputs
  dart fix --apply
  make fmt # is equivalent to "dart format --line-length 120 ." in my client work.
}

unlock() {
  rm pubspec.lock
  rm ios/Podfile.lock
  flutter pub get
  pushd ios
  pod install
  popd
}