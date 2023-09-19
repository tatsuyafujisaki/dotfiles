# opens this file in Visual Studio Code.
alias fp='code ~/.shell_profiles/flutter.profile'

[ -d ~/development/flutter/bin ] && export PATH=${PATH}:~/development/flutter/bin

# Dart
alias dfa='dart fix --apply'
alias dfdr='dart fix --dry-run' # --code=require_trailing_commas,unused_local_variable
alias dpg='dart pub get'
alias dbrw='dart run build_runner watch'
alias dpg='dart pub get'

# Flutter
alias f=flutter
alias fa='flutter analyze'
alias fbrb='flutter pub run build_runner build'
alias fbrw='flutter pub run build_runner watch'
alias fd='flutter doctor'
alias fpg='flutter pub get'
alias fs='flutter screenshot --out=$HOME/Desktop/screenshot.png'

# Karabiner
alias ctk='echo /Hfref/xoc110/Qbphzragf/TvgUho/gbxhfuvzneh_qvire_ncc | rot13 | xargs code'
