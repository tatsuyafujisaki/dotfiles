. ~/Documents/GitHub/dotfiles/shell/android.profile
. ~/Documents/GitHub/dotfiles/shell/android-screencap-screenrecord.profile
. ~/Documents/GitHub/dotfiles/shell/chatbot.profile
. ~/Documents/GitHub/dotfiles/shell/common.profile
. ~/Documents/GitHub/dotfiles/shell/common-functions.profile
. ~/Documents/GitHub/dotfiles/shell/flutter.profile
. ~/Documents/GitHub/private/private.profile

if [ $(uname) = Darwin ]
then
  . ~/Documents/GitHub/dotfiles/shell/os/mac.profile
else
  . ~/Documents/GitHub/dotfiles/shell/os/linux.profile
fi
