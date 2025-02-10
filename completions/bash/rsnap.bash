#!/bin/bash
# Bash completion for rsnap (rsync backup script)

_rsnap() {
    local cur prev subcommands opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    
    # Define the list of subcommands.
    subcommands="init snapshot prune restore log list diff size"
    
    if [ $COMP_CWORD -eq 1 ]; then
        COMPREPLY=( $(compgen -W "$subcommands" -- "$cur") )
        return 0
    fi
    
    # Provide extra options for some subcommands.
    case "${COMP_WORDS[1]}" in
        init|snapshot)
            opts="--dry-run --force-full --create"
            ;;
        prune)
            opts="--last --first --older --newer --all"
            ;;
        *)
            opts=""
            ;;
    esac
    
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
    return 0
}

complete -F _rsnap rsnap
