# between %B and %b will be in bold.
# between "%F{color}" and "%f" will be in color.
PS1=$'%B%F{green}%d%f%b\n$ '

is_mac() {
  [[ $(uname) == Darwin ]]
}

. ~/.profile
