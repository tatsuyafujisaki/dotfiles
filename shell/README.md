# How to deploy `.zprofile`, `.zshrc`, and `.profile`s

```shell
ln -f -s "$PWD/.zprofile" "$HOME"
ln -f -s "$PWD/.zshrc" "$HOME"
```

# How to disable the `Last login: ...` message

```shell
touch ~/.hushlogin
```
