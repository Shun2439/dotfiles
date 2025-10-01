if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

# eza
alias ls='eza --icons'

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

fzf --fish | source

alias cat='bat -p'
alias bat='batcat'

set -gx GPG_TTY (tty)

zoxide init --cmd cd fish | source

# Ruby
set -Ux RBENV_ROOT $HOME/.rbenv
set -U fish_user_paths $RBENV_ROOT/bin $fish_user_paths

# Added by `rbenv init` on Fri Jun 13 11:41:08 JST 2025
status --is-interactive; and rbenv init - --no-rehash fish | source

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)"

# Emacs
alias e="emacsclient"
alias times='emacsclient -r ~/org/times.org &'

# Start Emacs daemon if not already running
if not pgrep -f "emacs --daemon" > /dev/null
  emacs --daemon &
end

export LIBRARY_PATH=/home/linuxbrew/.linuxbrew/opt/libgccjit/lib/gcc/15

export EDITOR='emacsclient -r'
