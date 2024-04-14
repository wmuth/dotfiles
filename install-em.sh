#!/usr/bin/env bash
# Get script dir
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

# Load settings
. $SCRIPT_DIR/settings.cfg

if $alacritty; then
	# Overwrite current settings
	sed -i "/size = /d" $SCRIPT_DIR/alacritty.toml
	sed -i "/family = /d" $SCRIPT_DIR/alacritty.toml
	sed -i "/program = /d" $SCRIPT_DIR/alacritty.toml
	sed -i "/args = /d" $SCRIPT_DIR/alacritty.toml

	# Place new settings
	sed -i "/\[font\]/a\size = $font_size" $SCRIPT_DIR/alacritty.toml
	sed -i "/\[font\..*\]/a\family = \"$font_name\"" $SCRIPT_DIR/alacritty.toml
	sed -i "/\[shell\]/a\program = \"$shell\"" $SCRIPT_DIR/alacritty.toml
	sed -i "/\[shell\]/a\args = \['-l', '-c', '/home/$USER/.cargo/bin/zellij'\]" $SCRIPT_DIR/alacritty.toml

	# Make sure dir exists and copy file
	mkdir -p /home/$USER/.config/alacritty/
	cp $SCRIPT_DIR/alacritty.toml /home/$USER/.config/alacritty/alacritty.toml
fi

if $fish; then
	# Make sure path exists
	mkdir -p /home/$USER/.config/fish/

	# Create tide dir download, fish extract and run
	mkdir -p /tmp/tide
	curl https://codeload.github.com/ilancosman/tide/tar.gz/v6 | tar -xzC /tmp/tide
	/usr/bin/fish -c 'command cp -R /tmp/tide/*/{completions,conf.d,functions} $__fish_config_dir'
	/usr/bin/fish -C "emit _tide_init_install; exit"
	rm -rf /tmp/tide

	# Copy files
	cp $SCRIPT_DIR/fish/config.fish /home/$USER/.config/fish/config.fish
	cp $SCRIPT_DIR/fish/random_greeting.fish /home/$USER/.config/fish/functions/random_greeting.fish
fi

if $keyd; then
	# Check if root
	if [ "$EUID" -ne 0 ]; then
		echo "Script does not have root permisison, will need to copy keyd conf"

		# Prepare dir and place file
		sudo mkdir -p /etc/keyd/
		sudo cp $SCRIPT_DIR/keyd.conf /etc/keyd/default.conf

	else
		mkdir -p /etc/keyd/
		cp $SCRIPT_DIR/keyd.conf /etc/keyd/default.conf
	fi
fi

if $nvim; then
	# Remove previous backup
	rm -rf ~/.cache/nvim.bak/
	rm -rf ~/.config/nvim.bak/
	rm -rf ~/.local/share/nvim.bak/
	rm -rf ~/.local/state/nvim.bak/

	# Backup current nvim - ignore if file not exists
	mv ~/.cache/nvim{,.bak} 2>/dev/null
	mv ~/.config/nvim{,.bak} 2>/dev/null
	mv ~/.local/share/nvim{,.bak} 2>/dev/null
	mv ~/.local/state/nvim{,.bak} 2>/dev/null

	# Move in new config
	mkdir -p /home/$USER/.config/nvim/
	cp $SCRIPT_DIR/nvim/nvim.lua /home/$USER/.config/nvim/init.lua
	cp $SCRIPT_DIR/nvim/stylua.toml /home/$USER/.config/nvim/stylua.toml

	# Launch for first config
	nvim
fi
