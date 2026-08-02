# Common Setup

`common/` is a self-contained repo (soon to be a git submodule) that holds shared
config files and setup scripts. `setup.sh` applies these files to the parent repo
and to your system.

Run the following script to apply the common configs:

```
./setup.sh
```

It does the following:

* Copies `common/.githooks/pre-commit` to `.githooks/pre-commit` (the parent repo's git hook), makes it executable, and registers it via `core.hooksPath`.
* Copies `common/.gitconfig` to `~/.gitconfig` (same for `.tmux.conf` and `.vimrc`).
* Copies `common/.pep8` to `.pep8` in the parent folder.
* Copies `common/.ruff.toml` to `.ruff.toml` in the parent folder.
* Creates `~/venv` if needed and installs the parent repo's `requirements.txt`.
