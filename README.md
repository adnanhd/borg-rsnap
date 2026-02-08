# backuplib

Shared shell library for [dedupctl](https://github.com/adnanhd/dedupctl) and [hlinkctl](https://github.com/adnanhd/hlinkctl). Provides common utilities and tool-agnostic prune logic used by both backup tools.

## Files

- **common.sh** - Shared utility functions (error handling, config loading, interactive selection, cleanup traps, exclude parameter building, timestamp parsing)
- **prune.sh** - Tool-agnostic prune framework with interactive and option-based modes (`--last`, `--first`, `--older`, `--newer`, `--all`)

## Usage

This library is intended to be used as a git submodule:

```sh
git submodule add git@github.com:adnanhd/borg-rsnap.git lib
```

Then source the files from your scripts:

```sh
source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/lib/prune.sh"
```

## common.sh

Provides:

- **Exit codes** - `EXIT_SUCCESS`, `EXIT_ERROR`, `EXIT_INVALID_ARGS`, `EXIT_CONFIG_ERROR`, `EXIT_OPERATION_FAILED`
- **`die`** / **`warn`** - Error and warning output to stderr
- **`find_repo_root`** / **`find_parent_repo`** - Walk up the directory tree to locate config files
- **`require_config`** - Source a config file and validate required variables
- **`select_from_list`** / **`select_multiple_from_list`** - Interactive numbered selection menus
- **`build_exclude_params`** - Build `--exclude` flags for borg or rsync
- **`parse_timestamp`** - Convert backup timestamp strings to epoch seconds
- **`register_cleanup`** / **`run_cleanup`** / **`setup_cleanup_trap`** - Temp file/dir cleanup via EXIT trap
- **`confirm_action`** - Yes/no user confirmation prompt
- **`validate_positive_int`** - Input validation

## prune.sh

A callback-based prune framework. Define these before calling `run_prune`:

- **`list_items`** - Populate the `PRUNE_ITEMS` array
- **`delete_item`** - Delete a single item
- **`format_item`** - Format an item for display

Set `ITEM_TYPE` and `ITEM_TYPE_PLURAL` (e.g., "archive"/"archives" or "snapshot"/"snapshots"), then call:

```sh
run_prune "$@"
```

Supported modes: `--last N`, `--first N`, `--older N` (days), `--newer N` (days), `--all`, or interactive (default).

## Related Projects

- [dedupctl](https://github.com/adnanhd/dedupctl) - BorgBackup repository management
- [hlinkctl](https://github.com/adnanhd/hlinkctl) - Rsync hard-link snapshot management
