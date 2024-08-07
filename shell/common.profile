unset HISTFILE # avoids creating $HISTFILE (i.e. ~/.bash_history on Bash and ~/.zsh_history on Zsh)

export EDITOR=nano # makes 'crontab -e' use nano instead of vim
export HISTCONTROL=ignoreboth
export LESS=IMRS
export LESSHISTFILE=- # avoids creating ~/.lesshst
export NODE_REPL_HISTORY='' # avoids creating ~/.node_repl_history

#
# Google Cloud SDK / gcloud CLI
#

# The next line updates PATH for the Google Cloud SDK.
[ -f ~/google-cloud-sdk/path.zsh.inc ] && . ~/google-cloud-sdk/path.zsh.inc

# The next line enables shell command completion for gcloud.
[ -f ~/google-cloud-sdk/completion.zsh.inc ] && . ~/google-cloud-sdk/completion.zsh.inc

#
# cd-related
#

alias ap='cd ~/Documents/GitHub/android-playground'
alias d='cd ~/Desktop'
alias dp='cd ~/Documents/GitHub/dart_playground'
alias fp='cd ~/Documents/GitHub/flutter_playground'
alias h='cd ~/Documents/GitHub'
alias kp='cd ~/Documents/GitHub/kotlin-playground'

#
# Visual Studio Code-related
#

alias c='code .'
alias cdp='code ~/Documents/GitHub/dart_playground'
alias cfpp='code ~/Documents/GitHub/flutter_playground'
alias df='code ~/Documents/GitHub/dotfiles'
alias gp='code ~/Documents/GitHub/android-playground/gradle.properties'

#
# https://www.npmjs.com
#

alias npmig='npm install --global'
alias npmin='npm init --yes'
alias npmls='npm ls --depth 0'
alias npmlsg='npm ls --depth 0 --global'
alias npmug='npm uninstall --global'

#
# https://pip.pypa.io
#

alias pipi='pip3 install'
alias pipl='pip3 list'
alias pipu='pip3 uninstall -y'

#
# https://cli.github.com
#

alias pr='gh pr create --assignee @me --web'
alias pra="gh pr review --approve --body 'LGTM! ご対応ありがとうございました👍' && gh pr view --web"
alias prl='gh pr list --web'
alias prv='gh pr view --web'

#
# Misc aliases
#

alias fb=firebase
alias g=git
alias gc=gcloud
alias jdks='/usr/libexec/java_home -V'
alias ka=killall
alias lns='ln -s $(pwd) ~'
alias mvpng='mv ~/Documents/*.png ~/Desktop'
alias mybc='bc -lq' # -l is to show decimals. It shows 0.333 instead of 0 as the result of 1/3. -q is to suppress a welcome message.
alias mygrep='grep --ignore-case --line-number --recursive -I' # -I is to ignore binary files.
alias mygrepf='grep --ignore-case --line-number --recursive -I --exclude-dir build' # mygrep for Flutter projects.
alias pfg='pkill -f gradle'
alias show_path='echo ${PATH} | tr : \\n'
alias sjis='iconv -c -f utf-8 -t Shift-JIS input.txt > output.txt'

#
# https://gradle.org
#

alias gw=./gradlew
alias gwp='code gradle/wrapper/gradle-wrapper.properties'
alias gws='./gradlew --stop'

# https://gradle.org/releases/
alias gwup='./gradlew wrapper --gradle-version='

# https://github.com/JLLeitschuh/ktlint-gradle
alias gwkc='./gradlew ktlintCheck'

# Show the root project's dependencies, as a tree.
root_deps() {
  local temp=$(mktemp)
  ./gradlew dependencies > $temp && code $temp
}

# Show the given module's dependencies, as a tree.
gradle_deps() {
  if [ $# -lt 1 ]
  then
    echo "Usage: $funcstack[1] <project a.k.a. module>"
    return
  fi
  local temp=$(mktemp)
  ./gradlew :$1:dependencies > $temp && code $temp
}

print_projects_requried_by_given_project() {
  if [ $# -lt 1 ]
  then
    echo "Usage: $funcstack[1] <project a.k.a. module>"
    return
  fi
  ./gradlew -q :$1:dependencies --configuration implementation | grep '+--- project' | sort
}
