#! /bin/bash
set -e -x
cd "$(dirname "$0")"

# Parent repo root (one level above common/).
PARENT_DIR="$(cd .. && pwd)"

# Apply git hook to the parent repo.
mkdir -p "$PARENT_DIR/.githooks"
cp .githooks/pre-commit "$PARENT_DIR/.githooks/pre-commit"
chmod +x "$PARENT_DIR/.githooks/pre-commit"
git -C "$PARENT_DIR" config core.hooksPath .githooks

# Apply system configs.
cp .gitconfig ~/.gitconfig
cp .tmux.conf ~/.tmux.conf
cp .vimrc ~/.vimrc

# Apply pep8 and ruff configs to the parent folder.
cp .pep8 "$PARENT_DIR/.pep8"
cp .ruff.toml "$PARENT_DIR/.ruff.toml"

# Install python packages in virtual environment.
# Create ~/venv if it doesn't exist, then install requirements.
if [ ! -d ~/venv ]; then
  python3 -m venv ~/venv
fi
source ~/venv/bin/activate
pip install -r "$PARENT_DIR/requirements.txt"
