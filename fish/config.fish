fish_add_path -aPm /usr/local/go/bin/ ~/go/bin/

zoxide init fish | source

alias cat="bat"
alias ls="exa"
alias vim="nvim"

set EDITOR /usr/bin/nvim
set fish_color_autosuggestion 0x60
set fish_vi_key_bindings

function fish_greeting
    random_greeting
end
