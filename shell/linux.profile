# opens this file in Visual Studio Code.
alias linuxp='code ~/.shell_profiles/linux.profile'

# Use "ls -dl *" rather than "ls -l" because the latter shows the unwanted "total 0" on the first line of the output.
alias myls='ls -dFhlv --color --group-directories-first'

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
