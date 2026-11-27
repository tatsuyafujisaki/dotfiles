# dotfiles

## How to deploy the files

From the repository root:

```shell
ln -f -s "$PWD/agents/AGENTS.md" "$HOME/.claude/CLAUDE.md"
ln -f -s "$PWD/agents/AGENTS.md" "$HOME/.gemini/GEMINI.md"
ln -f -s "$PWD/antigravity/ide/settings.json" "$HOME/Library/Application Support/Antigravity IDE/User/settings.json"
ln -f -s "$PWD/git/.gitconfig" "$HOME/.gitconfig"
ln -f -s "$PWD/shell/.zprofile" "$HOME/.zprofile"
ln -f -s "$PWD/shell/.zshrc" "$HOME/.zshrc"
```

The following files need no deployment:

- `shell/profiles/*.profile`: `.zshrc` sources them.
- `antigravity/cli/settings.json`: see [antigravity/README.md](antigravity/README.md).
