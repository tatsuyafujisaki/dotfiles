# Use "ls -dl *" rather than "ls -l" because the latter shows the unwanted "total 0" on the first line of the output.
alias myls='ls -dFhlv --color --group-directories-first'

alias p='nano ~/.shell_profiles/common.profile'

up() {
  sudo apt update
  sudo apt full-upgrade -y
  sudo apt autoremove -y
  sudo apt clean
}

# Update shell resources
upp() {
  curl -o ~/.bash_profile https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/master/shell/profiles/.bash_profile
  curl -o ~/.zshrc https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/master/shell/profiles/.zshrc
  curl --create-dirs -o ~/.shell_profiles/adb.profile https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/master/shell/profiles/adb.profile
  curl --create-dirs -o ~/.shell_profiles/common.profile https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/master/shell/profiles/common.profile
  curl --create-dirs -o ~/.shell_profiles/linux.profile https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/master/shell/profiles/linux.profile
}
