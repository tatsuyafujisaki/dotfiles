# opens this file in Visual Studio Code.
alias p='code ~/Documents/GitHub/dotfiles/shell/common.profile'

unset HISTFILE # avoids creating $HISTFILE (i.e. ~/.bash_history on Bash and ~/.zsh_history on Zsh)

export EDITOR=nano # makes 'crontab -e' use nano instead of vim
export HISTCONTROL=ignoreboth
export LESS=IMRS
export LESSHISTFILE=- # avoids creating ~/.lesshst
export NODE_REPL_HISTORY='' # avoids creating ~/.node_repl_history

#
# pbcopy-related
#

alias @='echo gngfhln.shwvfnxv@tznvy.pbz | rot13 | pbcopy'
alias @@='echo gngfhln.shwvfnxv.yoc@tznvy.pbz | rot13 | pbcopy'
alias tdf='echo tatsuya.fujisaki | pbcopy'
alias tf='echo tatsuyafujisaki | pbcopy'

#
# cd-related
#

alias ap='cd ~/Documents/GitHub/android-playground'
alias d='cd ~/Desktop'
alias dp='cd ~/Documents/GitHub/dart_playground'
alias fpp='cd ~/Documents/GitHub/flutter_playground'
alias ghh='cd ~/Documents/GitHub'
alias kp='cd ~/Documents/GitHub/kotlin-playground'

#
# Visual Studio Code-related
#

alias c='code .'
alias cdp='code ~/Documents/GitHub/dart_playground'
alias cfpp='code ~/Documents/GitHub/flutter_playground'

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
alias prm='gh pr create --assignee @me --base develop/memo-checklist --web'
alias pra="gh pr review --approve --body 'LGTMです！ご対応ありがとうございました:+1:' && gh pr view --web"
alias prl='gh pr list --web'
alias prme='gh pr edit --add-assignee @me'
alias prr='gh pr edit --add-reviewer tatsuyafujisaki && gh pr view --web'
alias prst='gh pr status'
alias prt='gh pr view | head -1 | sed "s/title://g" | awk "{\$1=\$1};1" | pbcopy'
alias prv='gh pr view --web'

#
# https://ffmpeg.org
#

# -ar stands for audio sample rate in hertz.
# -q:a stands for quality:audio, and means a variable bit rate.
# https://trac.ffmpeg.org/wiki/Encode/AAC
alias myffmpeg='ffmpeg -i input.m4a -ar 44100 -q:a 1 output.m4a'

#
# https://github.com/exiftool/exiftool
#

alias exift='exiftool -all= input.mp4'

#
# Misc aliases
#

alias g=git
alias jdks='/usr/libexec/java_home -V'
alias ka=killall
alias l1='ls -1' # shows file names vertically. Note that the option is 1(one), not l(L).
alias lns='ln -s $(pwd) ~'
alias mybc='bc -lq' # -l is to show decimals. It shows 0.333 instead of 0 as the result of 1/3. -q is to suppress a welcome message.
alias mygrep='grep --ignore-case --line-number --recursive -I' # -I is to ignore binary files.
alias mypgrep='pgrep -il' # -i is to be case-insensitive. -l is to show process names.
# Usage: portscan example.com 1-65535.
# Without -v, neither success or failure is printed.
# -z is port scanning.
# "-w 1" is to timeout after a second.
alias port_scan='nc -vzw 1'
alias reverse_string='rev <<<'
alias rot13="tr 'A-Za-z' 'N-ZA-Mn-za-m'"
alias show_function_definition='declare -f'
alias show_logical_cores='sysctl -n hw.ncpu'
alias show_path='echo ${PATH} | tr : \\n'
alias wd='open ~/Library/Application\ Support/Google/Chrome/Default' # opens a profile folder that contains Web Data.

#
# https://gradle.org
#

alias gp='code ~/Documents/GitHub/android-playground/gradle.properties'
alias gw=./gradlew
alias gwp='code gradle/wrapper/gradle-wrapper.properties'

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
