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
  rm -fr ~/Library/Application\ Support/Google/RLZ

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

dm() {
  local dir=~/Desktop/deleteme
  rm -r $dir
  mkdir -p $dir
  cd $dir
  [[ $# -ge 1 ]] && touch deleteme.$1
  code .
}

git_pull_all() {
  pushd ~/Documents/GitHub
  for dir in */
  do
    pushd $dir
    gg # is a function defined in this file.
    popd
  done
  popd
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
  for image in ~/Desktop/*.{jpg,jpeg,png}(N)
  do
    cwebp -m 6 -mt -af "$image" -o "${image%.*}.webp" && rm -f "$image"
  done
}

mkdircd() {
  if [[ $# -lt 1 ]]
  then
    echo "Usage: $0 <directory>"
    return
  fi

  mkdir -p "$1" && cd "$1"
}

my_delete() {
  if [[ $# -lt 1 ]]
  then
    echo "Usage: $0 <file-or-directory>"
    return
  fi

  find . -iname "*$1*" -print -exec rm -rf {} + 2> /dev/null
}

my_ffmpeg() {
  for file in ~/Desktop/*.mp4(N)
  do
    local temp=$(mktemp --dry-run).$file:e
    ffmpeg -i "$file" "$temp" && mv "$temp" "$file"
  done
}

my_find() {
  if [[ $# -lt 1 ]]
  then
    echo "Usage: $0 <file-or-directory>"
    return
  fi

  find . -iname "*$1*" 2>/dev/null
}

my_open_port() {
  if [[ $# -lt 1 ]]
  then
    echo "Usage: $0 <port>"
    return
  fi

  lsof -i:$1 -t | xargs --no-run-if-empty kill
}

my_remove_compressed_pdf_suffix() {
  for file in ~/Desktop/*-compressed.pdf; do
    mv -- "$file" "${file/-compressed/}"
  done
}

my_set_java_home() {
  if [[ $# -lt 1 ]]
  then
    echo "Usage: $0 <version>"
    return
  fi
  export JAVA_HOME=$(/usr/libexec/java_home -v "$1")
}

up() {
  brew upgrade --greedy
  brew cleanup --prune=all
  brew doctor
  gcloud components update --quiet
  command -v flutter >/dev/null && flutter upgrade --force
  command -v fvm >/dev/null && fvm flutter doctor || command -v flutter >/dev/null && flutter doctor
  git_pull_all
}
