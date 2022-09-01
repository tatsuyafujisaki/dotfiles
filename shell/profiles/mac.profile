export PATH="/usr/libexec:$PATH" # adds the executable "java_home", which returns the value of $JAVA_HOME.

#
# Homebrew
#

alias bd='brew doctor'
alias bi='brew install'
alias bin='brew info'
alias bl='brew list -1'
alias bs='brew search'
alias bu='brew uninstall --zap'

# Add GNU tools, installed by Homebrew, to PATH.
[ -d /usr/local/opt/binutils/bin ] && export PATH="/usr/local/opt/binutils/bin:${PATH}"
[ -d /usr/local/opt/gnu-sed/libexec/gnubin ] && export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:${PATH}"
[ -d /usr/local/opt/grep/libexec/gnubin ] && export PATH="/usr/local/opt/grep/libexec/gnubin:${PATH}"

# -G is equivalent to --color of the GNU-ls.
# --group-directories-first is not availalble on the BSD-ls.
# Use "ls -dl *" rather than "ls -l" because the latter shows the unwanted "total 0" on the first line of the output.
alias myls='ls -dFGhlv'

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

  # Upgrade globally installed packages.
  npm update --global
}

# Update shell resources
upp() {  
  # Remember to manually download private.profile from a private gist.

  curl -o ~/.bash_profile https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/main/shell/profiles/.bash_profile
  curl -o ~/.zshrc https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/main/shell/profiles/.zshrc
  curl --create-dirs -o ~/.shell_profiles/adb.profile https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/main/shell/profiles/adb.profile
  curl --create-dirs -o ~/.shell_profiles/common.profile https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/main/shell/profiles/common.profile
  curl --create-dirs -o ~/.shell_profiles/mac.profile https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/main/shell/profiles/mac.profile
  
  exec -l $SHELL
}
