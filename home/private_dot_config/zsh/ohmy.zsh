export ZSH="$HOME/.oh-my-zsh"

# Use Powerlevel10k theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Command execution time stamp shown in the history command output.
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Load plugins
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
)

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Load additional plugins manually
if [ -f "$HOME/.zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    source "$HOME/.zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

if [ -f "$HOME/.zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
    source "$HOME/.zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

