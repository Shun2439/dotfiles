if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source


eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

source "$HOME/.cargo/env.fish"

export GPG_TTY=$(tty)

alias ls='eza'

