PROMPT=$'%F{green}%d%f\n$ ' # between "%F{color}" and "%f" will be in color.

is_mac() {
  [[ $(uname) == Darwin ]]
}

. ~/.profile
