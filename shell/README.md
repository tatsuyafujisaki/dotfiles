# How to prevent Ctrl+S from disabling keyboard on Linux
This is unnecessary on macOS or Windows Subsystem for Linux (WSL).
```shell
stty stop undef
```
