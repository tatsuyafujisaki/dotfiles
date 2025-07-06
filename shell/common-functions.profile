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
  git branch | grep -v \* | xargs git branch -D
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

backup_desktop() {
  cd ~/Desktop

  local dir=$(date +"%Y-%m-%d_%H-%M-%S")
  rm -r $dir
  mkdir -p $dir

  mv * $dir
}

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

  if [ $# -ge 1 ]
  then
    touch deleteme.$1
  fi

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

mkdircd() {
  if [ $# -lt 1 ]
  then
    echo "Usage: $funcstack[1] <directory>"
    return
  fi

  mkdir -p $1 && cd $1
}

mydelete() {
  if [ $# -lt 1 ]
  then
    echo "Usage: $funcstack[1] <file-or-directory>"
    return
  fi

  find . -iname "*$1*" -print -exec rm -rf {} + 2> /dev/null
}

myffmpeg() {
  if [ $# -lt 1 ]
  then
    echo "Usage: $funcstack[1] <mp4-or-webm>"
    return
  fi

  extension=$1:e
  # Without the extension, ffmpeg will get an "Unable to select an output format" error.
  local temp=$(mktemp --dry-run).$extension
  ffmpeg -i $1 $temp
  mv $temp $1
}

# > "N" ... sets the NULL_GLOB option for the current pattern
# https://zsh.sourceforge.io/Doc/Release/Expansion.html#Glob-Qualifiers
#
# The N glob qualifier avoids treating the "*" in "*.mp4" as non-wildcard if there is no mp4 file if there is no mp4 file, and the "*" in "*.webm" as non-wildcard if there is no webm file if there is no webm file.
myffmpeg_all() {
  for file in ~/Desktop/*.{mp4,webm}(N)
  do
    myffmpeg $file
  done
}

myfind() {
  if [ $# -lt 1 ]
  then
    echo "Usage: $funcstack[1] <file-or-directory>"
    return
  fi

  find . -iname "*$1*" -print 2> /dev/null
}

# Renames PDF files, compressed by Adobe, which have "-compressed" in the filename.
my_rename_compressed_pdfs() {
  for file in ~/Desktop/*-compressed.pdf; do
    mv -- "$file" "${file//-compressed/}"
  done
}

up() {
  sudo npm cache clean
  sudo npm update --global
  brew upgrade --greedy
  brew cleanup --prune=all
  brew doctor
  gcloud components update
  flutter upgrade --force
  flutter doctor
  git_pull_all
}
