#!/usr/bin/env bash

# Bash completion script for Claude Code CLI

_claude_completions() {
    local cur prev opts commands
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    # Main commands
    commands="mcp plugin migrate-installer setup-token doctor update install"

    # All options
    opts="-d --debug --verbose -p --print --output-format --json-schema \
          --include-partial-messages --input-format --dangerously-skip-permissions \
          --allow-dangerously-skip-permissions --replay-user-messages \
          --allowedTools --allowed-tools --tools --disallowedTools --disallowed-tools \
          --mcp-config --system-prompt --append-system-prompt --permission-mode \
          -c --continue -r --resume --fork-session --model --fallback-model \
          --settings --add-dir --ide --strict-mcp-config --session-id \
          --agents --setting-sources --plugin-dir -v --version -h --help"

    # Handle completions based on previous word
    case "${prev}" in
        --model|--fallback-model)
            COMPREPLY=( $(compgen -W "sonnet opus haiku claude-sonnet-4-5-20250929 claude-opus-4-5-20251101" -- "${cur}") )
            return 0
            ;;
        --output-format)
            COMPREPLY=( $(compgen -W "text json stream-json" -- "${cur}") )
            return 0
            ;;
        --input-format)
            COMPREPLY=( $(compgen -W "text stream-json" -- "${cur}") )
            return 0
            ;;
        --permission-mode)
            COMPREPLY=( $(compgen -W "acceptEdits bypassPermissions default dontAsk plan" -- "${cur}") )
            return 0
            ;;
        --mcp-config|--settings|--add-dir|--plugin-dir)
            # File/directory completion
            COMPREPLY=( $(compgen -f -- "${cur}") )
            return 0
            ;;
        mcp)
            COMPREPLY=( $(compgen -W "add remove list serve" -- "${cur}") )
            return 0
            ;;
        plugin)
            COMPREPLY=( $(compgen -W "add remove list" -- "${cur}") )
            return 0
            ;;
        install)
            COMPREPLY=( $(compgen -W "stable latest" -- "${cur}") )
            return 0
            ;;
    esac

    # Handle current word
    if [[ "${cur}" == -* ]]; then
        # Complete options
        COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
        return 0
    fi

    # Check if we're completing a subcommand
    local i cmd_found=0
    for (( i=1; i < COMP_CWORD; i++ )); do
        case "${COMP_WORDS[i]}" in
            mcp|plugin|install)
                cmd_found=1
                break
                ;;
        esac
    done

    # If no subcommand found yet, offer commands
    if [[ $cmd_found -eq 0 ]]; then
        COMPREPLY=( $(compgen -W "${commands}" -- "${cur}") )
    fi

    return 0
}

complete -F _claude_completions claude
