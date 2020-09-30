# How to create `.gitignore`
## macOS
1. Run cURL.
```shell
curl -o ~/.gitignore https://www.toptal.com/developers/gitignore/api/android,androidstudio,intellij+all,macos,node,visualstudiocode
```
  * Including node is to ignore the `node_modules` directory.
2. Uncomment `google-services.json`.

## Windows
1. Run cURL.
```batchfile
curl -o %USERPROFILE%\.gitignore https://www.toptal.com/developers/gitignore/api/android,androidstudio,intellij+all,node,visualstudiocode,windows
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
* VisualStudioCode
