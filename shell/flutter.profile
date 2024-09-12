# adds Flutter to PATH on macOS.
[ -d ~/development/flutter/bin ] && export PATH=$PATH:~/development/flutter/bin

# adds protoc to PATH.
# https://grpc.io/docs/languages/dart/quickstart
# https://pub.dev/packages/protoc_plugin
[ -d ~/.pub-cache/bin ] && export PATH=$PATH:~/.pub-cache/bin

# adds Ruby 3, which is transitively installed by CocoaPods, to PATH before Ruby 2.
[ -d /opt/homebrew/Cellar/ruby/3.3.4/bin ] && export PATH=/opt/homebrew/Cellar/ruby/3.3.4/bin:$PATH

# https://dart.dev/tools/dart-tool
alias da='dart analyze'
alias dfa='dart fix --apply'
alias dfd='dart format --line-length 120 .'
alias dpc='dart pub cache clean'
alias dpcr='dart pub cache repair'
alias dpg='dart pub get'
# https://dart.dev/tools/build_runner#using-built-in-commands
# https://pub.dev/packages/build_runner
# https://pub.dev/packages/riverpod_generator
alias drr='dart run build_runner build --delete-conflicting-outputs'
alias drw='dart run build_runner watch --delete-conflicting-outputs'
alias dv='dart --version'

# https://docs.flutter.dev/reference/flutter-cli#flutter-commands
alias f10='fvm flutter gen-l10n'
alias fa='fvm flutter analyze'
alias fc='fvm flutter clean'
alias fd='fvm flutter doctor'
alias fds='fvm flutter devices'
alias ff='fvm flutter'
alias ffc='fvm flutter pub global activate flutterfire_cli && flutterfire configure --yes'
alias fpa='fvm flutter pub add'
alias fpad='fvm flutter pub add --dev'
alias fpcc='fvm flutter pub cache clean'
alias fpcr='fvm flutter pub cache repair'
alias fpg='fvm flutter pub get'
alias fpu='fvm flutter pub upgrade'
alias fpum='fvm flutter pub upgrade --major-versions'
alias fu='fvm flutter upgrade --force'
alias fv='fvm flutter --version'

fs() {
  if [ ${#} -lt 1 ]
  then
    filepath=$HOME/Desktop/screenshot.png
  else
    filepath=$HOME/Desktop/$1.png
  fi

  fvm flutter screenshot --out=$filepath
  open $filepath
}

ready() {
  dart run build_runner build --delete-conflicting-outputs
  dart fix --apply
  # not only downloads packages but also generates app_localizations.dart.
  # https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalizations
  fvm flutter pub get
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