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

#
# Troubleshooting for a client work
#

# Stands for backend log
alias blog='ssh prod "tail -30 /var/log/supervisor/api-stderr---supervisor-*.log" > ~/Desktop/prod_api_stderr_logs.txt'

alias sshd='ssh dev'
alias sshs='ssh stg'
alias sshp='ssh prod'
