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

#
# https://dart.dev/tools/dart-tool
#

alias da='dart analyze'
alias dfa='dart fix --apply'
alias dfd='dart format .'
alias dpc='dart pub cache clean --force'
alias dpcr='dart pub cache repair'
alias dpg='dart pub get'
# https://dart.dev/tools/build_runner#using-built-in-commands
# https://pub.dev/packages/build_runner
# https://pub.dev/packages/riverpod_generator
alias drr='dart run build_runner build --delete-conflicting-outputs'
alias drw='dart run build_runner watch --delete-conflicting-outputs'

#
# https://docs.flutter.dev/reference/flutter-cli#flutter-commands
#

# > Run `flutter analyze --suggestions` to see if your Android Gradle Plugin (AGP), Java, and Gradle versions are compatible.
# https://docs.flutter.dev/release/breaking-changes/android-java-gradle-migration-guide#solution-2-command-line
alias fa='flutter analyze && flutter analyze --suggestions'
alias fc='flutter clean'
alias fcjdk='flutter config --jdk-dir' # takes the path to the JDK as an argument. Running the command updates ~/.config/flutter/settings
alias fd='flutter doctor'
alias fds='flutter devices'
alias ff='flutter'
alias ffc='flutter pub global activate flutterfire_cli && flutterfire configure'
alias fpa='flutter pub add'
alias fpcc='flutter pub cache clean --force'
alias fpcr='flutter pub cache repair'
alias fpg='flutter pub get'
alias fpo='flutter pub outdated'
alias fpr='flutter pub remove'
alias fpum='flutter pub upgrade --major-versions'
alias fput='flutter pub upgrade --tighten'
alias fu='flutter upgrade --force'
alias fv='flutter --version'

fs() {
  if [ ${#} -lt 1 ]
  then
    filepath=$HOME/Desktop/screenshot.png
  else
    filepath=$HOME/Desktop/$1.png
  fi

  flutter screenshot --out=$filepath
  open $filepath
}

my_clean_dart() {
  dart pub cache clean --force
}

my_clean_flutter() {
  flutter clean && \
  flutter pub cache clean --force
}

# my dart refresh
my_dart() {
  dart pub get && \
  dart run build_runner build --delete-conflicting-outputs && \
  dart fix --apply && \
  dart format . && \
  dart analyze
}

my_flutter() {
  # `flutter pub get` not only downloads packages but also generates app_localizations.dart.
  # https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization
  flutter pub get && \
  dart run build_runner build --delete-conflicting-outputs && \
  dart fix --apply && \
  dart format . && \
  flutter analyze && \
  flutter analyze --suggestions
}
