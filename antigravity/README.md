# Antigravity

## How to deploy the files

From this directory:

```shell
ln -f -s -n "$PWD/ide/settings.json" "$HOME/Library/Application Support/Antigravity IDE/User"
```

`cli/settings.json` needs no deployment. The `agy` alias in `shell/profiles/common.profile` passes it with `--settings` for each session, because the CLI replaces `~/.gemini/antigravity-cli/settings.json` on every write and a symlink doesn't survive.

## How to enable hot reload on save

https://docs.flutter.dev/tools/hot-reload#:~:text=To%20enable%20hot%20reload%20on%20save
