PS1='\[\e];[\u@\h] $(pwd)\a\]\[\e[1;32m\]$(pwd)\[\e[m\n\$ '

is_mac() {
  [ $(uname) == Darwin ]
}

unset HISTFILE # avoids creating ~/.bash_history

. ~/.profile
