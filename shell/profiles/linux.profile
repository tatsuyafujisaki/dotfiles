# Use "ls -dl *" rather than "ls -l" because the latter shows the unwanted "total 0" on the first line of the output.
alias myls='ls -dFhlv --color --group-directories-first'

alias p='nano ~/.shell_profiles/common.profile'

# Unalias "l" that is predefined in .bashrc of Windows Subsystem for Linux (WSL)
unalias l 2> /dev/null

l() {
  clear

  # Print dotfiles and dotdirectories, then print a blank line, redirecting errors to /dev/null when there are not such files and directories.
  myls .[^.]* 2> /dev/null && echo

  # Print non-dotfiles and non-dotdirectories, redirecting errors to /dev/null when there are not such files and directories.
  myls * 2> /dev/null
}

up() {
  sudo apt update
  sudo apt full-upgrade -y
  sudo apt autoremove -y
  sudo apt clean
}

# Update shell resources
upp() {
  # Remember to manually download private.profile from a private gist.

  curl -o ~/.bash_profile https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/main/shell/profiles/.bash_profile
  curl -o ~/.zshrc https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/main/shell/profiles/.zshrc
  curl --create-dirs -o ~/.shell_profiles/adb.profile https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/main/shell/profiles/adb.profile
  curl --create-dirs -o ~/.shell_profiles/common.profile https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/main/shell/profiles/common.profile
  curl --create-dirs -o ~/.shell_profiles/common.profile https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/main/shell/profiles/common-functions.profile
  curl --create-dirs -o ~/.shell_profiles/linux.profile https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/main/shell/profiles/linux.profile
}
