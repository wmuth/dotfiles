#!/usr/bin/env bash
# required due to mostly executing through ansible
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

# alacritty
mkdir -p ~/.config/alacritty/
cp $SCRIPT_DIR/alacritty.yml ~/.config/alacritty/alacritty.yml

# nvim
mkdir -p ~/.config/nvim/
#rm -rf ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim
#git clone https://github.com/LazyVim/starter ~/.config/nvim
#rm -rf ~/.config/nvim/.git

# tlp
cp $SCRIPT_DIR/tlp.conf ~/tlp.conf

# zsh, omz
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
sed -ie 's/plugins=(git)/plugins=(\n      git\n    zsh-autosuggestions\n    zsh-syntax-highlighting\n    )/g' ~/.zshrc
cat $SCRIPT_DIR/zshrc.txt >>~/.zshrc
