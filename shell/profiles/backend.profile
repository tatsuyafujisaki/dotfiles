#
# https://cloud.google.com/cli
#

# The following lines were added when Google Cloud SDK was installed.
[[ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]] && source "$HOME/google-cloud-sdk/path.zsh.inc"
[[ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]] && source "$HOME/google-cloud-sdk/completion.zsh.inc"

#
# https://www.docker.com
#

alias dcu='docker compose up --detach --remove-orphans --wait'

#
# https://github.com/google/yamlfmt
#

alias yf='yamlfmt .'

#
# https://github.com/astral-sh/uv
#

alias uvr='uv run'
alias uvrp='uv run python'
alias uvrpm='uv run python manage.py'
alias uvrpmr='uv run python manage.py runserver && open http://localhost:8000/admin'
