# A string between %B and %b will be in bold.
# A string between "%F{color}" and "%f" will be in color.
PS1=$'%B%F{green}%d%f%b\n$ '

# avoids printing "no matches found" to the standard output when using a glob, for example, in the "ls" command.
setopt nonomatch

# avoids showing a confirmation when running rm.
setopt rmstarsilent

# prevents the following error from occurring when you run a command with a comment
# $ cd ~ # returns home.
# > cd: too many arguments
setopt interactivecomments

# prevents
# > When a partial line is preserved, by default you will see an inverse+bold character at the end of the partial line: a ‘%’ for a normal user or a ‘#’ for root. If set, the shell parameter PROMPT_EOL_MARK can be used to customize how the end of partial lines are shown.
# https://zsh.sourceforge.io/Doc/Release/Options.html#Prompting
export PROMPT_EOL_MARK=''

# Case-insensitive tab completion
# -u in "compinit -u" is to avoid showing an error in the following case. In short, if you only have one user, you won't have a problem.
# > For security reasons compinit also checks if the completion system would use files not owned by root or by the current user, ...
# https://zsh.sourceforge.io/Doc/Release/Completion-System.html
autoload -U compinit && compinit -u && zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'


for profile in ~/Documents/GitHub/dotfiles/shell/profiles/*.profile ~/Documents/GitHub/private/private.profile
do
  . "$profile"
done
