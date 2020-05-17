PS1='\e[1;32m\]$(pwd)\[\e[m\n\$ ' # between "\e[{x;ym}\]" and "\[\e[m" will be in color.

is_mac() {
  [ $(uname) == Darwin ]
}

. ~/.shell_profiles/common.profile
