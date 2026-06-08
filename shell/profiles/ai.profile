#
# https://claude.ai
#

alias cl='claude --dangerously-skip-permissions'
alias cpl='claude plugin list'
alias cpml='claude plugin marketplace list'
alias cpmu='claude plugin marketplace update'

# "cp" stands for claude plugin.
cp_reinstall() {
  local plugin="${1:-polo@polo}"
  claude plugin marketplace update && claude plugin uninstall "$plugin"; claude plugin install "$plugin"
}

# "cp" stands for claude plugin.
cp_update() {
  local plugin="${1:-polo@polo}"
  claude plugin marketplace update && claude plugin update "$plugin"
}
