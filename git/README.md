# How to use `.gitconfig` in this repository

1. Clone this repository using GitHub Desktop.
2. Run following command.
   ```shell
   ln -f -s ~/Documents/GitHub/dotfiles/git/.gitconfig ~
   ```

# How to create `~/.gitignore`

```shell
rm -f ~/.gitignore

for type in Cursor macOS VisualStudioCode Xcode
do
  {
    echo "### $type.gitignore ###"
    echo "# Source: https://github.com/github/gitignore/blob/main/Global/$type.gitignore"
    echo ""
    curl --location --silent "https://raw.githubusercontent.com/github/gitignore/main/Global/$type.gitignore"
    echo ""
  } >> ~/.gitignore
done
```
