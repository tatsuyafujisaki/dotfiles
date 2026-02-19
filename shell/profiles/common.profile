unset HISTFILE # avoids creating $HISTFILE (i.e. ~/.bash_history on Bash and ~/.zsh_history on Zsh)

export EDITOR=nano # makes 'crontab -e' use nano instead of vim
export LESS=IMRS
export LESSHISTFILE=- # avoids creating ~/.lesshst
export NODE_REPL_HISTORY='' # avoids creating ~/.node_repl_history

#
# cd-related
#

alias ap='cd ~/Documents/GitHub/android-playground'
alias asl='cd ~/Documents/GitHub/apps-script-library'
alias chrome_profile='cd ~/Library/Application\ Support/Google/Chrome/Default'
alias d='cd ~/Desktop'
alias df='cd ~/Documents/GitHub/dotfiles'
alias dnp='cd ~/Documents/GitHub/deno-playground'
alias fp='cd ~/Documents/GitHub/flutter-playground'
alias h='cd ~/Documents/GitHub'
alias jp='cd ~/Documents/GitHub/java-playground'
alias kp='cd ~/Documents/GitHub/kotlin-playground'
alias xp='cd ~/Documents/GitHub/xcode-playground'

#
# Google Chrome
#

alias export_search_engines='cp ~/Library/Application\ Support/Google/Chrome/Default/Web\ Data ~/Desktop/'
alias import_search_engines='cp ~/Desktop/Web\ Data ~/Library/Application\ Support/Google/Chrome/Default/'

#
# https://cloud.google.com/sdk
#

# The next line updates PATH for the Google Cloud SDK.
[[ -f $HOME/google-cloud-sdk/path.zsh.inc ]] && . $HOME/google-cloud-sdk/path.zsh.inc

# The next line enables shell command completion for gcloud.
[[ -f $HOME/google-cloud-sdk/completion.zsh.inc ]] && . $HOME/google-cloud-sdk/completion.zsh.inc

#
# https://antigravity.google
#

[[ -d "$HOME/.antigravity/antigravity/bin" ]] && export PATH="$HOME/.antigravity/antigravity/bin:$PATH"

alias a='agy .'

#
# https://code.visualstudio.com
# https://cursor.com
#

alias c="${$(command -v cursor):-code} ."

#
# https://github.com/astral-sh/uv
#

[[ -d "$HOME/.local/bin" ]] && export PATH="$PATH:$HOME/.local/bin"

#
# https://cli.github.com
#

alias ghpr='gh pr create --assignee @me --web'
alias ghprl='gh pr list --web'
alias ghprv='gh pr view --web'
alias ghrl='gh release list'
alias ghrv='gh repo view --web'

# "build" means Flutter's build directory.
# https://man.freebsd.org/cgi/man.cgi?query=grep
alias mygrep='grep --ignore-case --line-number --recursive -I --exclude-dir .git'

# https://man.freebsd.org/cgi/man.cgi?query=pkill
alias p='pkill -f gradle'
alias show_path='echo ${PATH} | tr : \\n'

# Ideally, only the line with the largest version would be kept when there are multiple lines for different versions of the same library, but this is difficult. This is because, when comparing versions in text, 1.2 is considered larger than 1.10.
# sed -E 's/^[^[:alpha:]]*//' removes leading non-alphabetic characters.
# sed -E 's/(.*):[0-9.]+ -> ([0-9.]+)$/\1:\2/' changes "foo:1.0 -> 2.0" to "foo:2.0".
alias print_app_module_dependencies_as_list="./gradlew app:dependencies | grep -- '---' | grep '[0-9]' | grep -v '(c)$' | grep -v '(n)$' | grep -v '(\*)$' | sed -E 's/^[^[:alpha:]]*//' | sed -E 's/(.*):[0-9.]+ -> ([0-9.]+)$/\1:\2/' | sort --unique"

#
# JDK (Java Development Kit)
#

alias jh='/usr/libexec/java_home --verbose' # takes the version of Java Development Kit (JDK).

#
# https://github.com/features/actions
#

# By default, `gh` limits the output of many commands (including run list) to the 30 most recent items.
# To list all workflow runs (up to the maximum allowed by the API, which is 1000), `--limit` is required.
alias my_bulk_delete_github_actions_history='gh run list --limit 1000 --json databaseId --jq ".[].databaseId" | xargs -n 1 gh run delete'

#
# https://asdf-vm.com
#

# Adds tools installed via asdf to PATH.
[[ -d "$HOME/.asdf/shims" ]] && export PATH="$HOME/.asdf/shims:$PATH"

#
# Miscellaneous aliases
#

alias copy_chrome_search_engines='sudo cp ~/Library/Application\ Support/Google/Chrome/Default/Web\ Data /Users/work/Library/Application\ Support/Google/Chrome/Default/'
alias delmedia='(cd ~/Desktop && rm -f *.{gif,jpeg,jpg,mp4,png,svg,webm,webp} .DS_Store 2>/dev/null)'
alias g=git
