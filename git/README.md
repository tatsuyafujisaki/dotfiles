# How to create `.gitignore`
## macOS
```shell
curl -o ~/.gitignore https://www.toptal.com/developers/gitignore/api/androidstudio,gradle,intellij+all,macos,node,visualstudiocode
```
Add `google-services.json` at the end of generated `.gitignore`.

## Windows
```batchfile
curl -o %USERPROFILE%\.gitignore https://www.gitignore.io/api/androidstudio,gradle,intellij+all,node,visualstudiocode,windows
```
Add `google-services.json` at the end of generated `.gitignore`.

## Alternatively, you can interactively create and download `.gitignore`
1. Create a consolidated .gitignore at [gitignore.io](https://www.gitignore.io) using the keywords below.
* AndroidStudio
* Gradle
  * to ignore the `.gradle` directory.
* Intellij+all
  * to ignore the entire `.idea` directory, which is not ignored by Intellij or Intellij+iml.
* macOS or Windows
* Node
  * to ignore the `node_modules` directory.
* VisualStudioCode
