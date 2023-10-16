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
alias dbrw='dart run build_runner watch' # https://pub.dev/packages/riverpod_generator#starting-the-code-generator
alias dfa='dart fix --apply'
alias dfdr='dart fix --dry-run'
alias dpg='dart pub get'
alias drbrb='dart run build_runner build --delete-conflicting-outputs'
alias drbrs='dart run build_runner serve'
alias dv='dart --version'

# Flutter
alias f=flutter
alias fa='flutter analyze'
alias fcl='flutter clean'
alias fcr='flutter create --platforms=ios,web .'
alias fd='flutter doctor'
alias fds='flutter devices'
alias fpa='flutter pub add'
alias fpad='flutter pub add --dev'
alias fpg='flutter pub get'
alias fr='flutter run'
alias frr='flutter run --dart-define=FLAVOR=stg'
alias frrr='flutter run --dart-define=FLAVOR=stg --release'
alias fs='flutter screenshot --out=$HOME/Desktop/screenshot.png'
alias fv='flutter --version'

# Karabiner
alias ctk='echo /Hfref/xoc110/Qbphzragf/TvgUho/gbxhfuvzneh_qvire_ncc | rot13 | xargs code'
