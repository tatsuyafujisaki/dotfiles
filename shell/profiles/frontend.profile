# https://github.com/Schniz/fnm
if command -v fnm >/dev/null; then
  eval "$(fnm env --use-on-cd)"
fi

#
# https://www.npmjs.com
#

alias npmig='npm install --global'
alias npmlg='npm list --global'
alias npmug='npm uninstall --global'
alias npmupg='npm update --global'
