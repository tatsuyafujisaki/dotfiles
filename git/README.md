# How to create `.gitignore`
## macOS
```shell
curl -o ~/.gitignore https://www.gitignore.io/api/androidstudio,gradle,intellij+all,macos,visualstudiocode
```
## Windows
```batchfile
curl -o %USERPROFILE%\.gitignore https://www.gitignore.io/api/androidstudio,gradle,intellij+all,visualstudiocode,windows
```
## Alternatively, you can interactively create and download `.gitignore`
1. Create a consolidated .gitignore at [gitignore.io](https://www.gitignore.io) using the keywords below.
* AndroidStudio
* Gradle
  * to ignore the `.gradle` directory.
* Intellij+all
  * to ignore the entire `.idea` directory, which is not ignored by Intellij or Intellij+iml.
* macOS or Windows
* VisualStudioCode

2. Additionally, if you develop ClickOnce applications, remove `*.pfx` from `.gitignore` because it is used for signing ClickOnce applications.
