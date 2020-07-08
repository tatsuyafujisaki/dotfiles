# How to create `.gitignore`
## macOS
1. Run cURL.
```shell
curl -o ~/.gitignore https://www.toptal.com/developers/gitignore/api/android,androidstudio,gradle,intellij+all,macos,node,visualstudiocode
```
2. Uncomment `google-services.json`.

## Windows
1. Run cURL.
```batchfile
curl -o %USERPROFILE%\.gitignore https://www.toptal.com/developers/gitignore/api/android,androidstudio,gradle,intellij+all,node,visualstudiocode,windows
```
2. Uncomment `google-services.json`.

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
