if status is-interactive
    /usr/bin/tmux
    /usr/bin/clear
end

alias nvim=/usr/bin/nvim.appimage
alias vim=/usr/bin/nvim.appimage

set -g theme_powerline_fonts yes

set PATH ~/.cargo/bin $PATH

starship init fish | source
