# opens this file in Visual Studio Code.
alias fp='code ~/.shell_profiles/flutter.profile'

[ -d ~/development/flutter/bin ] && export PATH=${PATH}:~/development/flutter/bin

# makes it available 'dart' in Terminal.
[ -d $(~/.asdf/bin/asdf where flutter)/bin ] && export PATH=${PATH}:$(~/.asdf/bin/asdf where flutter)/bin

# Dart
alias dbrw='dart run build_runner watch' # https://pub.dev/packages/riverpod_generator#starting-the-code-generator
alias dfa='dart fix --apply'
alias dfdr='dart fix --dry-run'
alias dpg='dart pub get'
alias drbrb='dart run build_runner build --delete-conflicting-outputs'
alias drbrs='dart run build_runner serve'

# Flutter
alias f=flutter
alias fa='flutter analyze'
alias fd='flutter doctor'
alias fds='flutter devices'
alias fpa='flutter pub add'
alias fpad='flutter pub add --dev'
alias fpg='flutter pub get'
alias fs='flutter screenshot --out=$HOME/Desktop/screenshot.png'

# Karabiner
alias ctk='echo /Hfref/xoc110/Qbphzragf/TvgUho/gbxhfuvzneh_qvire_ncc | rot13 | xargs code'
