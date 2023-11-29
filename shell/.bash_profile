PS1='\e[1;32m\]$(pwd)\[\e[m\n\$ ' # A string between "\e[{x;ym}\]" and "\[\e[m" will be in color.

. ~/Documents/GitHub/dotfiles/shell/android.profile
. ~/Documents/GitHub/dotfiles/shell/common.profile
. ~/Documents/GitHub/dotfiles/shell/common-functions.profile
. ~/Documents/GitHub/dotfiles/shell/flutter.profile
. ~/Documents/GitHub/private/private.profile

if [ $(uname) = Darwin ]
then
  . ~/.shell_profiles/mac.profile
else
  . ~/.shell_profiles/linux.profile
fi
