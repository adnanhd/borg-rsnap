# Fish completions for rsnap (rsync backup script)

# Main subcommand completions with detailed descriptions:
complete -c rsnap -f -a "init" -d "Initialize repository: creates .myrsyncbackup and sets up backup storage (no snapshot is taken)."
complete -c rsnap -f -a "snapshot" -d "Take snapshot: create a new incremental backup using rsync."
complete -c rsnap -f -a "prune" -d "Purge snapshots: remove old snapshots. Options: --last, --first, --older, --newer, --all; interactive if no option."
complete -c rsnap -f -a "restore" -d "Restore snapshot: restore a snapshot to the current directory."
complete -c rsnap -f -a "log" -d "Display log: show a backup log file."
complete -c rsnap -f -a "list" -d "List snapshots: list all available backup snapshots."
complete -c rsnap -f -a "diff" -d "Diff snapshots: compare two snapshots; leave the first prompt empty for live state."
complete -c rsnap -f -a "size" -d "Size: display the size (du -sh) of a snapshot."

# Options for init and snapshot commands:
complete -c rsnap -n '__fish_seen_subcommand_from init snapshot' -a "--dry-run" -d "Simulate actions without making changes."
complete -c rsnap -n '__fish_seen_subcommand_from init snapshot' -a "--force-full" -d "Force a full snapshot (skip incremental linking)."
complete -c rsnap -n '__fish_seen_subcommand_from init snapshot' -a "--create" -d "Alias for --force-full."

# Options for the prune command:
complete -c rsnap -n '__fish_seen_subcommand_from prune' -a "--last" -d "Remove the newest X snapshots."
complete -c rsnap -n '__fish_seen_subcommand_from prune' -a "--first" -d "Remove the oldest X snapshots."
complete -c rsnap -n '__fish_seen_subcommand_from prune' -a "--older" -d "Remove snapshots older than X days."
complete -c rsnap -n '__fish_seen_subcommand_from prune' -a "--newer" -d "Remove snapshots newer than X days."
complete -c rsnap -n '__fish_seen_subcommand_from prune' -a "--all" -d "Remove all snapshots."
