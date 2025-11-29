# Claude Code Zsh Completion

Zsh tab completion for [Claude Code](https://docs.anthropic.com/en/docs/claude-code) CLI.

## Features

This completion script provides tab completion for:

- **Commands**: `mcp`, `plugin`, `update`, `doctor`, `install`, `setup-token`, `migrate-installer`
- **Flags**: All CLI flags including `--print`, `--model`, `--continue`, `--resume`, and more
- **Model options**: `sonnet`, `opus`, `haiku` (plus full model names)
- **Output formats**: `text`, `json`, `stream-json`
- **Permission modes**: `acceptEdits`, `bypassPermissions`, `default`, `dontAsk`, `plan`
- **Subcommand options**: Completions for `mcp`, `plugin`, and `install` subcommands

## Installation

### Quick Install (one-liner)

```bash
mkdir -p ~/.zsh/completion && curl -fsSL https://raw.githubusercontent.com/enekui/claude-code-zsh-completion/main/_claude -o ~/.zsh/completion/_claude && echo 'fpath=(~/.zsh/completion $fpath)' >> ~/.zshrc && echo 'autoload -Uz compinit && compinit' >> ~/.zshrc && exec zsh
```

### Manual Installation

1. Create the completion directory (if it doesn't exist):

```bash
mkdir -p ~/.zsh/completion
```

2. Download the completion script:

```bash
curl -fsSL https://raw.githubusercontent.com/enekui/claude-code-zsh-completion/main/_claude -o ~/.zsh/completion/_claude
```

3. Add the following to your `~/.zshrc` (if not already present):

```bash
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit
```

4. Reload your shell:

```bash
exec zsh
```

## Usage

After installation, you can use tab completion with the `claude` command:

```bash
# Show available subcommands
claude <TAB>

# Show all flags
claude --<TAB>

# Complete model options
claude --model <TAB>

# Complete output format options
claude --output-format <TAB>

# Complete permission mode options  
claude --permission-mode <TAB>

# Complete MCP subcommands
claude mcp <TAB>
```

## Updating

To update to the latest version:

```bash
curl -fsSL https://raw.githubusercontent.com/enekui/claude-code-zsh-completion/main/_claude -o ~/.zsh/completion/_claude && exec zsh
```

## Contributing

Contributions are welcome! If Claude Code adds new commands or flags, feel free to open a PR to update the completion script.

## License

MIT License - feel free to use, modify, and distribute.
