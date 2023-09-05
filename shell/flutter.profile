# opens this file in Visual Studio Code.
alias fpp='code ~/.shell_profiles/flutter.profile'

[ -d ~/development/flutter/bin ] && export PATH=${PATH}:~/development/flutter/bin

# Uncomment the following if `flutter doctor` fails for the Android toolchain.
# ln -s "/Applications/Android Studio.app" ~/Applications

# Uncomment the following if `flutter doctor` fails for Android Studio.
# cd /Applications/Android Studio.app/Contents
# ln -s jbr jre

# Dart
alias d=dart
alias dp='dart pub'
alias dpg='dart pub get'

# Flutter
alias f=flutter
alias fd='flutter doctor'
alias fp='flutter pub'
alias fpg='flutter pub get'
