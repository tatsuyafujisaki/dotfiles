# How to create `.gitignore`
```shell
curl https://raw.githubusercontent.com/github/gitignore/main/{\
  Android.gitignore,\
  Dart.gitignore,\
  Swift.gitignore\
} > .gitignore
```

# Add the following to the generated `.gitignore`
```gitignore
# > In many source code repositories, the common practice is not to commit generated files, at all.
# https://dart.dev/guides/libraries/private-files#details
*.freezed.dart
*.g.dart
```
