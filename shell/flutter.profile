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
alias da='dart analyze'
alias dfa='dart fix --apply'
alias dfd='dart format .'
alias dfd2='dart format --line-length 120 .'
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
alias ffc='fvm flutter pub global activate flutterfire_cli && flutterfire configure'
alias fpa='fvm flutter pub add'
alias fpad='fvm flutter pub add --dev'
alias fpcc='fvm flutter pub cache clean'
alias fpcr='fvm flutter pub cache repair'
alias fpg='fvm flutter pub get'
alias fpr='fvm flutter pub remove'
alias fpu='fvm flutter pub upgrade --tighten'
alias fpum='fvm flutter pub upgrade --tighten --major-versions'
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

my_refresh_dart() {
  dart pub cache clean --force && \
  dart pub upgrade --tighten --major-versions && \
  dart run build_runner build --delete-conflicting-outputs && \
  dart fix --apply && \
  dart format .
}

my_refresh_flutter() {
  flutter pub cache clean --force && \
  flutter pub upgrade --tighten --major-versions && \
  dart run build_runner build --delete-conflicting-outputs && \
  dart fix --apply && \
  dart format .
}

my_refresh_client_work_flutter() {
  # `flutter pub get` not only downloads packages but also generates app_localizations.dart.
  # https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization
  fvm flutter pub get
  # fvm flutter pub upgrade --tighten --major-versions && \
  fvm dart run build_runner build --delete-conflicting-outputs && \
  fvm dart fix --apply && \
  make fmt # is given by my client in my client work, which is equivalent to `dart format --line-length 120 .`.
}
