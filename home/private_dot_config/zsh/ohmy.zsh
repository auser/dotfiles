export ZSH="$HOME/.oh-my-zsh"

export ZSH_THEME="powerlevel10k/powerlevel10k"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Command execution time stamp shown in the history command output.
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyy-mm-dd"


plugins=(
    git
    docker
    vi-mode
    rust
    fzf
    tmux
    macos
    npm
    colored-man-pages
    kubectl
    minikube
    microk8s
    # pyenv
    python
    zsh-syntax-highlighting
    zsh-autosuggestions
    zsh-completions
)

zstyle ':omz:update' mode auto      # update automatically without asking
source $ZSH/oh-my-zsh.sh

