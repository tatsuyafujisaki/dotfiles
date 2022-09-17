#
# https://github.com/GoogleChromeLabs/squoosh/tree/dev/cli
#

mysq() {
  cd ~/Desktop
  [ -f *.jpg ] && squoosh-cli --mozjpeg auto *.jpg
  [ -f *.png ] && squoosh-cli --oxipng auto *.png
  cd -
}

#
# https://ffmpeg.org
#

gif2mp4() {
  if [ $# -lt 1 ]
  then
    echo "Usage: $funcstack[1] <mp4>"
    return
  fi

  local basename=$1:r

  ffmpeg -y -i $basename.gif $basename.mp4
}

mp4_to_gif() {
  if [ $# -lt 1 ]
  then
    echo "Usage: $funcstack[1] <mp4>"
    return
  fi

  local basename=$1:r

  ffmpeg -y -i $basename.mp4 $basename.gif
}

#
# https://imagemagick.org
#

pdf2png() {
  if [ $# -lt 1 ]
  then
    echo "Usage: $funcstack[1] <file>"
    return
  fi

  local basename=$1:r

  magick -density 600 $basename.pdf -trim -type grayscale $basename.png
}

pdf2png_grascale() {
  if [ $# -lt 1 ]
  then
    echo "Usage: $funcstack[1] <file>"
    return
  fi

  local basename=$1:r

  magick -density 600 $basename.pdf -trim $basename.png
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

  popd > /dev/null # avoids showing the pushed directory stack
}

clean() {
  # Delete .DS_Store
  sudo find / -type f -iname .DS_Store -delete 2> /dev/null

  # Delete .localized
  sudo find / -type f -iname .localized -delete 2> /dev/null

  # Delete directories for Android development.
  rm -fr ~/.android/breakpad
  rm -fr ~/.android/build-cache
  rm -fr ~/.android/cache
  rm -fr ~/Library/Android/sdk/.downloadIntermediates
  rm -fr ~/Library/Android/sdk/.temp

  # Delete files for Android development.
  rm -f ~/.android/*.lock
  rm -f ~/.android/modem-nv-ram-*
  rm -f ~/Library/Android/sdk/.knownPackages

  pushd ~ > /dev/null # avoids showing the pushed directory stack

  # Delete unnecessary directories that require root privileges.
  sudo rm -fr Downloads Movies Music Pictures

  # Delete unnecessary directories
  cd ~/Library/Application\ Support/Google/RLZ

  directories=(.bash_sessions .dvdcss .gradle .lemminx .local .m2 .oracle_jre_usage .Trash)
  for directory in "$directories[@]"
  do
    rm -fr $directory
  done

  mkdir .gradle
  curl -o ~/.gradle/gradle.properties https://raw.githubusercontent.com/tatsuyafujisaki/android-playground/master/gradle.properties

  # Delete unnecessary files
  files=(.bash_history .CFUserTextEncoding .viminfo .zcompdump .zsh_history)
  for file in "$files[@]"
  do
    rm -f $file
  done

  popd > /dev/null # avoids showing the pushed directory stack
}

clean_android_or_intellij_project() {
  # Delete unnecessary directories
  directories=(.gradle .idea build)
  for directory in "$directories[@]"
  do
    find . -type d -name "$directory" -exec rm -rf {} +
  done

  # Delete unnecessary files
  files=(*.iml)
  for file in "$files[@]"
  do
    find . -type f -name "$file" -delete
  done
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

# Update shell resources
upp() {
  # Remember to manually download private.profile from a private gist.

  curl -o ~/.bash_profile https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/main/shell/.bash_profile
  curl -o ~/.zshrc https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/main/shell/.zshrc
  curl --create-dirs -o ~/.shell_profiles/adb.profile https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/main/shell/adb.profile
  curl --create-dirs -o ~/.shell_profiles/common.profile https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/main/shell/common.profile
  curl --create-dirs -o ~/.shell_profiles/common-functions.profile https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/main/shell/common-functions.profile
  curl --create-dirs -o ~/.shell_profiles/mac.profile https://raw.githubusercontent.com/tatsuyafujisaki/dotfiles/main/shell/mac.profile

  exec -l $SHELL
}

ymd() {
  if [ $# -lt 3 ]
  then
    echo "Usage: $funcstack[1] <year> <month> <day>"
    return
  fi

  local result="$1年$2月$3日"

  echo $result | pbcopy
}

# Must be defined after both clean and up are defined.
cleanup() {
  clean
  up
}
