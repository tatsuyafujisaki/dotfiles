export PATH="/usr/libexec:$PATH" # adds the executable "java_home", which returns the value of $JAVA_HOME.

alias java8='/usr/libexec/java_home -v 1.8' # shows the path to JDK 8.
alias java9='/usr/libexec/java_home -v 9' # shows the path to JDK 9.
alias java13='/usr/libexec/java_home -v 13' # shows the path to JDK 13.

#
# Homebrew
#

alias bs='brew search' # supports both formulae and casks

# Doctor
alias bd='brew doctor'
alias bcd='brew cask doctor'

# List
alias bl='brew list -1'
alias blc='brew list --cask -1'

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
[ -d /usr/local/opt/binutils/bin ] && export PATH="/usr/local/opt/binutils/bin:${PATH}"
[ -d /usr/local/opt/gnu-sed/libexec/gnubin ] && export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:${PATH}"
[ -d /usr/local/opt/grep/libexec/gnubin ] && export PATH="/usr/local/opt/grep/libexec/gnubin:${PATH}"

# -G is equivalent to --color of the GNU-ls.
# --group-directories-first is not availalble on the BSD-ls.
# Use "ls -dl *" rather than "ls -l" because the latter shows the unwanted "total 0" on the first line of the output.
alias myls='ls -dFGhlv'

alias p='code ~/.shell_profiles/common.profile'

l() {
  clear

  # Print dotfiles and dotdirectories, then print a blank line, redirecting errors to /dev/null when there are not such files and directories.
  myls .[^.]* 2> /dev/null && echo

  # Print non-dotfiles and non-dotdirectories, redirecting errors to /dev/null when there are not such files and directories.
  myls * 2> /dev/null
}

up() {
  # Update both formulae and casks.
  # --greedy applies only to casks.
  # Casks that have auto_updates=true such as google-chrome are not upgraded by default, but this flag updates even those casks.
  brew upgrade --greedy

  # "brew upgrade" internally runs "brew cleanup" if "brew cleanup" has not been run in 30 days, but it is advisable to run "brew cleanup" as often as possible.
  # "brew cleanup" also delete cask caches.
  brew cleanup
  
  # Upgrade Node.js.
  sudo n latest

  # Remove all the downloaded versions of Node.js except the installed version.
  sudo n cache
  
  # Upgrade npm.
  npm install npm@latest -g
  
  # Upgrade globally installed packages.
  npm update -g
}

# Update shell resources
upp() {  
  # Remember to manually download private.profile from a private gist.

  curl -o ~/.bash_profile https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/master/shell/profiles/.bash_profile
  curl -o ~/.zshrc https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/master/shell/profiles/.zshrc
  curl --create-dirs -o ~/.shell_profiles/adb.profile https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/master/shell/profiles/adb.profile
  curl --create-dirs -o ~/.shell_profiles/common.profile https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/master/shell/profiles/common.profile
  curl --create-dirs -o ~/.shell_profiles/mac.profile https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/master/shell/profiles/mac.profile
}
