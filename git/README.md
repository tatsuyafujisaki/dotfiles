# How to use `.gitconfig` in this repository on macOS
1. Clone this repository using GitHub Desktop.
2. Run following command.
    ```shell
    ln -fs ~/Documents/GitHub/dotfiles/git/.gitconfig ~
    ```

# How to create `~/.gitignore` on macOS
```shell
cat <<EOF>> ~/.gitignore
# google-services.json is already included in https://raw.githubusercontent.com/github/gitignore/refs/heads/main/Android.gitignore
GoogleService-Info.plist

# > don't include most of the files that your IDE or code editor, the pub tool, and other tools generate.
# > In many source code repositories, the common practice is not to commit generated files, at all.
# https://dart.dev/tools/pub/private-files
*.freezed.dart
*.g.dart

# https://fvm.app
.fvm/
.fvmrc

EOF

# Appends .gitignore templates.
# NB: If you use both Dart and Python and want to add `Python.gitignore` as well, note that `lib/` in `Python.gitignore` will ignore any source files in Dart's `lib/` source directory.
curl https://raw.githubusercontent.com/github/gitignore/refs/heads/main/{Android,Dart,Firebase,Flutter,Gradle,Kotlin,Swift}.gitignore > ~/.gitignore
curl https://raw.githubusercontent.com/github/gitignore/refs/heads/main/Global/{macOS,VisualStudioCode,Xcode}.gitignore >> ~/.gitignore
```
