unset HISTFILE # avoids creating $HISTFILE (i.e. ~/.bash_history on Bash and ~/.zsh_history on Zsh)

export EDITOR=nano # makes 'crontab -e' use nano instead of vim
export HISTCONTROL=ignoreboth
export LESS=IMRS
export LESSHISTFILE=- # avoids creating ~/.lesshst
export NODE_REPL_HISTORY='' # avoids creating ~/.node_repl_history

#
# npm
#

alias npmig='npm install --global'
alias npmin='npm init --yes'
alias npmls='npm ls --depth 0'
alias npmlsg='npm ls --depth 0 --global'
alias npmug='npm uninstall --global'

#
# Python and pip
#

alias pip=pip3
alias pipi='pip install'
alias pipl='pip list'
alias pipu='pip uninstall -y'
alias python=python3

#
# cd-related
#

alias ..='cd ..'
alias ap='cd ~/Documents/GitHub/android-playground'
alias d='cd ~/Desktop'
alias ghh='cd ~/Documents/GitHub'
alias kp='cd ~/Documents/GitHub/kotlin-playground'

#
# Visual Studio Code-related
#

alias adbp='code ~/.shell_profiles/adb.profile'
alias blk='code ~/Documents/bulk-retweeter-unretweeter'
alias hrk='code ~/Documents/Heroku'
alias jp='code ~/Documents/GitHub/javascript-playground'
alias macp='code ~/.shell_profiles/mac.profile'
alias p='code ~/.shell_profiles/common.profile'
alias pp='code ~/.shell_profiles/private.profile'
alias tp='code ~/Documents/GitHub/typescript-playground'

#
# Misc aliases
#

alias co='curl -O'
alias g=git
alias jdks='/usr/libexec/java_home -V'
alias l1='ls -1' # shows file names vertically. Note that the option is 1(one), not l(L).
alias lns='ln -s $(pwd) ~'
alias m2g='(cd ~/Desktop && ffmpeg -y -i screencast.mp4 screencast.gif)' # () is to use a subshell.
alias mybc='bc -lq' # -l is to show decimals. It shows 0.333 instead of 0 as the result of 1/3. -q is to suppress a welcome message.
alias mygrep='grep -i -n' # -n is to show a line number. -i is to be case-insensitive.
alias mypgrep='pgrep -il' # -i is to be case-insensitive. -l is to show process names.
# Usage: portscan example.com 1-65535.
# Without -v, neither success or failure is printed.
# -z is port scanning.
# "-w 1" is to timeout after a second.
alias n=node
alias port_scan='nc -vzw 1'
alias reverse_string='rev <<<'
alias rm='rm -rf'
alias rot13='tr a-zA-Z n-za-mN-ZA-M'
alias rot47="tr '\!-~' 'P-~\!-O'"
alias show_function_definition='declare -f'
alias show_logical_cores='sysctl -n hw.ncpu'
alias show_path='echo ${PATH} | tr : \\n'
alias wd='open ~/Library/Application\ Support/Google/Chrome/Default' # opens a profile folder that contains Web Data.

clean_chrome() {
  pushd ~ > /dev/null # avoids showing the pushed directory stack

  cd ~/Library/Application\ Support/Google/Chrome/Default

  rm -fr sessions
  rm -f *.bak
  rm -f *.old
  rm -f *-journal

  popd > /dev/null # avoids showing the pushed directory stack
}

clean() {
  # Delete .DS_Store
  sudo find / -type f -iname .DS_Store -delete 2> /dev/null

  # Delete .localized
  sudo find / -type f -iname .localized -delete 2> /dev/null

  # Delete directories for Android development.
  rm -fr ~/.android/breakpad
  rm -fr ~/.android/build-cache
  rm -fr ~/.android/cache
  rm -fr ~/Library/Android/sdk/.downloadIntermediates
  rm -fr ~/Library/Android/sdk/.temp

  # Delete files for Android development.
  rm -f ~/.android/*.lock
  rm -f ~/.android/modem-nv-ram-*
  rm -f ~/Library/Android/sdk/.knownPackages

  pushd ~ > /dev/null # avoids showing the pushed directory stack

  # Delete unnecessary directories that require root privileges.
  sudo rm -fr Downloads Movies Music Pictures

  # Delete unnecessary directories
  cd ~/Library/Application\ Support/Google/RLZ

  directories=(.bash_sessions .dvdcss .gradle .lemminx .local .m2 .oracle_jre_usage .Trash)
  for directory in "$directories[@]"
  do
    rm -fr $directory
  done

  mkdir .gradle
  curl -o ~/.gradle/gradle.properties https://raw.githubusercontent.com/tatsuyafujisaki/android-playground/master/gradle.properties

  # Delete unnecessary files
  files=(.bash_history .CFUserTextEncoding .viminfo .zcompdump .zsh_history)
  for file in "$files[@]"
  do
    rm -f $file
  done

  popd > /dev/null # avoids showing the pushed directory stack
}

clean_android_or_intellij_project() {
  # Delete unnecessary directories
  directories=(.gradle .idea build)
  for directory in "$directories[@]"
  do
    find . -type d -name "$directory" -exec rm -rf {} +
  done

  # Delete unnecessary files
  files=(*.iml)
  for file in "$files[@]"
  do
    find . -type f -name "$file" -delete
  done
}

dm() {
  local dir=~/Desktop/deleteme
  mkdir -p $dir
  cd $dir

  if [ $# -ge 1 ]
  then
    touch deleteme.$1
  fi

  code .
}

exclude_column() {
  if [ $# -lt 2 ]
  then
    echo "Usage: $funcstack[1] <one-based column index> <file>"
    return
  fi

  cut -f $1 --complement $2
}

mkdircd() {
  if [ $# -lt 1 ]
  then
    echo "Usage: $funcstack[1] <directory>"
    return
  fi

  mkdir -p $1 && cd $1
}

mydelete() {
  if [ $# -lt 1 ]
  then
    echo "Usage: $funcstack[1] <file-or-directory>"
    return
  fi

  find . -iname "*$1*" -print -exec rm -rf {} + 2> /dev/null
}

myfind() {
  if [ $# -lt 1 ]
  then
    echo "Usage: $funcstack[1] <file-or-directory>"
    return
  fi

  find . -iname "*$1*" -print 2> /dev/null
}

mysed() {
  if [ ${#} -lt 3 ]
  then
    echo "Usage: $funcstack[1] <string-before> <string-after> <file>"
    return
  fi

  # -i is to edit a file in-place instead of printing to standard output.
  # g is to enable more than one replacement in each line.
  sed -i 's/${1}/${2}/g' $3
}

myuniq() {
  if [ $# -lt 1 ]
  then
    echo "Usage: $funcstack[1] <file>"
    return
  fi

  # -f is to sort case-insensitively.
  # uniq works only if the input is sorted.
  sort -f < $1 | uniq
}

rename_branch() {
  if [ $# -lt 2 ]
  then
    echo "Usage: $funcstack[1] <old-branch> <new-branch>"
    return
  fi

  git switch $1
  git branch -m $2 # renames the current branch to the new branch on local.
  git push origin :$1 # deletes the old branch on remote.
  git push -u origin $2 # creates the new branch on remote and resets the upstream branch to it.
}

sample_function_that_requires_one_argument() {
  if [ $# -lt 1 ]
  then
    echo "Usage: $funcstack[1] <first-argument>"
    return
  fi

  echo "First parameter: $1"
}

sample_function_that_requires_two_arguments() {
  if [ $# -lt 2 ]
  then
    echo "Usage: $funcstack[1] <first-argument> <second-argument>"
    return
  fi

  echo "First parameter: $1"
  echo "Second parameter: $2"
}

# Must be defined after both clean and up are defined.
cleanup() {
  clean
  up
}

#
# Helper functions to create a temporary file
#

alias json='code ~/Desktop/deleteme/deleteme.json'
alias md='code ~/Desktop/deleteme/deleteme.md'
alias py='code ~/Desktop/deleteme/deleteme.py'
alias swif='code ~/Desktop/deleteme/deleteme.swift'
alias txt='code ~/Desktop/deleteme/deleteme.txt'
alias xml='code ~/desktop/deleteme/deleteme.xml'

#
# Gradle
#

alias gp='code ~/.gradle/gradle.properties'
alias gw='gradle wrapper --distribution-type all --gradle-version' # Usage: gw <version-number>
alias gwp='code gradle/wrapper/gradle-wrapper.properties'

# Show the root project's dependencies, as a tree.
root_deps() {
  local temp=$(mktemp)
  ./gradlew dependencies > $temp && code $temp
}

# Show the app module's dependencies, as a tree.
app_deps() {
  local temp=$(mktemp)
  ./gradlew app:dependencies > $temp && code $temp
}

projects_requried_by_app() {
  ./gradlew -q app:dependencies --configuration implementation | grep '+--- project' | sort
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
