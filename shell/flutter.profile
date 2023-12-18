# adds Flutter to PATH on macOS without asdf.
[ -d ~/development/flutter/bin ] && export PATH=$PATH:~/development/flutter/bin

# adds flutterfire to PATH.
[ -d ~/.pub-cache/bin ] && export PATH=$PATH:~/.pub-cache/bin

# adds Ruby 3, which is transitively installed for CocoaPods, to PATH before Ruby 2.
[ -d /opt/homebrew/Cellar/ruby/3.2.2_1/bin ] && export PATH=/opt/homebrew/Cellar/ruby/3.2.2_1/bin:$PATH

# Dart
alias dfa='dart fix --apply'
alias dfd='dart format .'
alias dpa='dart pub add'
alias dpcr='dart pub cache repair'
alias dpg='dart pub get'
alias dr='dart run build_runner watch --delete-conflicting-outputs' # https://pub.dev/packages/riverpod_generator#starting-the-code-generator
alias dv='dart --version'

# Flutter
alias f=flutter
alias fa='flutter analyze'
alias fcl='flutter clean'
alias fca='flutter create --platforms=android .'
alias fci='flutter create --platforms=ios .'
alias fd='flutter doctor'
alias fds='flutter devices'
alias ffd='flutter format .'
alias fpa='flutter pub add'
alias fpad='flutter pub add --dev'
alias fpcr='flutter pub cache repair'
alias fpg='flutter pub get'
alias fpu='flutter pub upgrade'
alias fpum='flutter pub upgrade --major-versions'
alias fr='flutter run'
alias frd='flutter run --dart-define=FLAVOR=dev'
alias frs='flutter run --dart-define=FLAVOR=stg'
alias fs='flutter screenshot --out=$HOME/Desktop/screenshot.png'
alias fv='flutter --version'

#
# asdf
#

[ -d ~/.asdf/bin ] && export PATH=$PATH:~/.asdf/bin

# makes 'flutter' available in Visual Studio Code.
# https://github.com/oae/asdf-flutter#vscode
[ -d ~/.asdf/bin ] && export FLUTTER_ROOT=$(asdf where flutter)

# makes 'flutter' and 'dart' available in Terminal.
[ -d $FLUTTER_ROOT/bin ] && export PATH=$PATH:$FLUTTER_ROOT/bin

alias asdf3='asdf global flutter 3.3.10-stable'
alias asdf7='asdf global flutter 3.7.12-stable'
alias asdfc='asdf current flutter'
alias asdfg='asdf global flutter'
alias asdfgl='asdf global flutter latest'
alias asdfi='asdf install flutter'
alias asdfil='asdf install flutter latest'
alias asdfl='asdf list flutter'
alias asdfla='asdf list all flutter | uniq'
alias asdflc='asdf local flutter'
alias asdfu='asdf uninstall flutter'