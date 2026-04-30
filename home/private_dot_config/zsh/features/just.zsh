# Init Homebrew environment variables
eval "$(brew shellenv)"

# Add Homebrew's site-functions to fpath for completions
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

# Source oh-my-zsh (if used) to trigger compinit
source $ZSH/oh-my-zsh.sh   