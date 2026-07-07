# https://github.com/Schniz/fnm
if command -v fnm >/dev/null; then
  eval "$(fnm env --use-on-cd)"
fi

#
# https://www.typescriptlang.org/download/#:~:text=npx%20tsc
#

alias tsc='npx tsc --noEmit'

#
# https://github.com/google/gts
#

alias gtsf='npx gts fix'
alias gtsl='npx gts check'

#
# https://www.npmjs.com
#

alias npmig='npm install --global'
alias npmlg='npm list --global'
alias npmug='npm uninstall --global'
alias npmupg='npm update --global'
