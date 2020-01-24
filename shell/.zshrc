PROMPT=$'%F{green}%d%f\n$ ' # A string between %F{color} and %f will be in color.

is_mac() {
  [[ $(uname) == Darwin ]]
}

. ~/.profile
