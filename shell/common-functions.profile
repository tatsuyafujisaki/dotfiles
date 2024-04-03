#
# https://git-scm.com
#

# git branch
#   -D is a shortcut for "--delete --force".
# git clean:
#   -d is to delete untracked directories too.
# git restore:
#   --staged is to discard staged changes.
#   --worktree is to discard unstaged changes.
# git pull:
#   -- all is to fetch all remotes.
# git fetch:
#   --prune is to remove remote-tracking references that no longer exist on the remote.
#   --prune-tags is to remove any local tags that no longer exist on the remote if --prune is enabled.
gg() {
  git branch | grep -v -e main -e master -e develop | xargs git branch -D
  git clean -d --force
  git restore --staged --worktree .
  git pull --all --autostash --rebase --recurse-submodules
  git fetch --prune --prune-tags
  git gc
}

#
# Date functions
#

ymd() {
  if [ $# -lt 3 ]
  then
    echo "Usage: $funcstack[1] <year> <month> <day>"
    return
  fi

  echo "$1年$2月$3日"
}

jymd() {
  if [ $# -lt 4 ]
  then
    echo "Usage: $funcstack[1] <era> <year> <month> <day>"
    return
  fi

  case $1 in
  "m")
    era="明治"
    ;;
  "t")
    era="大正"
    ;;
  "s")
    era="昭和"
    ;;
  "h")
    era="平成"
    ;;
  "r")
    era="令和"
    ;;
  esac

  if [ $2 = 1 ]
  then
    year="元"
  else
    year=$2
  fi

  echo "$era$year年$3月$4日"
}

#
# Misc functions
#

clean_chrome() {
  pushd ~ > /dev/null # avoids showing the pushed directory stack

  cd ~/Library/Application\ Support/Google/Chrome/Default

  rm -fr sessions
  rm -f *.bak
  rm -f *.old
  rm -f *-journal
  rm -f History
  rm -f LOCK
  rm -f LOG

  popd > /dev/null # avoids showing the pushed directory stack
}

clean() {
  # Delete Chrome RLZ.
  rm -fr ~/Library/Application\ Support/Google/RLZ

  # Delete folders and files for Android development.
  rm -fr ~/.android/breakpad
  rm -fr ~/.android/build-cache
  rm -fr ~/.android/cache
  rm -fr ~/Library/Android/sdk/.downloadIntermediates
  rm -fr ~/Library/Android/sdk/.temp
  rm -f ~/.android/*.lock
  rm -f ~/.android/modem-nv-ram-*
  rm -f ~/.emulator_console_auth_token
  rm -f ~/Library/Android/sdk/.knownPackages

  # Delete folders and files for iOS development.
  rm -fr ~/.cocoapods
  rm -fr ~/.swiftpm

  # Delete folders and files for Dart development.
  rm -fr ~/.dart
  rm -fr ~/.dartServer
  rm -fr ~/.pub-cache
  rm -f ~/.flutter

  pushd ~ > /dev/null # avoids showing the pushed directory stack

  # Delete folders directly under the home folder.
  folders=(.bash_sessions .dvdcss .gradle .lemminx .local .m2 .oracle_jre_usage .zsh_sessions)
  for folder in "$folders[@]"
  do
    rm -fr $folder
  done

  # Delete files directly under the home folder.
  files=(.bash_history .CFUserTextEncoding .viminfo .zcompdump .zsh_history)
  for file in "$files[@]"
  do
    rm -f $file
  done

  popd > /dev/null # avoids showing the pushed directory stack
}

sudo_clean() {
  # Delete .DS_Store
  sudo find / -type f -iname .DS_Store -delete 2> /dev/null

  # Delete .localized
  sudo find / -type f -iname .localized -delete 2> /dev/null

  # Delete folders that require root privileges.
  sudo rm -fr ~/.Trash
  sudo rm -fr ~/Downloads
  sudo rm -fr ~/Movies
  sudo rm -fr ~/Music
  sudo rm -fr ~/Pictures
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

# Sync GitHub repositories.
gh_repo_sync_all() {
  cd ~/Documents/GitHub
  for dir in */
  do
    pushd $dir
    gh repo sync
    popd
  done
}

list_names_of_files_that_contain_string_in_content() {
  if [ $# -lt 1 ]
  then
    echo "Usage: $funcstack[1] <pattern>"
    return
  fi

  grep --ignore-case --recursive -I "$1" . | cut -d : -f 1
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

myfind() {
  if [ $# -lt 1 ]
  then
    echo "Usage: $funcstack[1] <file-or-directory>"
    return
  fi

  find . -iname "*$1*" -print 2> /dev/null
}

mysed() {
  if [ ${#} -lt 3 ]
  then
    echo "Usage: $funcstack[1] <string-before> <string-after> <file>"
    return
  fi

  # -i is to edit a file in-place instead of printing to standard output.
  # g is to enable more than one replacement in each line.
  sed -i 's/${1}/${2}/g' $3
}

myuniq() {
  if [ $# -lt 1 ]
  then
    echo "Usage: $funcstack[1] <file>"
    return
  fi

  # -f is to sort case-insensitively.
  # uniq works only if the input is sorted.
  sort -f < $1 | uniq
}

up() {
  sudo npm update --global
  gcloud components update --quiet
  flutter upgrade --force
  brew upgrade --greedy
  gh_repo_sync_all
}
