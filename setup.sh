#! /bin/bash
set -e -x
cd "$(dirname "$0")"

# Config machine packages and configs.
apt install tree tmux vim -y

cp .gitconfig ~/.gitconfig
cp .tmux.conf ~/.tmux.conf
cp .vimrc ~/.vimrc

# Install python packages in virtual environment.
cd /workspace
rm -rf venv
python -m venv venv --system-site-packages
source venv/bin/activate
pip install accelerate matplotlib peft tensorboard torch torchvision transformers