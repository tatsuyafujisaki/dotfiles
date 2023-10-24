# opens this file in Visual Studio Code.
alias fp='code ~/.shell_profiles/flutter.profile'

# adds Flutter to PATH on macOS without asdf.
[ -d ~/development/flutter/bin ] && export PATH=${PATH}:~/development/flutter/bin

#
# asdf
#

[ -d ~/.asdf/bin ] && export PATH=$PATH:~/.asdf/bin

# makes 'flutter' available in Visual Studio Code.
# https://github.com/oae/asdf-flutter#vscode
export FLUTTER_ROOT=$(asdf where flutter)

# makes 'flutter' and 'dart' available in Terminal.
[ -d $FLUTTER_ROOT/bin ] && export PATH=$PATH:$FLUTTER_ROOT/bin

# Dart
alias dfa='dart fix --apply'
alias dfdr='dart fix --dry-run'
alias dpa='dart pub add'
alias dpg='dart pub get'
alias drbrb='dart run build_runner build --delete-conflicting-outputs' # https://pub.dev/packages/build_runner
alias drbrw='dart run build_runner watch --delete-conflicting-outputs' # https://pub.dev/packages/riverpod_generator#starting-the-code-generator
alias dv='dart --version'

# Flutter
alias f=flutter
alias fa='flutter analyze'
alias fcl='flutter clean'
alias fcr='flutter create --platforms=android,ios .'
alias fd='flutter doctor'
alias fds='flutter devices'
alias fpa='flutter pub add'
alias fpad='flutter pub add --dev'
alias fpg='flutter pub get'
alias fr='flutter run'
alias frr='flutter run --dart-define=FLAVOR=stg'
alias fs='flutter screenshot --out=$HOME/Desktop/screenshot.png'
alias fv='flutter --version'
