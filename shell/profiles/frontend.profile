# https://github.com/Schniz/fnm
if command -v fnm >/dev/null; then
  eval "$(fnm env --use-on-cd)"
fi

#
# https://nodejs.org
#

[[ -d "/opt/homebrew/Cellar/node" ]] && export PATH="/opt/homebrew/Cellar/node/$(ls -1 /opt/homebrew/Cellar/node)/bin:$PATH" # makes the Gemini CLI command `gemini` available.

#
# https://www.npmjs.com
#

alias npmig='npm install --global'
alias npmug='npm uninstall --global'

#
# https://pnpm.io
#

[[ -d "$HOME/Library/pnpm" ]] && export PATH="$HOME/Library/pnpm:$PATH"

alias my_install_pnpm='curl -fsSL https://get.pnpm.io/install.sh | sh -'
