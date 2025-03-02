# How to use `.gitconfig` in this repository on macOS
1. Clone this repository using GitHub Desktop.
2. Run following command.
    ```shell
    ln -fs ~/Documents/GitHub/dotfiles/git/.gitconfig ~
    ```

# How to create `.gitignore` in the home folder on macOS
1. Run the following command.
    ```shell
    rm ~/.gitignore
    curl https://raw.githubusercontent.com/github/gitignore/refs/heads/main/Android.gitignore >> ~/.gitignore
    curl https://raw.githubusercontent.com/github/gitignore/refs/heads/main/Dart.gitignore >> ~/.gitignore
    curl https://raw.githubusercontent.com/github/gitignore/refs/heads/main/Firebase.gitignore >> ~/.gitignore
    curl https://raw.githubusercontent.com/github/gitignore/refs/heads/main/Flutter.gitignore >> ~/.gitignore
    curl https://raw.githubusercontent.com/github/gitignore/refs/heads/main/Global/macOS.gitignore >> ~/.gitignore
    curl https://raw.githubusercontent.com/github/gitignore/refs/heads/main/Global/VisualStudioCode.gitignore >> ~/.gitignore
    curl https://raw.githubusercontent.com/github/gitignore/refs/heads/main/Global/Xcode.gitignore >> ~/.gitignore
    curl https://raw.githubusercontent.com/github/gitignore/refs/heads/main/Gradle.gitignore >> ~/.gitignore
    curl https://raw.githubusercontent.com/github/gitignore/refs/heads/main/Kotlin.gitignore >> ~/.gitignore
    curl https://raw.githubusercontent.com/github/gitignore/refs/heads/main/Python.gitignore >> ~/.gitignore
    curl https://raw.githubusercontent.com/github/gitignore/refs/heads/main/Swift.gitignore >> ~/.gitignore
    ```

    ```shell
    # Alternatively
    curl https://raw.githubusercontent.com/github/gitignore/main/{<file1>, <file2>, ...} > ~/.gitignore
    ```
2. Add the following to `~/.gitignore`.
    ```gitignore
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
    ```
