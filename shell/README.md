# How to disable the `Last login: ...` message
```shell
touch ~/.hushlogin
```

# How to prevent Ctrl+S from disabling the keyboard on Linux
This is unnecessary on macOS or Windows Subsystem for Linux (WSL).
```shell
stty stop undef
```
