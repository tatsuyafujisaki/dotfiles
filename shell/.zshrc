# Prompt & Git Information
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%F{yellow}(%b)%f '
PS1=$'%B%F{green}%~%f%b ${vcs_info_msg_0_}\n%(?.%F{green}.%F{red})$%f '

# Shell Options
setopt prompt_subst nonomatch interactive_comments
export PROMPT_EOL_MARK=''

# Completion
autoload -Uz compinit && compinit -u
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Prevents creation of the .zsh_history file.
export HISTFILE=/dev/null
SAVEHIST=0
# Note: "HISTSIZE=0" shouldn't be set, as it makes the previous command unavailable.

# https://mise.jdx.dev/cli/activate.html
eval "$(mise activate zsh)"

# Source profiles
for f (~/Documents/GitHub/dotfiles/shell/profiles/*.profile(N) ~/Documents/GitHub/private/private.profile(N)) source $f
