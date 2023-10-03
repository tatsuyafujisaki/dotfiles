# opens this file in Visual Studio Code.
alias macp='code ~/.shell_profiles/mac.profile'

# Add the executable "java_home", which returns the value of $JAVA_HOME, to PATH.
export PATH=$PATH:/usr/libexec

# Add Ruby 3 installed via Homebrew to PATH before pre-installed Ruby 2.
[ -d /usr/local/opt/ruby/bin ] && export PATH=/usr/local/opt/ruby/bin:$PATH

#
# Homebrew
#

alias bd='brew doctor'
alias bi='brew install'
alias bin='brew info'
alias bl='brew list -1'
alias bs='brew search'
alias bu='brew uninstall --zap'

#
# Misc
#

alias oa='open -a'
alias oas='open -a simulator'
alias oax='open -a xcode'

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
  sudo npm update --global
}

#
# Xcode
#

# "simct" means simulator only.
xcrv() {
  local outputfile=screencast.mp4
  rm $outputfile
  xcrun simctl io booted recordVideo $outputfile
}
