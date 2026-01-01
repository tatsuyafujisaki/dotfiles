# How to use `.gitconfig` in this repository on macOS

1. Clone this repository using GitHub Desktop.
2. Run following command.
   ```shell
   ln -f -s ~/Documents/GitHub/dotfiles/git/.gitconfig ~
   ```

# How to create `~/.gitignore` on macOS

```shell
rm ~/.gitignore

for type in Cursor macOS VisualStudioCode Xcode
do
  echo "#\n# https://github.com/github/gitignore/tree/main/Global/blob/main/$type.gitignore\n#\n" >> .gitignore
  curl --location "https://raw.githubusercontent.com/github/gitignore/refs/heads/main/Global/$type.gitignore" >> .gitignore
  echo "\n" >> ~/.gitignore
done
```
