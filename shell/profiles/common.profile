unset HISTFILE # avoids creating $HISTFILE (i.e. ~/.bash_history on Bash and ~/.zsh_history on Zsh)

export EDITOR=nano # makes 'crontab -e' use nano instead of vim
export LESS=IMRS
export LESSHISTFILE=- # avoids creating ~/.lesshst
export NODE_REPL_HISTORY='' # avoids creating ~/.node_repl_history

#
# https://cloud.google.com/sdk
#

# The next line updates PATH for the Google Cloud SDK.
[[ -f ~/google-cloud-sdk/path.zsh.inc ]] && . ~/google-cloud-sdk/path.zsh.inc

# The next line enables shell command completion for gcloud.
[[ -f ~/google-cloud-sdk/completion.zsh.inc ]] && . ~/google-cloud-sdk/completion.zsh.inc

#
# cd-related
#

alias ap='cd ~/Documents/GitHub/android-playground'
alias asl='cd ~/Documents/GitHub/apps-script-library'
alias d='cd ~/Desktop'
alias df='cd ~/Documents/GitHub/dotfiles'
alias dnp='cd ~/Documents/GitHub/deno-playground'
alias dp='cd ~/Documents/GitHub/dart_playground'
alias fp='cd ~/Documents/GitHub/flutter_playground'
alias h='cd ~/Documents/GitHub'
alias jp='cd ~/Documents/GitHub/java-playground'
alias kp='cd ~/Documents/GitHub/kotlin-playground'

#
# https://code.visualstudio.com
# https://cursor.com
#

alias c="${$(command -v cursor):-code} ."
alias cdp="${$(command -v cursor):-code} ~/Documents/GitHub/dart_playground"
alias cfpp="${$(command -v cursor):-code} ~/Documents/GitHub/flutter_playground"
alias gp="${$(command -v cursor):-code} ~/Documents/GitHub/android-playground/gradle.properties"

#
# https://nodejs.org
#

export PATH="$PATH:/opt/homebrew/Cellar/node/$(ls -1 /opt/homebrew/Cellar/node)/bin" # makes the Gemini CLI command `gemini` available.

#
# https://www.npmjs.com
#

alias npmig='npm install --global'
alias npmug='npm uninstall --global'

#
# https://pip.pypa.io
#

alias pipi='pip3 install'
alias pipl='pip3 list'
alias pipu='pip3 uninstall --yes'

#
# https://cli.github.com
#

alias pr='gh pr create --assignee @me --web'
alias prl='gh pr list --web'
alias prv='gh pr view --web'

# "build" means Flutter's build directory.
# https://man.freebsd.org/cgi/man.cgi?query=grep
alias mygrep='grep --ignore-case --line-number --recursive -I --exclude-dir .git'

# https://man.freebsd.org/cgi/man.cgi?query=pkill
alias p='pkill -f gradle'
alias show_path='echo ${PATH} | tr : \\n'

#
# https://gradle.org
#

alias gw=./gradlew
alias gwp='code gradle/wrapper/gradle-wrapper.properties'
alias gws='./gradlew --stop'

# Ideally, only the line with the largest version would be kept when there are multiple lines for different versions of the same library, but this is difficult. This is because, when comparing versions in text, 1.2 is considered larger than 1.10.
# sed -E 's/^[^[:alpha:]]*//' removes leading non-alphabetic characters.
# sed -E 's/(.*):[0-9.]+ -> ([0-9.]+)$/\1:\2/' changes "foo:1.0 -> 2.0" to "foo:2.0".
alias print_app_module_dependencies_as_list="./gradlew app:dependencies | grep -- '---' | grep '[0-9]' | grep -v '(c)$' | grep -v '(n)$' | grep -v '(\*)$' | sed -E 's/^[^[:alpha:]]*//' | sed -E 's/(.*):[0-9.]+ -> ([0-9.]+)$/\1:\2/' | sort --unique"

#
# JDK (Java Development Kit)
#

alias jh='/usr/libexec/java_home --verbose'

#
# https://asdf-vm.com
#

# Adds tools installed via asdf to PATH.
[[ -d "$HOME/.asdf/shims" ]] && export PATH="$PATH:$HOME/.asdf/shims"

#
# Miscellaneous aliases
#

alias delmedia='cd ~/Desktop && rm -f *.{gif,jpeg,jpg,mp4,png,svg,webm} .DS_Store 2>/dev/null'
alias g=git
alias delete_status_bar='magick *.png -crop +0+40 -gravity North output.png' # delets the status bar from the iPhone screenshot.
