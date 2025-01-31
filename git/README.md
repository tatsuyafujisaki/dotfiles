# How to use `.gitconfig` in this repository on macOS
1. Clone this repository using GitHub Desktop.
2. Run following command.
    ```shell
    ln -fs ~/Documents/GitHub/dotfiles/git/.gitconfig ~
    ```

# How to create `.gitignore` in the home folder on macOS
1. Run the following command.
    ```shell
    curl https://raw.githubusercontent.com/github/gitignore/main/{Android.gitignore,Dart.gitignore,Go.gitignore,Swift.gitignore} > ~/.gitignore
    ```
2. Add the following to `~/.gitignore`.
    ```gitignore
    pubspec.lock

    # > don't include most of the files that your IDE or code editor, the pub tool, and other tools generate.
    # > In many source code repositories, the common practice is not to commit generated files, at all.
    # https://dart.dev/tools/pub/private-files
    *.freezed.dart
    *.g.dart

    # https://fvm.app
    .fvm/
    .fvmrc
    ```
