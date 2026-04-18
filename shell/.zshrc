# Prompt & Git Information
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%F{yellow}(%b)%f '
PS1=$'%B%F{green}%~%f%b ${vcs_info_msg_0_}\n%(?.%F{green}.%F{red})$%f '

# Shell Options
setopt prompt_subst nonomatch interactive_comments
export PROMPT_EOL_MARK=''

# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Source profiles
for f (~/Documents/GitHub/dotfiles/shell/profiles/*.profile(N) ~/Documents/GitHub/private/private.profile(N)) source $f
