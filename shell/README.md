# How to use `.bash_profile`, `.zprofile`, and `.zshrc` in this repository on macOS
```shell
ln -fs ~/Documents/GitHub/dotfiles/shell/startup/.bashrc ~
ln -fs ~/Documents/GitHub/dotfiles/shell/startup/.zprofile ~
ln -fs ~/Documents/GitHub/dotfiles/shell/startup/.zshrc ~
```

# How to disable the `Last login: ...` message
```shell
touch ~/.hushlogin
```
