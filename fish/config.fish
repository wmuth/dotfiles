# Go on path
fish_add_path -aPm /usr/local/go/bin/ ~/go/bin/

# Zoxide init
zoxide init fish | source

# Aliases
alias cat="bat"
alias ls="exa"
alias vim="nvim"

# Set vars
set EDITOR /usr/bin/nvim
set fish_color_autosuggestion 0x60

# Use vi mode
fish_vi_key_bindings

# Override greeting function
function fish_greeting
    random_greeting
end
