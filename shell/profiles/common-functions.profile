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
  git submodule update --init --recursive --remote &&
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

delete_ds_store() {
  sudo find / -type f -name .DS_Store -delete
}

# Stands for "Delete me".
dm() {
  local dir=~/Desktop/deleteme
  rm -rf "$dir" && mkdir -p "$dir" && cd "$dir" || return 1
  [[ $# -ge 1 ]] && touch "deleteme.$1"
  agy .
}

l() {
  clear

  # Prints non-dotfiles and non-dotdirectories and a blank line.
  # `.[^.]*` is a Zsh glob pattern to except `.` and `..`.
  ls -d -F -G -h -l .[^.]* 2> /dev/null && echo

  # Prints non-dotfiles and non-dotdirectories.
  ls -d -F -G -h -l * 2> /dev/null
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

my_cwebp() {
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

my_cwebp_desktop() {
  for file in ~/Desktop/*.{jpg,jpeg,png,JPG,JPEG,PNG}(N)
  do
    my_cwebp "$file"
  done
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

  _update_brew

  _update_node

  _update_golang

  _update_rust

  _update_flutter

  my_git_pull_all
}

_update_brew() {
  # https://docs.brew.sh/Manpage
  brew upgrade --greedy
  brew cleanup --prune all
  brew doctor
}

_update_node() {
  # https://github.com/Schniz/fnm/blob/master/docs/commands.md
  fnm ls | grep --invert-match "system" | grep --only-matching "v[0-9.]*" | xargs --max-args 1 fnm uninstall # uninstalls all versions except system.
  fnm install --lts
  fnm default lts-latest
  fnm use lts-latest

  # https://docs.npmjs.com/cli/v8/commands/npm-update
  npm update --global
}

_update_golang() {
  # > Note: Homebrew can use an unexpected version of Go to build the binary, so we recommend either using our binaries or ensuring the version of Go used to build.
  # https://golangci-lint.run/docs/welcome/install/local/
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

_update_flutter() {
  # https://docs.flutter.dev/install/upgrade#upgrade-the-flutter-sdk
  flutter upgrade
  flutter doctor
}
