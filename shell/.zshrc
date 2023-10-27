# A string between %B and %b will be in bold.
# A string between "%F{color}" and "%f" will be in color.
PS1=$'%B%F{green}%d%f%b\n$ '

# Avoid printing "no matches found" to the standard output when using a glob, for example, in the "ls" command.
setopt nonomatch

# Avoid showing a confirmation when running rm.
setopt rmstarsilent

# Case-insensitive tab completion
# -u in "compinit -u" is to avoid showing an error in the following case. In short, if you only have one user, you won't have a problem.
# > For security reasons compinit also checks if the completion system would use files not owned by root or by the current user, ...
# https://zsh.sourceforge.io/Doc/Release/Completion-System.html
autoload -U compinit && compinit -u && zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'

. ~/Documents/GitHub/dotfiles/shell/adb.profile
. ~/Documents/GitHub/dotfiles/shell/common.profile
. ~/Documents/GitHub/dotfiles/shell/common-functions.profile
. ~/Documents/GitHub/dotfiles/shell/flutter.profile
. ~/Documents/GitHub/private/private.profile

if [ $(uname) = Darwin ]
then
  . ~/Documents/GitHub/dotfiles/shell/mac.profile
else
  . ~/Documents/GitHub/dotfiles/shell/linux.profile
fi
