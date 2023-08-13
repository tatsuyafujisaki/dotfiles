PS1='\e[1;32m\]$(pwd)\[\e[m\n\$ ' # A string between "\e[{x;ym}\]" and "\[\e[m" will be in color.

. ~/.shell_profiles/adb.profile
. ~/.shell_profiles/common.profile
. ~/.shell_profiles/common-functions.profile
. ~/.shell_profiles/private.profile

if [ $(uname) = Darwin ]
then
  . ~/.shell_profiles/mac.profile
else
  . ~/.shell_profiles/linux.profile
fi
