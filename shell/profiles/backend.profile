#
# https://www.docker.com
#

alias dcu='docker compose up --detach --remove-orphans --wait'

#
# https://go.dev
#

export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"

#
# https://golangci-lint.run
#

# https://golangci-lint.run/docs/welcome/quick-start/#linting
alias goci='golangci-lint run --fix'

# https://golangci-lint.run/docs/welcome/install/#binaries
alias my_install_golangci_lint='curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/HEAD/install.sh | sh -s -- -b $(go env GOPATH)/bin'

# https://github.com/google/yamlfmt
alias my_install_yamlfmt='go install github.com/google/yamlfmt/cmd/yamlfmt@latest'

#
# Note
#

# You don't have to install `goimports` separately if you are using the modern Go language server, `gopls` because `gopls` integrates `goimports`.

# There is no official way to upgrade the Go programming language in Terminal.
# https://go.dev/doc/install
