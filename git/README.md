# Git

## How to create a consolidated `~/.config/git/ignore`

1. Run the script below.

   ```shell
   mkdir -p ~/.config/git
   rm -f ~/.config/git/ignore

   for type in JetBrains macOS VisualStudioCode Xcode
   do
     {
       echo "#"
       echo "# https://github.com/github/gitignore/blob/main/Global/$type.gitignore"
       echo "#"
       echo ""
       curl --location --silent "https://raw.githubusercontent.com/github/gitignore/main/Global/$type.gitignore"
       echo ""
     } >> ~/.config/git/ignore
   done
   ```
2. Append the following.

   ```gitignore
   .idea/
   ```

## How to create a consolidated `.gitignore` in a project

```shell
rm -f .gitignore

# Only select what you need.
for type in Android Dart Firebase Flutter Gradle Java Kotlin Swift
do
  {
    echo "#"
    echo "# https://github.com/github/gitignore/blob/main/$type.gitignore"
    echo "#"
    echo ""
    curl --location --silent "https://raw.githubusercontent.com/github/gitignore/main/$type.gitignore"
    echo ""
  } >> .gitignore
done
```

## How to create a single `.gitignore` in a Node.js project

```shell
curl --location --silent --output .gitignore https://raw.githubusercontent.com/github/gitignore/main/Node.gitignore
```
