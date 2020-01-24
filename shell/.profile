unset HISTFILE # avoids creating ~/.bash_history

export EDITOR=nano # Make 'crontab -e' use nano instead of the default editor vim
export HISTCONTROL=ignoreboth
export LESS=IMRS
export LESSHISTFILE=- # Avoid creating ~/.lesshst
export NODE_REPL_HISTORY='' # Avoid creating ~/.node_repl_history

#
# Add to PATH
#

if is_mac
then
  # Add the executable "java_home", which return a value for $JAVA_HOME, to PATH.
  export PATH="/usr/libexec:$PATH"

  #
  # Homebrew
  #

  alias bs='brew search' # supports both formulae and casks

  # Doctor
  alias bd='brew doctor'
  alias bcd='brew cask doctor'

  # List
  alias bl='brew list -1'
  alias bcl='brew cask list -1'

  # Info
  alias bin='brew info'
  alias bcin='brew cask info'

  # Install
  alias bi='brew install'
  alias bci='brew cask install'

  # Uninstall
  alias bu='brew uninstall'
  alias bz='brew cask zap' # to uninstall the given cask and delete all files associated with it.

  # Reinstall
  alias br='brew reinstall'
  alias bcr='brew cask reinstall'

  # Add GNU tools, installed by Homebrew, to PATH.
  export PATH="/usr/local/opt/binutils/bin:$PATH"
  export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
  export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"

  # "brew doctor" warns as follows if coreutils and findutils are in PATH.
  # Warning: Putting non-prefixed coreutils in your path can cause gmp builds to fail.
  # Warning: Putting non-prefixed findutils in your path can cause python builds to fail.
  # export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  # export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"

  # Python
  alias pip=pip3 # to use pip3, installed by Homebrew, as pip
  alias python=python3 # to use python3, installed by Homebrew, as python

  alias b='code ~/.bash_profile && . ~/.bash_profile'
  alias bb='. ~/.bash_profile'
else
  alias b='nano ~/.bash_aliases && . ~/.bash_aliases'
  alias bb='. ~/.bash_aliases'
fi

# npm
alias npmi='npm install --save-dev'
alias npmin='npm init -y'
alias npmls='npm ls --depth 0'
alias npmlsg='npm ls --depth 0 -g'
alias npmu='npm uninstall --save-dev'

# Misc aliases
alias ..='cd ..'
alias check_if_port_is_reachable='nc -zv' # Sample usage: check_if_port_is_reachable example.com 80
alias gh='cd ~/Documents/GitHub'
alias grepin='grep -i -n' # -n is to show a line number. -i is to be case-insensitive.
alias l1='ls -1' # Show file names vertically. Note that the option is 1(one), not l(L).
alias list_installed_jdks='/usr/libexec/java_home -V'
alias lns='ln -s $(pwd) ~'
alias mybc='bc -lq' # -l is to show decimals. -q is to suppress a welcome message.
alias myobjdump='objdump -d -M intel'
alias mypgrep='pgrep -il' # -i is to be case-insensitive. -l is to show process names.
if is_mac
then
  # -G is equivalent to --color of the GNU-ls.
  # --group-directories-first is not availalble on the BSD-ls.
  # Use "ls -dl *" rather than "ls -l" because the latter shows the unwanted "total 0" on the first line of the output.
  alias myls='ls -dFGhlv'
else
  # Use "ls -dl *" rather than "ls -l" because the latter shows the unwanted "total 0" on the first line of the output.
  alias myls='ls -dFhlv --color --group-directories-first'
fi
alias mypkill='sudo pkill -i' # -i is to be case-insensitive.
alias myrsync='rsync -r --exclude=.git'
alias myxxd='xxd -g1'
alias reverse_string='rev <<<'
alias rm='rm -rf'
alias rot13='tr a-zA-Z n-za-mN-ZA-M'
alias rot47="tr '\!-~' 'P-~\!-O'"
alias show_function_definition='type -a'
alias show_path='echo ${PATH} | tr : \\n'

# For current client work
alias sg='cd ~/Documents/GitHub/Shop-and-Go_Android'

c() {
  if [ ${#} -eq 0 ]
  then
    code .
  else
    code "${1}"
  fi
}

cd() {
  if [ ${#} -eq 0 ]
  then
    command cd && l
  else
    command cd "${1}" && l
  fi
}

clean() {
  # Delete .DS_Store
  sudo find / -type f -iname .DS_Store -delete 2> /dev/null

  pushd ~ > /dev/null # Avoid showing the pushed directory stack

  # Delete unnecessary directories
  directories=(.bash_sessions .dvdcss .emulator_console_auth_toke .gradle/caches .gradle/daemon .gradle/native .gradle/wrapper .local .m2 .oracle_jre_usage .Trash)
  for directory in "${directories[@]}"
  do
    rm -fr ${directory}
  done

  # Delete unnecessary files
  files=(.CFUserTextEncoding .emulator_console_auth_token .viminfo)
  for file in "${files[@]}"
  do
    rm -f ${file}
  done

  popd > /dev/null # Avoid showing the pushed directory stack
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

curl_upload() {
  if [ ${#} -ne 2 ]
  then
    echo "Usage: ${FUNCNAME[0]} <file> <url>"
    return
  fi

  curl -T ${1} ${2}
}

# Unalias "l" that is predefined in .bashrc of Windows Subsystem for Linux (WSL)
unalias l 2> /dev/null

l() {
  clear

  # Print dotfiles and dotdirectories, then print a blank line, edirecting errors to /dev/null in case there are not such files and directories.
  myls .[^.]* 2> /dev/null && echo

  # Print non-dotfiles and non-dotdirectories, redirecting errors to /dev/null in case there are not such files and directories.
  myls * 2> /dev/null
}

delete_android_studio_metadata() {
  # -delete works only for files
  find . -type f -iname *.iml -delete

  # Names that start with a dot needs to be quoted
  find . -type d -iname '\.idea' -o -iname build -exec rm -r '{}' \;
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

delete_string_in_file() {
  if [ ${#} -ne 2 ]
  then
    echo "Usage: ${FUNCNAME[0]} <file> <string>"
    return
  fi

  sed "s/${2}//" ${1}
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

mkdircd() {
  if [ ${#} -ne 1 ]
  then
    echo "Usage: ${FUNCNAME[0]} <directory>"
    return
  fi

  mkdir ${1} && cd ${1}
}

myfind() {
  if [ ${#} -ne 1 ]
  then
    echo "Usage: ${FUNCNAME[0]} <file>"
    return
  fi

  find . -iname "*${1}*" -print 2> /dev/null
}

prefix_file_name()
{
  if [ ${#} -ne 2 ]
  then
    echo "Usage: ${FUNCNAME[0]} <prefix> <file>"
    return
  fi

  sed "s/^/${1}/" ${2}
}

rename_branch() {
  if [ ${#} -ne 2 ]
  then
    echo "Usage: ${FUNCNAME[0]} <oldBranch> <newBranch>"
    return
  fi

  git branch -m ${1} ${2}
  git push origin :${1}
  git push origin ${2}
}

replace_string_in_file() {
  if [ ${#} -ne 3 ]
  then
    echo "Usage: ${FUNCNAME[0]} <file> <old_string> <new_string>"
    return
  fi

  sed "s/${2}/${3}/g" ${1}
}

suffix_file_name() {
  if [ ${#} -ne 2 ]
  then
    echo "Usage: ${FUNCNAME[0]} <file> <suffix>"
    return
  fi

  sed "s/$/${2}/" ${1}
}

up() {
  if is_mac
  then
    brew upgrade
    brew cask upgrade --greedy

    # "brew upgrade" internally runs "brew cleanup" if "brew cleanup" has not been run in 30 days, but it is advisable to run "brew cleanup" as often as possible.
    # "brew cleanup" also delete cask caches.
    brew cleanup

    # Reinstall node because "sudo npm install -g npm" in the next step fails without reinstalling node.
    # sudo rm -rf /usr/local/lib/node_modules/npm
    # brew reinstall node

    # Upgrade npm in case node installed from Homebrew does not contain the latest npm.
    sudo npm install npm@latest -g
  else
    sudo apt update
    sudo apt full-upgrade -y
    sudo apt autoremove -y
    sudo apt clean
  fi
}

# Must be defined after both clean and up are defined.
cleanup() {
  clean
  up
}

upb() {
  local url=https://raw.githubusercontent.com/tatsuya-fujisaki/dotfiles/master/bash/.bash_profile

  pushd ~

  if is_mac
  then
    curl -O ${url}
    . .bash_profile
  else
    curl ${url} -o .bash_aliases
    . .bash_aliases
  fi

  popd
}

#
# Android Debug Bridge (adb)
#

# Add adb to PATH
[ -d ~/Library/Android/sdk/platform-tools ] && export PATH="${PATH}:~/Library/Android/sdk/platform-tools"

alias adb_plug='adb shell dumpsys battery reset'
alias adb_unplug='adb shell dumpsys battery unplug'

adb_pull() {
  if [ ${#} -ne 1 ]
  then
    echo "Usage: ${FUNCNAME[0]} <path_under_scard_on_android> ."
    return
  fi

  adb pull /sdcard/${1} .
}

adb_push() {
  if [ ${#} -ne 1 ]
  then
    echo "Usage: ${FUNCNAME[0]} <path_on_mac>"
    return
  fi

  adb push ${1} /sdcard
}

#
# Firebase
#

firebase_log() {
  # Enable DebugView
  adb shell setprop debug.firebase.analytics.app com.digi.shopandgo.dev

  # Enable verbose logging
  adb shell setprop log.tag.FA VERBOSE
  adb shell setprop log.tag.FA-SVC VERBOSE
  adb logcat -v time -s FA FA-SVC
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

#
# Jenkins
#

alias jenkins_start='docker run --rm -u root -p 8080:8080 -v jenkins-data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -v "$HOME":/home jenkinsci/blueocean'