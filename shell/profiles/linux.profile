# Use "ls -dl *" rather than "ls -l" because the latter shows the unwanted "total 0" on the first line of the output.
alias myls='ls -dFhlv --color --group-directories-first'

alias p='nano ~/.shell_profiles/common.profile'

up() {
  sudo apt update
  sudo apt full-upgrade -y
  sudo apt autoremove -y
  sudo apt clean
}
