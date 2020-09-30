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
