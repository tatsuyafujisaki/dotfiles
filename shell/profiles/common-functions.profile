#
# https://git-scm.com
#

gg() {
  if [[ -n "$1" ]]; then
    git switch "$1"
  else
    git switch develop || git switch main || git switch master
  fi &&
  { git branch | grep --invert-match \* | xargs --no-run-if-empty git branch -D || true; } &&
  git clean -d --force &&
  git reset --hard &&
  git pull --all --rebase --recurse-submodules &&
  git submodule update --force --init --recursive --remote &&
  git submodule foreach --recursive git clean --force -d &&
  git stash clear
}

#
# Misc functions
#

clean() {
  sudo find ~ -type f -name .DS_Store -delete

  # Deletes Chrome RLZ.
  rm -fr "$HOME/Library/Application Support/Google/RLZ"

  # Delete the prompt history for the Cursor editor.
  rm -fr "$HOME/Library/Application Support/Cursor/User/workspaceStorage"

  # Deletes folders and files for Android development.
  find ~/.android/avd -type f -name cache.img* -delete
  rm -f ~/.android/*.lock
  rm -f ~/.android/modem-nv-ram-*
  rm -f ~/.emulator_console_auth_token
  rm -f ~/Library/Android/sdk/.knownPackages
  rm -fr ~/.android/breakpad
  rm -fr ~/.android/build-cache
  rm -fr ~/.android/cache
  rm -fr ~/Library/Android/sdk/.downloadIntermediates
  rm -fr ~/Library/Android/sdk/.temp

  # Deletes folders and files for iOS development.
  rm -fr ~/.cocoapods
  rm -fr ~/.swiftpm

  # Deletes folders and files for Dart development.
  rm -fr ~/.dart
  rm -fr ~/.dartServer
  rm -fr ~/.flutter
  rm -fr ~/.pub-cache

  (
    cd ~

    # Deletes folders in the home folder.
    folders=(
      .bash_sessions
      .dvdcss
      .gradle
      .hawtjni
      .lemminx
      .m2
      .oracle_jre_usage
      .zsh_sessions
      .Trash
      Downloads
      Movies
      Music
      Pictures
    )

    for folder in "${folders[@]}"
    do
      rm -fr "$folder"
    done

    # Deletes in the home folder.
    files=(
      .bash_history
      .CFUserTextEncoding
      .viminfo
      .zcompdump
      .zsh_history
    )
    for file in "${files[@]}"
    do
      rm -f "$file"
    done
  )
}

clean_chrome() {
  (
    cd "$HOME/Library/Application Support/Google/Chrome/Default"

    files=(
      *-journal
      *.bak
      *.old
      Cookies
      Favicons
      "Google Profile Picture.png"
      History
      LOCK
      LOG
      "Top Sites"
      "Visited Links"
    )
    for file in "${files[@]}"; do
      rm -f "$file"
    done

    dirs=(
      AutofillAiModelCache
      GPUCache
      Sessions
    )
    for dir in "${dirs[@]}"; do
      rm -fr "$dir"
    done
  )
}

# Stands for "cwebp".
cw() {
  for file in ~/Desktop/*.{jpg,jpeg,png,JPG,JPEG,PNG}(N)
  do
    _my_cwebp "$file"
  done
}

delete_ds_store() {
  sudo find "${1:-/}" -name .DS_Store -delete
}

# Stands for "Delete me".
dm() {
  local dir=~/Desktop/deleteme
  rm -rf "$dir" && mkdir -p "$dir" && cd "$dir" || return 1
  [[ $# -ge 1 ]] && touch "deleteme.$1"
  if command -v agy >/dev/null; then
    agy .
  else
    code .
  fi
}

l() {
  clear
  ls -dFGhl .[^.]*(N) 2>/dev/null && echo
  ls -dFGhl *(N) 2>/dev/null
}

# Stands for "makedir and cd".
mc() {
  if [[ $# -lt 1 ]]
  then
    echo "Usage: $0 <directory>"
    return 1
  fi

  mkdir -p "$1" && cd "$1"
}

my_ai() {
  local query=$(pbpaste)
  local urls=(
    "https://chatgpt.com/?q=$query"
    "https://claude.ai"
    "https://copilot.microsoft.com/?q=$query"
    "https://grok.com/?q=$query"
    "https://www.google.com/search?hl=en&udm=50&q=$query"
    "https://www.perplexity.ai/search/new?q=$query"
  )
  open "${urls[@]}"
}

my_backup_desktop() {
  local dir=~/Desktop/$(date +"%Y-%m-%d_%H-%M-%S")
  mkdir -p "$dir" && mv ~/Desktop/* "$dir"/
}

_my_cwebp() {
  if [[ $# -lt 1 ]]
  then
    echo "Usage: $0 <image>"
    return 1
  fi

  local output_file="${1%.*}.webp"
  if cwebp -m 6 -mt -af "$1" -o "$output_file"
  then
    echo "$output_file"
    return 0
  else
    return 1
  fi
}

my_ffmpeg() {
  if [[ ! -f "$1" ]]
  then
    echo "Usage: $0 <video>"
    return 1
  fi

  local output="${1%.*}.mp4"
  local temp="$(mktemp --dry-run).mp4"
  if ffmpeg -i "$1" "$temp"
  then
    [[ "$1" != "$output" ]] && rm -f "$1"
    mv "$temp" "$output"
    return 0
  else
    rm -f "$temp"
    return 1
  fi
}

my_ffmpeg_desktop() {
  for file in ~/Desktop/*.{mov,mp4,MOV,MP4}(N)
  do
    my_ffmpeg "$file"
  done
}

my_find() {
  if [[ $# -lt 1 ]]
  then
    echo "Usage: $0 <file-or-directory>"
    return 1
  fi

  find . -iname "*$1*" 2>/dev/null
}

my_git_pull_all() {
  pushd ~/Documents/GitHub
  for dir in */
  do
    pushd "$dir"
    gg # is a function defined in this file.
    popd
  done
  popd
}

my_mkdir() {
  if [[ $# -lt 1 ]]
  then
    echo "Usage: $0 <directory>"
    return 1
  fi

  mkdir -p "$1" && cd "$1"
}

my_open_port() {
  if [[ $# -lt 1 ]]
  then
    echo "Usage: $0 <port>"
    return 1
  fi

  lsof -i:$1 -t | xargs --no-run-if-empty kill
}

# Removes the '-compressed' suffix from the names of PDF files on Desktop.
my_remove_compressed_suffix() {
  for file in ~/Desktop/*-compressed.pdf
  do
    mv -- "$file" "${file/-compressed/}"
  done
}

# Removes the ' (1)' suffix from the names of files on Desktop.
my_remove_parenthesized_one_suffix() {
  for file in ~/Desktop/*\ \(1\)*(N)
  do
    mv -- "$file" "${file/ \(1\)/}"
  done
}

up() {
  # https://cloud.google.com/cli
  gcloud components update --quiet

  # https://github.com/astral-sh/uv?tab=readme-ov-file#installation
  uv self update

  _update_android

  _update_brew

  _update_flutter

  _update_node

  _update_golang

  _update_rust

  _update_skills

  my_git_pull_all
}

_update_android() {
  android update && android skills add --all
}

_update_brew() {
  # https://docs.brew.sh/Manpage
  brew upgrade --greedy
  brew cleanup --prune all
  brew doctor
}

_update_flutter() {
  if command -v flutter >/dev/null
  then
    # https://docs.flutter.dev/install/upgrade#upgrade-the-flutter-sdk
    flutter upgrade
    flutter doctor
  fi
}

_update_node() {
  NODE_VERSION=$(fnm list-remote | tail -1)
  fnm install $NODE_VERSION
  fnm default $NODE_VERSION
  fnm use $NODE_VERSION

  # https://docs.npmjs.com/cli/v8/commands/npm-update
  npm update --global

  # fnm list
  # fnm uninstall v#.#.#
}

_update_golang() {
  # https://golangci-lint.run/docs/welcome/install/local/#:~:text=Note:%20Homebrew%20can%20use%20an%20unexpected%20version%20of%20Go%20to%20build%20the%20binary,%20so%20we%20recommend%20either%20using%20our%20binaries%20or%20ensuring%20the%20version%20of%20Go%20used%20to%20build.
  curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/HEAD/install.sh | sh -s -- -b $(go env GOPATH)/bin

  # https://github.com/google/yamlfmt
  go install github.com/google/yamlfmt/cmd/yamlfmt@latest
}

_update_rust() {
  # https://rustup.rs
  rustup update

  # https://docs.rs/crate/oxipng/latest
  cargo install oxipng # updates oxipng.
}

# https://github.com/vercel-labs/skills
_update_skills() {
  # Removes all the skills.
  # npx skills remove --all --global --yes

  # https://firebase.google.com/docs/ai-assistance/agent-skills
  # npx skills add firebase/agent-skills--all --global --yes

  # https://github.com/google/skills
  # npx skills add google/skills --global --agent universal # You manually select "gemini-api" and "firebase-basics".

  # https://docs.flutter.dev/ai/agent-skills
  # npx skills add dart-lang/skills --all --global --yes
  # npx skills add flutter/skills --all --global --yes

  # https://github.com/vercel-labs/skills
  npx skills update --global --yes
}
