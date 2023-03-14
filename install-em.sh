#!/usr/bin/env bash
# required due to mostly executing through ansible
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# alacritty
mkdir -p ~/.config/alacritty/
cp $SCRIPT_DIR/alacritty.yml ~/.config/alacritty/alacritty.yml

# lazygit

# nvim

# tmux

# vscodum

# zsh
