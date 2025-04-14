# adds Flutter to PATH on macOS.
[ -d ~/development/flutter/bin ] && export PATH=$PATH:~/development/flutter/bin

# adds protoc to PATH.
# https://grpc.io/docs/languages/dart/quickstart
# https://pub.dev/packages/protoc_plugin
[ -d ~/.pub-cache/bin ] && export PATH=$PATH:~/.pub-cache/bin

# adds Ruby 3, which is transitively installed by CocoaPods, to PATH before Ruby 2.
ruby_version=$(ls -1 /opt/homebrew/Cellar/ruby | tail -1)
[ -d /opt/homebrew/Cellar/ruby/$ruby_version/bin ] && export PATH=/opt/homebrew/Cellar/ruby/$ruby_version/bin:$PATH
unset ruby_version

# https://dart.dev/tools/dart-tool
alias da='fvm dart analyze'
alias dfa='fvm dart fix --apply'
alias dfd='fvm dart format .'
alias dfd2='fvm dart format --line-length 120 .'
alias dpc='fvm dart pub cache clean --force'
alias dpcr='fvm dart pub cache repair'
alias dpg='fvm dart pub get'
# https://dart.dev/tools/build_runner#using-built-in-commands
# https://pub.dev/packages/build_runner
# https://pub.dev/packages/riverpod_generator
alias drr='fvm dart run build_runner build --delete-conflicting-outputs'
alias drw='fvm dart run build_runner watch --delete-conflicting-outputs'
alias dv='fvm dart --version'

# https://docs.flutter.dev/reference/flutter-cli#flutter-commands
alias fa='fvm flutter analyze'
alias fc='fvm flutter clean'
alias fd='fvm flutter doctor'
alias fds='fvm flutter devices'
alias ff='fvm flutter'
alias ffc='fvm flutter pub global activate flutterfire_cli && flutterfire configure'
alias fpa='fvm flutter pub add'
alias fpcc='fvm flutter pub cache clean --force'
alias fpcr='fvm flutter pub cache repair'
alias fpg='fvm flutter pub get'
alias fpo='fvm flutter pub outdated'
alias fpr='fvm flutter pub remove'
alias fpum='fvm flutter pub upgrade --major-versions'
alias fput='fvm flutter pub upgrade --tighten'
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

# my dart refresh
myd() {
  # dart pub cache clean --force && \
  dart run build_runner build --delete-conflicting-outputs && \
  dart fix --apply && \
  dart format .
}

# my flutter refresh
myf() {
  fvm flutter clean && \
  fvm flutter pub cache clean --force && \
  # `flutter pub get` not only downloads packages but also generates app_localizations.dart.
  # https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization
  fvm flutter pub get && \
  fvm dart run build_runner build --delete-conflicting-outputs && \
  fvm dart fix --apply && \
  fvm dart format .
}

# my client work
mycw() {
  # fvm flutter clean && \
  # fvm flutter pub cache clean --force && \
  make all # is given by my client in my client work, which is equivalent to `dart format --line-length 120 .`.
  make run
}
