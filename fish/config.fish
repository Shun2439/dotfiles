if status is-interactive
    # Commands to run in interactive sessions can go here
    /usr/bin/tmux
    /usr/bin/clear
end

alias nvim=/usr/bin/nvim.appimage

alias vim=/usr/bin/nvim.appimage

set fish_theme bobthefish 
set -g theme_powerline_fonts yes
set -g theme_color_scheme nord

set PATH ~/.cargo/bin $PATH

starship init fish | source
