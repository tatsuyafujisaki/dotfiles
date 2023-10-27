# opens this file in Visual Studio Code.
alias cfp='code ~/Documents/GitHub/dotfiles/shell/common-functions.profile'

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
# https://imagemagick.org
#

pdf_to_png() {
  if [ $# -lt 1 ]
  then
    echo "Usage: $funcstack[1] <file>"
    return
  fi

  local basename=$1:r

  magick -density 600 $basename.pdf -trim $basename.png
}

pdf_to_png_grascale() {
  if [ $# -lt 1 ]
  then
    echo "Usage: $funcstack[1] <file>"
    return
  fi

  local basename=$1:r

  magick -density 600 $basename.pdf -trim -type grayscale $basename.png
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

meiji() { jymd "m" $1 $2 $3 }
taisho() { jymd "t" $1 $2 $3 }
showa() { jymd "s" $1 $2 $3 }
heisei() { jymd "h" $1 $2 $3 }
reiwa() { jymd "r" $1 $2 $3 }

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

  popd > /dev/null # avoids showing the pushed directory stack
}

clean() {
  # Delete .DS_Store
  sudo find / -type f -iname .DS_Store -delete 2> /dev/null

  # Delete .localized
  sudo find / -type f -iname .localized -delete 2> /dev/null

  # Delete folders for Android development.
  rm -fr ~/.android/breakpad
  rm -fr ~/.android/build-cache
  rm -fr ~/.android/cache
  rm -fr ~/Library/Android/sdk/.downloadIntermediates
  rm -fr ~/Library/Android/sdk/.temp

  # Delete files for Android development.
  rm -f ~/.android/*.lock
  rm -f ~/.android/modem-nv-ram-*
  rm -f ~/.emulator_console_auth_token
  rm -f ~/Library/Android/sdk/.knownPackages

  pushd ~ > /dev/null # avoids showing the pushed directory stack

  # Delete unnecessary folders that require root privileges.
  sudo rm -fr Downloads Movies Music Pictures

  # Delete other unnecessary folders.
  cd ~/Library/Application\ Support/Google/RLZ

  folders=(.bash_sessions .dvdcss .gradle .lemminx .local .m2 .oracle_jre_usage .Trash .zsh_sessions)
  for folder in "$folders[@]"
  do
    rm -fr $folder
  done

  # Delete unnecessary files.
  files=(.bash_history .CFUserTextEncoding .viminfo .zcompdump .zsh_history)
  for file in "$files[@]"
  do
    rm -f $file
  done

  popd > /dev/null # avoids showing the pushed directory stack
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

list_files_that_contain_string() {
  if [ $# -lt 1 ]
  then
    echo "Usage: $funcstack[1] <pattern>"
    return
  fi

  grep --ignore-case --recursive -I "$1" . | cut -d : -f 1 | xargs basename
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

rename_branch() {
  if [ $# -lt 2 ]
  then
    echo "Usage: $funcstack[1] <old-branch> <new-branch>"
    return
  fi

  git switch $1
  git branch -m $2 # renames the current branch to the new branch on local.
  git push origin :$1 # deletes the old branch on remote.
  git push -u origin $2 # creates the new branch on remote and resets the upstream branch to it.
}

# Update shell profiles
upp() {
  # Remember to manually download private.profile from a private gist.

  pushd ~
  curl -O https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/main/shell/.bash_profile
  curl -O https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/main/shell/.zshrc

  pushd ~/.shell_profiles
  curl -O https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/main/shell/adb.profile
  curl -O https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/main/shell/common.profile
  curl -O https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/main/shell/common-functions.profile
  curl -O https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/main/shell/flutter.profile
  curl -O https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/main/shell/mac.profile

  popd
  popd

  exec -l $SHELL
}

# Must be defined after both clean and up are defined.
cleanup() {
  clean
  up
}
