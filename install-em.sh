#!/usr/bin/env bash
# required due to mostly executing through ansible
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

# alacritty
mkdir -p ~/.config/alacritty/
cp $SCRIPT_DIR/alacritty.yml ~/.config/alacritty/alacritty.yml

# nvim
mkdir -p ~/.config/nvim/
rm -rf ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# tlp
cp $SCRIPT_DIR/tlp.conf ~/tlp.conf

# zsh, omz
rm -rf ~/.oh-my-zsh/
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
sed -ie 's/plugins=(git)/plugins=(\n    git\n    zsh-autosuggestions\n    zsh-syntax-highlighting\n      )/g' ~/.zshrc
sed -ie 's/ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc
cat $SCRIPT_DIR/zshrc.txt >> ~/.zshrc
