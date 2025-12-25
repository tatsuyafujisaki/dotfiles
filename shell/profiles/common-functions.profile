#
# https://git-scm.com
#

# git clean:
#   -d is to delete untracked directories too.
# git restore:
#   --staged is to discard staged changes.
#   --worktree is to discard unstaged changes.
# git pull:
#   --all is to fetch all remotes.
# git fetch:
#   --prune is to remove remote-tracking references that no longer exist on the remote.
#   --prune-tags is to remove any local tags that no longer exist on the remote if --prune is enabled.
gg() {
  git switch develop || git switch main || git switch master
  # "grep -v \*" excludes the current branch, which is marked with an asterisk.
  git branch | grep -v \* | xargs --no-run-if-empty git branch -D
  git clean -d --force
  git restore --staged --worktree .
  git pull --all --autostash --rebase --recurse-submodules
  git fetch --force --prune --prune-tags # --force is to avoid the "would clobber existing tag" error when the remote tag is different from the local tag.
  git gc --prune=now
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
  find ~/.android/avd -type f -name cache.img*
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

  cd ~

  # Deletes folders in the home folder.
  folders=(
    .bash_sessions
    .dvdcss
    .gradle
    .hawtjni
    .lemminx
    .local
    .m2
    .oracle_jre_usage
    .zsh_sessions
    .Trash
    Downloads
    Movies
    Music
    Pictures
  )

  for folder in "$folders[@]"
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
  for file in "$files[@]"
  do
    rm -f $file
  done

  cd -
}

clean_chrome() {
  cd ~/Library/Application\ Support/Google/Chrome/Default

  rm -f *-journal
  rm -f *.bak
  rm -f *.old
  rm -f *Cookies
  rm -f Favicons
  rm -f Google\ Profile\ Picture.png
  rm -f History
  rm -f LOCK
  rm -f LOG
  rm -f Top\ Sites
  rm -fr *Cache
  rm -fr *Logs
  rm -fr Sessions

  cd -
}

delete_ds_store() {
  sudo find / -type f -name .DS_Store -delete
}

# Stands for "Delete me".
dm() {
  local dir=~/Desktop/deleteme
  rm -rf "$dir" && mkdir -p "$dir" && cd "$dir" || return 1
  [[ $# -ge 1 ]] && touch "deleteme.$1"
  ${$(command -v cursor):-code} .
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
  if cwebp -m 6 -mt -af "$1" -o "$output_file" && rm -f "$1"
  then
    echo "$output_file"
    return 0
  else
    return 1
  fi
}

my_cwebp_desktop() {
  for file in ~/Desktop/*.{jpg,jpeg,png}(N)
  do
    my_cwebp "$file"
  done
}

my_date() {
  date +"%Y-%m-%d_%H-%M-%S"
}

my_delete() {
  if [[ $# -lt 1 ]]
  then
    echo "Usage: $0 <file-or-directory>"
    return 1
  fi

  find . -iname "*$1*" -print -exec rm -rf {} + 2> /dev/null
}

my_ffmpeg() {
  if [[ ! -f "$1" ]]
  then
    echo "Usage: $0 <video>"
    return 1
  fi

  local temp="$(mktemp --dry-run).${1:e}"
  if ffmpeg -i "$1" "$temp" && mv "$temp" "$1"
  then
    echo "$1"
    return 0
  else
    return 1
  fi
}

my_ffmpeg_desktop() {
  for file in ~/Desktop/*.mp4(N)
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
    pushd $dir
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
  brew upgrade --greedy
  brew cleanup --prune=all
  brew doctor
  gcloud components update --quiet
  command -v flutter >/dev/null && flutter upgrade --force
  command -v fvm >/dev/null && fvm flutter doctor || flutter doctor
  my_install_golangci_lint
  my_install_yamlfmt
  my_git_pull_all
}
