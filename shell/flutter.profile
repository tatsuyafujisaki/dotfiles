# opens this file in Visual Studio Code.
alias fp='code ~/.shell_profiles/flutter.profile'

[ -d ~/development/flutter/bin ] && export PATH=${PATH}:~/development/flutter/bin
[ -d ~/.asdf/installs/flutter/3.13.5-stable/bin ] && export PATH=${PATH}:~/.asdf/installs/flutter/3.13.5-stable/bin

# Dart
alias dbrw='dart run build_runner watch' # https://pub.dev/packages/riverpod_generator#starting-the-code-generator
alias dfa='dart fix --apply'
alias dfdr='dart fix --dry-run'
alias dpg='dart pub get'
alias dpg='dart pub get'
alias drbrs='dart run build_runner serve'

# Flutter
alias f=flutter
alias fa='flutter analyze'
alias fd='flutter doctor'
alias fds='flutter devices'
alias fpa='flutter pub add'
alias fpad='flutter pub add --dev'
alias fpg='flutter pub get'
alias fprbr='flutter pub run build_runner build --delete-conflicting-outputs'
alias fs='flutter screenshot --out=$HOME/Desktop/screenshot.png'

# Karabiner
alias ctk='echo /Hfref/xoc110/Qbphzragf/TvgUho/gbxhfuvzneh_qvire_ncc | rot13 | xargs code'
