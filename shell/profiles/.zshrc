# A string between %B and %b will be in bold.
# A string between "%F{color}" and "%f" will be in color.
PS1=$'%B%F{green}%d%f%b\n$ '

# Avoid printing "no matches found" to the standard output when using a glob, for example, in the "ls" command.
setopt nonomatch

# Case-insensitive tab completion
autoload -U compinit && compinit && zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'

is_mac() {
  [[ $(uname) == Darwin ]]
}

. ~/.profile
