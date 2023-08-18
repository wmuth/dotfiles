#!/usr/bin/env bash
# required due to mostly executing through ansible
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

# load settings, default all true
. ./settings.cfg

if $alacritty; then
	mkdir -p ~/.config/alacritty/
	cp $SCRIPT_DIR/alacritty.yml ~/.config/alacritty/alacritty.yml
fi

if $nvim; then
	mkdir -p ~/.config/nvim/
	rm -rf ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim
	git clone https://github.com/LazyVim/starter ~/.config/nvim
	rm -rf ~/.config/nvim/.git
fi

if $tlp; then
	# this has to be chown root etc, so just move to somewhere user has to see it
	cp $SCRIPT_DIR/tlp.conf ~/tlp.conf
fi

if $zsh; then
	rm -rf ~/.oh-my-zsh/
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

	sed -ie 's/plugins=(git)/plugins=(\n    git\n    zsh-autosuggestions\n    zsh-syntax-highlighting\n      )/g' ~/.zshrc
	sed -ie 's/ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc
	cat $SCRIPT_DIR/zshrc.txt >>~/.zshrc
fi
