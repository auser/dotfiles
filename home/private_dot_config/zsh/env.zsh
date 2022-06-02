# Setting and editing of env variables.

# Vars
export EDITOR='nvim'
export SUDO_EDITOR='nvim'

# PATH
if command -v pyenv 1>/dev/null 2>&1; then
    export PATH="~/.pyenv/bin:$PATH"
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
fi

export PATH="/opt/homebrew/bin:$PATH"
export PATH=$PATH:~/.emacs.d/bin
export PATH=$PATH:~/.dotfiles/bin # Scripts & utilities
export PATH=$PATH:~/.cargo/bin # Rust
export GOPATH="$(go env GOPATH)" # Go
export PATH="$PATH:$GOPATH/bin" # Go

export PATH=$PATH:./node_modules/.bin


# TODO: remove? ask on nix irc or nix darwin
# . ~/.nix-profile/etc/profile.d/hm-session-vars.sh

# eval "$(hub alias -s)"

# TODO: change my pure prompt if I am in direnv env
# look at the existing prompt and use below function as it returns needed info
has_direnv() { if [[ -n $DIRENV_DIFF ]]; then echo in direnv; else echo not; fi }

typeset -U PATH # Remove duplicates in $PATH
