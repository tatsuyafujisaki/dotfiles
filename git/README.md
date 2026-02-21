# How to use `.gitconfig` in this repository

1. Clone this repository using GitHub Desktop.
2. Run following command.
   ```shell
   ln -f -s ~/Documents/GitHub/dotfiles/git/.gitconfig ~
   ```

# How to create `~/.gitignore`
1. Run the script below.
   ```shell
   rm -f ~/.gitignore
   
   for type in Cursor JetBrains macOS VisualStudioCode Xcode
   do
     {
       echo "#"
       echo "# https://github.com/github/gitignore/blob/main/Global/$type.gitignore"
       echo "#"
       echo ""
       curl --location --silent "https://raw.githubusercontent.com/github/gitignore/main/Global/$type.gitignore"
       echo ""
     } >> ~/.gitignore
   done
   ```
2. Append the following.
   ```gitignore
   .idea/
   ```
   
# How to create `.gitignore` in a project

```shell
rm -f .gitignore

# Only select what you need.
for type in Android Dart Firebase Flutter Gradle Java Kotlin Swift
do
  {
    echo "#"
    echo "# https://github.com/github/gitignore/blob/main/$type.gitignore"
    echo "#"
    echo ""
    curl --location --silent "https://raw.githubusercontent.com/github/gitignore/main/$type.gitignore"
    echo ""
  } >> .gitignore
done
```
