# Create `.hushlogin`
```bash
# Prevents Terminal from printing "Last login" when opening bash.
touch ~/.hushlogin
```

# Finder
## How to add "Copy Path" to the context menu
1. Open Automator
2. Select `Quick Action`
3. Set `Workflow receives current "files or folders" in "Finder"`
4. Double-click `Copy to Clipboard` on the left list
5. Cmd+S and save quick action as "Copy Path"

## How to add "Open in Visual Studio Code" to the context menu
1. Open Automator
2. Select `Quick Action`
3. Set `Workflow receives current "files or folders" in "Finder"`
4. Double-click `Open Finder Items` on the left list
5. Set `Visual Studio Code` in `open with`
6. Cmd+S and save quick action as "Open in Visual Studio Code"

## Add "Open in Android Studio" to the context menu
Do the same as "Open in Visual Studio Code" for Android Studio
