# A string between %B and %b will be in bold.
# A string between "%F{color}" and "%f" will be in color.
PS1=$'%B%F{green}%d%f%b\n$ '

# Avoid printing "no matches found" to the standard output when using a glob, for example, in the "ls" command.
setopt nonomatch

# Avoid showing a confirmation when running rm.
setopt rmstarsilent

# Case-insensitive tab completion
autoload -U compinit && compinit && zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'

. ~/.shell_profiles/adb.profile
. ~/.shell_profiles/common.profile
. ~/.shell_profiles/common-functions.profile
. ~/.shell_profiles/private.profile

if [ $(uname) = Darwin ]
then
  . ~/.shell_profiles/mac.profile
else
  . ~/.shell_profiles/linux.profile
fi

#
# Cloud SDK
#

# The next line updates PATH for the Google Cloud SDK.
[ -f ~/google-cloud-sdk/path.zsh.inc ] && . '/Users/tatsuyafujisaki/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
[ -f ~/google-cloud-sdk/completion.zsh.inc ] && . '/Users/tatsuyafujisaki/google-cloud-sdk/completion.zsh.inc'
