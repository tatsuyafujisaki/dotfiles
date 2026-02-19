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

# https://zsh.sourceforge.io/Doc/Release/Shell-Builtin-Commands.html
autoload -Uz compinit

# https://zsh.sourceforge.io/Doc/Release/Completion-System.html#Use-of-compinit
compinit

# https://zsh.sourceforge.io/Doc/Release/Zsh-Modules.html#The-zsh_002fzutil-Module
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

for profile in ~/Documents/GitHub/dotfiles/shell/profiles/*.profile ~/Documents/GitHub/private/private.profile
do
  . "$profile"
done

# https://direnv.net/docs/hook.html#zsh
if command -v direnv >/dev/null 2>&1
then
  eval "$(direnv hook zsh)"
fi
