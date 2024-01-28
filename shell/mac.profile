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
# Python
#

alias pip='pip3'
alias python='python3'

l() {
  clear

  # -G is equivalent to --color of the GNU-ls.
  # Use "ls -dl *" rather than "ls -l" because the latter shows the unwanted "total 0" on the first line of the output.
  # Print dotfiles and dotdirectories, then print a blank line, redirecting errors to /dev/null when there are not such files and directories.
  ls -dFGhlv .[^.]* 2> /dev/null && echo

  # Print non-dotfiles and non-dotdirectories, redirecting errors to /dev/null when there are not such files and directories.
  ls -dFGhlv * 2> /dev/null
}

up() {
  # Update both formulae and casks.
  # --greedy applies only to casks.
  # Casks that have auto_updates=true such as google-chrome are not upgraded by default, but this flag updates even those casks.
  brew upgrade --greedy
  sudo npm update --global
  gcloud components update --quiet
  flutter upgrade
}

#
# Xcode
#

# "simctl" stands for simulator control, which means it does not apply to physical iOS devices.
xcrv() {
  local outputfile=screencast.mp4
  rm $outputfile
  xcrun simctl io booted recordVideo $outputfile
}

alias oas='open -a simulator'
alias oios='open ios/Runner.xcworkspace'

#
# CocoaPods
#

alias pcca='pod cache clean --all'
