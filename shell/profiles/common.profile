unset HISTFILE # avoids creating $HISTFILE (i.e. ~/.bash_history on Bash and ~/.zsh_history on Zsh)

export EDITOR=nano # makes 'crontab -e' use nano instead of vim
export HISTCONTROL=ignoreboth
export LESS=IMRS
export LESSHISTFILE=- # avoids creating ~/.lesshst
export NODE_REPL_HISTORY='' # avoids creating ~/.node_repl_history

#
# Add to PATH
#

if is_mac
then
  export PATH="/usr/libexec:$PATH" # adds the executable "java_home", which returns the value of $JAVA_HOME.
  export JAVA_HOME=$(/usr/libexec/java_home -v 1.8) # is ensure that Gradle uses JDK 8 when multiple JDK versions are installed.
  alias java8='/usr/libexec/java_home -v 1.8' # shows the path to JDK 8.
  alias java9='/usr/libexec/java_home -v 9' # shows the path to JDK 9.

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

  # -G is equivalent to --color of the GNU-ls.
  # --group-directories-first is not availalble on the BSD-ls.
  # Use "ls -dl *" rather than "ls -l" because the latter shows the unwanted "total 0" on the first line of the output.
  alias myls='ls -dFGhlv'

  # Python
  alias pip=pip3 # to use pip3, installed by Homebrew, as pip
  alias python=python3 # to use python3, installed by Homebrew, as python

  alias p='code ~/.shell_profiles/common.profile'
else
  # Use "ls -dl *" rather than "ls -l" because the latter shows the unwanted "total 0" on the first line of the output.
  alias myls='ls -dFhlv --color --group-directories-first'

  alias p='nano ~/.shell_profiles/common.profile'
fi

# npm
alias npmi='npm install --save-dev'
alias npmin='npm init -y'
alias npmls='npm ls --depth 0'
alias npmlsg='npm ls --depth 0 -g'
alias npmu='npm uninstall --save-dev'

#
# Other aliases
#

alias adbp='code ~/.shell_profiles/adb.profile'
alias ..='cd ..'
# Usage: check_if_port_is_reachable example.com 80
# Without -v, neither success or failure is printed.
alias check_if_port_is_reachable='nc -vz'
alias gh='cd ~/Documents/GitHub'
alias gp='code ~/.gradle/gradle.properties'
alias gwp='(cd gradle/wrapper && curl -O https://raw.githubusercontent.com/tatsuyafujisaki/android-playground/master/gradle/wrapper/gradle-wrapper.properties)'
alias js='code ~/Documents/GitHub/js-playground'
alias ktlint='./gradlew ktlintCheck'
alias l1='ls -1' # Show file names vertically. Note that the option is 1(one), not l(L).
alias list_installed_jdks='/usr/libexec/java_home -V'
alias lns='ln -s $(pwd) ~'
alias mybc='bc -lq' # -l is to show decimals. -q is to suppress a welcome message.
alias mygrep='grep -i -n' # -n is to show a line number. -i is to be case-insensitive.
alias myobjdump='objdump -d -M intel'
alias mypgrep='pgrep -il' # -i is to be case-insensitive. -l is to show process names.
alias mypkill='sudo pkill -i' # -i is to be case-insensitive.
alias myrsync='rsync -r --exclude=.git'
alias myxxd='xxd -g1'
# Usage: portscan example.com 1-65535.
# Without -v, neither success or failure is printed.
# "-z" is port scanning.
# "-w 1" is to timeout after a second.
alias port_scan='nc -vzw 1'
alias pp='code ~/.shell_profiles/private.profile'
alias reverse_string='rev <<<'
alias rm='rm -rf'
alias rot13='tr a-zA-Z n-za-mN-ZA-M'
alias rot47="tr '\!-~' 'P-~\!-O'"
alias show_function_definition='declare -f'
alias show_path='echo ${PATH} | tr : \\n'
alias wd='open ~/Library/Application\ Support/Google/Chrome/Default' # opens a profile folder that contains Web Data.

c() {
  if [ ${#} -eq 0 ]
  then
    cd && l
  else
    cd "${1}" && l
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
  directories=(.bash_sessions .dvdcss .emulator_console_auth_toke .gradle/caches .gradle/daemon .gradle/native .gradle/wrapper .local .m2 .oracle_jre_usage .Trash)
  for directory in "${directories[@]}"
  do
    rm -fr ${directory}
  done

  # Delete unnecessary files
  files=(.bash_history .CFUserTextEncoding .emulator_console_auth_token .viminfo .zsh_history)
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

mysed_add_leading_string()
{
  if [ ${#} -ne 2 ]
  then
    echo "Usage: ${FUNCNAME[0]} <leading-string> <file>"
    return
  fi

  # -i is to edit a file in-place instead of printing to standard output.
  # g is to enable more than one replacement in each line.
  sed -i "s/^/${1}/g" ${2}
}

mysed_add_trailing_string() {
  if [ ${#} -ne 2 ]
  then
    echo "Usage: ${FUNCNAME[0]} <trailing-string> <file>"
    return
  fi

  # -i is to edit a file in-place instead of printing to standard output.
  # g is to enable more than one replacement in each line.
  sed -i "s/$/${1}/g" ${2}
}

mysed_delete() {
  if [ ${#} -ne 2 ]
  then
    echo "Usage: ${FUNCNAME[0]} <string> <file>"
    return
  fi

  # -i is to edit a file in-place instead of printing to standard output.
  # g is to enable more than one replacement in each line.
  sed -i "s/${1}//g" ${2}
}

rename_branch() {
  if [ ${#} -ne 2 ]
  then
    echo "Usage: ${FUNCNAME[0]} <old-branch> <new-branch>"
    return
  fi

  git branch -m ${1} ${2} # renames the old branch to the new branch on local.
  git push origin :${1} # deletes an old branch on remote.
  git push -u origin ${2} # creates the new branch on remote and resets the upstream branch to it.
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

# Update shell resources
upp() {
  curl --create-dirs -o ~/.shell_profile/common.profile https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/master/shell/profiles/common.profile
  curl  -o ~/.zshrc https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/master/shell/profiles/.zshrc

  local url=https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/master/shell/profiles/.bash_profile

  if is_mac
  then
    curl ${url} -o ~/.bash_profile
  else
    curl ${url} -o ~/.bash_aliases
  fi

  curl --create-dirs -o ~/.shell_profiles/adb.profile https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/master/shell/profiles/adb.profile

  popd
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

#
# Read other profiles
#

[ -f ~/.shell_profiles/adb.profile ] && . ~/.shell_profiles/adb.profile
[ -f ~/.shell_profiles/private.profile ] && . ~/.shell_profiles/private.profile