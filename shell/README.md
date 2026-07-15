# How to deploy `.zprofile`, `.zshrc`, and `.profile`s

```shell
ln -f -s "$HOME/Documents/GitHub/dotfiles/shell/.zprofile" "$HOME"
ln -f -s "$HOME/Documents/GitHub/dotfiles/shell/.zshrc" "$HOME"
```

# How to disable the `Last login: ...` message

```shell
touch ~/.hushlogin
```
