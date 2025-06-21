# How to use `.gitconfig` in this repository on macOS
1. Clone this repository using GitHub Desktop.
2. Run following command.
    ```shell
    ln -fs ~/Documents/GitHub/dotfiles/git/.gitconfig ~
    ```

# How to create `~/.gitignore` on macOS
```shell
curl https://raw.githubusercontent.com/github/gitignore/refs/heads/main/{Android,Dart,Firebase,Flutter,Gradle,Kotlin,Swift}.gitignore > ~/.gitignore
curl https://raw.githubusercontent.com/github/gitignore/refs/heads/main/Global/{macOS,VisualStudioCode,Xcode}.gitignore >> ~/.gitignore

cat >> ~/.gitignore << 'EOF'

# google-services.json is already included in https://raw.githubusercontent.com/github/gitignore/refs/heads/main/Android.gitignore but GoogleService-Info.plist is not.
GoogleService-Info.plist

# Excludes the service credentials file used for Firebase App Distribution.
app/*.json

# > don't include most of the files that your IDE or code editor, the pub tool, and other tools generate.
# > In many source code repositories, the common practice is not to commit generated files, at all.
# https://dart.dev/tools/pub/private-files
*.freezed.dart
*.g.dart

# https://fvm.app
.fvm/
.fvmrc

EOF
```
