#
# https://www.docker.com
#

alias dcu='docker compose up --detach --remove-orphans --wait'

#
# https://go.dev
#

export PATH="$(go env GOROOT)/bin:$PATH"

#
# https://golangci-lint.run
#

export PATH="$(go env GOPATH)/bin:$PATH"

# https://golangci-lint.run/docs/welcome/quick-start/#linting
alias goci='golangci-lint run --fix'

# https://golangci-lint.run/docs/welcome/install/#binaries
alias install_golangci_lint='curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/HEAD/install.sh | sh -s -- -b $(go env GOPATH)/bin'

#
# Note
#

# You don't have to install `goimports` separately if you are using the modern Go language server, `gopls` because `gopls` integrates `goimports`.

# There is no official way to upgrade the Go programming language in Terminal.
# https://go.dev/doc/install
