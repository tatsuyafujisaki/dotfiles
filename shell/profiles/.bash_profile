PS1='\e[1;32m\]$(pwd)\[\e[m\n\$ ' # between "\e[{x;ym}\]" and "\[\e[m" will be in color.

is_mac() {
  [ $(uname) == Darwin ]
}

. ~/.shell_profiles/adb.profile
. ~/.shell_profiles/common.profile
. ~/.shell_profiles/functions.profile
. ~/.shell_profiles/private.profile

if [ $(uname) = Darwin ]
then
  . ~/.shell_profiles/mac.profile
else
  . ~/.shell_profiles/linux.profile
fi
