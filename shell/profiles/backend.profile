#
# https://www.docker.com
#

alias dcu='docker compose up --detach --remove-orphans --wait'

#
# https://go.dev
#

[[ -d "$HOME/go/bin" ]] && export PATH="$PATH:$HOME/go/bin"

#
# https://golangci-lint.run
#

# https://golangci-lint.run/docs/welcome/quick-start/#linting
alias glr='golangci-lint run'

# https://golangci-lint.run/docs/welcome/quick-start/#formatting
alias glf='golangci-lint fmt'
