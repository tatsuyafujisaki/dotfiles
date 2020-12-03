unset HISTFILE # avoids creating $HISTFILE (i.e. ~/.bash_history on Bash and ~/.zsh_history on Zsh)

export EDITOR=nano # makes 'crontab -e' use nano instead of vim
export HISTCONTROL=ignoreboth
export LESS=IMRS
export LESSHISTFILE=- # avoids creating ~/.lesshst
export NODE_REPL_HISTORY='' # avoids creating ~/.node_repl_history

#
# npm
# 

alias npmi='npm install --save-dev'
alias npmin='npm init -y'
alias npmls='npm ls --depth 0'
alias npmlsg='npm ls --depth 0 -g'
alias npmu='npm uninstall --save-dev'

#
# cd-related
#

alias ..='cd ..'
alias ap='cd ~/Documents/GitHub/android-playground'
alias d='cd ~/Desktop'
alias ghh='cd ~/Documents/GitHub'
alias kp='cd ~/Documents/GitHub/kotlin-playground'

mkdircd() {
  if [ ${#} -ne 1 ]
  then
    echo "Usage: ${FUNCNAME[0]} <directory>"
    return
  fi

  mkdir -p ${1} && cd ${1}
}

#
# Visual Studio Code-related
#

alias adbp='code ~/.shell_profiles/adb.profile'
alias macp='code ~/.shell_profiles/mac.profile'
alias p='code ~/.shell_profiles/common.profile'
alias pp='code ~/.shell_profiles/private.profile'

#
# Misc aliases
#

alias cur='curl -O'
alias g=git
alias jdks='/usr/libexec/java_home -V'
alias l1='ls -1' # shows file names vertically. Note that the option is 1(one), not l(L).
alias lns='ln -s $(pwd) ~'
alias mp4_to_gif='ffmpeg -i screencast.mp4 -vf scale=320:-1 screencast.gif' # 320 is width.
alias mybc='bc -lq' # -l is to show decimals. It shows 0.333 instead of 0 as the result of 1/3. -q is to suppress a welcome message.
alias mygrep='grep -i -n' # -n is to show a line number. -i is to be case-insensitive.
alias myobjdump='objdump -d -M intel'
alias mypgrep='pgrep -il' # -i is to be case-insensitive. -l is to show process names.
alias mypkill='sudo pkill -i' # -i is to be case-insensitive.
alias myrsync='rsync -r --exclude=.git'
alias myxxd='xxd -g1'
# Usage: portscan example.com 1-65535.
# Without -v, neither success or failure is printed.
# -z is port scanning.
# "-w 1" is to timeout after a second.
alias port_scan='nc -vzw 1'
alias reverse_string='rev <<<'
alias rm='rm -rf'
alias rot13='tr a-zA-Z n-za-mN-ZA-M'
alias rot47="tr '\!-~' 'P-~\!-O'"
alias show_function_definition='declare -f'
alias show_logical_cores='sysctl -n hw.ncpu'
alias show_path='echo ${PATH} | tr : \\n'
alias wd='open ~/Library/Application\ Support/Google/Chrome/Default' # opens a profile folder that contains Web Data.

c() {
  if [ ${#} -ge 1 ]
  then
    cd "${1}" && l
  else
    cd && l
  fi
}

clean() {
  # Delete .DS_Store
  sudo find / -type f -iname .DS_Store -delete 2> /dev/null

  # Delete .localized
  sudo find / -type f -iname .localized -delete 2> /dev/null

  # Delete directories for Android development.
  rm -fr ~/.android/build-caches
  rm -fr ~/.android/caches
  rm -fr ~/Library/Android/sdk/.downloadIntermediates
  rm -fr ~/Library/Android/sdk/.temp

  # Delete files for Android development.
  rm -f ~/.android/*.lock
  rm -f ~/Library/Android/sdk/.knownPackages

  pushd ~ > /dev/null # avoids showing the pushed directory stack

  # Delete unnecessary directories that require root privileges.
  sudo rm -fr Downloads Movies Music Pictures

  # Delete unnecessary directories
  directories=(.bash_sessions .dvdcss .gradle .lemminx .local .m2 .oracle_jre_usage .Trash)
  for directory in "${directories[@]}"
  do
    rm -fr ${directory}
  done

  mkdir .gradle
  curl -o ~/.gradle/gradle.properties https://raw.githubusercontent.com/tatsuyafujisaki/android-playground/master/gradle.properties
  
  # Delete unnecessary files
  files=(.bash_history .CFUserTextEncoding .viminfo .zcompdump .zsh_history)
  for file in "${files[@]}"
  do
    rm -f ${file}
  done

  popd > /dev/null # avoids showing the pushed directory stack
}

clean_android_or_intellij_project() {
  # Delete unnecessary directories
  directories=(.gradle .idea build)
  for directory in "${directories[@]}"
  do
    find . -type d -name "${directory}" -exec rm -rf {} +
  done

  # Delete unnecessary files
  files=(*.iml)
  for file in "${files[@]}"
  do
    find . -type f -name "${file}" -delete
  done
}

# cURL to a specific directory
curlo() {
  if [ ${#} -ne 2 ]
  then
    echo "Usage: ${FUNCNAME[0]} <directory> <url>"
    return
  fi

  mkdir -p ${1}

  # Use a subshell to restore the current directory in the end.
  (cd ${1} && curl -O ${2})
}

decode_base64() {
  if [ ${#} -ne 2 ]
  then
    echo "Usage: ${FUNCNAME[0]} <file>"
    return
  fi

  echo ${1} | base64 -d
}

decode_url() {
  if [ ${#} -ne 1 ]
  then
    echo "Usage: ${FUNCNAME[0]} <file>"
    return
  fi

  echo ${1} | nkf --url-input
}

exclude_column() {
  if [ ${#} -ne 2 ]
  then
    echo "Usage: ${FUNCNAME[0]} <one-based column index> <file>"
    return
  fi

  cut -f ${1} --complement ${2}
}

find_file() {
  if [ ${#} -ne 1 ]
  then
    echo "Usage: ${FUNCNAME[0]} <file>"
    return
  fi

  find . -type f -iname "*${1}*" -print 2> /dev/null
}

find_directory() {
  if [ ${#} -ne 1 ]
  then
    echo "Usage: ${FUNCNAME[0]} <directory>"
    return
  fi

  find  -type d -iname "*${1}*" -print 2> /dev/null
}

myfind() {
  if [ ${#} -ne 1 ]
  then
    echo "Usage: ${FUNCNAME[0]} <file>"
    return
  fi

  find . -iname "*${1}*" -print 2> /dev/null
}

mygradlew() {
  if [ ${#} -ne 1 ]
  then
    echo "Usage: ${FUNCNAME[0]} <task>"
    return
  fi
  
  ./gradlew ${1} --build-cache --parallel --quiet --warning-mode=none -Dorg.gradle.jvmargs=-Xmx2g
}

mysed() {
  if [ ${#} -ne 3 ]
  then
    echo "Usage: ${FUNCNAME[0]} <string-before> <string-after> <file>"
    return
  fi

  # -i is to edit a file in-place instead of printing to standard output.
  # g is to enable more than one replacement in each line.
  sed -i 's/${1}/${2}/g' ${3}
}

myuniq() {
  if [ ${#} -ne 1 ]
  then
    echo "Usage: ${FUNCNAME[0]} <file>"
    return
  fi

  # -f is to sort case-insensitively.
  # uniq works only if the input is sorted.
  cat ${1} | sort -f | uniq
}

rename_branch() {
  if [ ${#} -ne 2 ]
  then
    echo "Usage: ${FUNCNAME[0]} <old-branch> <new-branch>"
    return
  fi

  git switch ${1}
  git branch -m ${2} # renames the current branch to the new branch on local.
  git push origin :${1} # deletes the old branch on remote.
  git push -u origin ${2} # creates the new branch on remote and resets the upstream branch to it.
}

# Must be defined after both clean and up are defined.
cleanup() {
  clean
  up
}

#
# Helper functions to create a temporary file
#

alias json='code ~/Desktop/deleteme.json'
alias md='code ~/Desktop/deleteme.md'
alias swif='code ~/Desktop/deleteme.swift'
alias txt='code ~/Desktop/deleteme.txt'
alias xml='code ~/desktop/deleteme.xml'

#
# Gradle
#

alias gp='code ~/.gradle/gradle.properties'
alias gw='./gradlew'
alias gwp='(cd gradle/wrapper && curl -O https://raw.githubusercontent.com/tatsuyafujisaki/android-playground/master/gradle/wrapper/gradle-wrapper.properties)'
alias ktlint='./gradlew ktlintCheck'

# Show dependencies, as a tree.
deps() {
  local tempflie=$(mktemp)
  gradle dependencies > $tempflie && code $tempflie
}

# Show dependencies, as a tree, declared in the project "app".
android_deps() {
  local tempflie=$(mktemp)
  ./gradlew app:dependencies > $tempflie && code $tempflie
}

show_modules() {
  if [ ${#} -ne 1 ]
  then
    echo "Usage: ${FUNCNAME[0]} <module>"
    return
  fi

  # -q is to suppress non-error logs.
  # --configuration is to filter only "implementation".
  # https://docs.gradle.org/current/userguide/viewing_debugging_dependencies.html
  ./gradlew -q ${1}:dependencies --configuration implementation | grep '+--- project' | sort
}

#
# Xcode
#

xcvideo() {
  local outputfile=screencast.mp4
  rm outputfile 
  xcrun simctl io booted recordVideo $outputfile
}

#
# Google Cloud SDK
#

[ -f ~/google-cloud-sdk/path.zsh.inc ] && source ~/google-cloud-sdk/path.zsh.inc # adds Google Cloud SDK to PATH.
[ -f ~/google-cloud-sdk/completion.zsh.inc ] && source ~/google-cloud-sdk/completion.zsh.inc # enables shell command completion for gcloud.

#
# Flutter
#

# Add Flutter to PATH.
# Note that Zsh does not expand the tilde(~) if it is in double quotes.
# http://zsh.sourceforge.net/Guide/zshguide05.html
[ -d ~/Documents/GitHub/flutter/bin ] && export PATH=${PATH}:~/Documents/GitHub/flutter/bin

alias f=flutter
alias fpg='flutter pub get'

#
# Docker
#

# Show all running containers.
alias dpsq='docker ps -q'

# Show all running and non-running containers.
alias dpsqa='docker ps -aq'

docker_clean() {
  # Stop all running containers.
  docker stop $(docker ps -q) 2> /dev/null

  # Remove all containers.
  docker rm $(docker ps -aq) 2> /dev/null

  # Remove all local images.
  docker rmi $(docker images -aq) 2> /dev/null
}

#
# Jenkins
#

alias jenkins_start='docker run --rm -u root -p 8080:8080 -v jenkins-data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -v "$HOME":/home jenkinsci/blueocean'
