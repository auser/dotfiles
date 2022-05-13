export ZSH="$HOME/.oh-my-zsh"

#export ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
 docker
 vi-mode
 rust
 fzf
 tmux
 macos
 python
 npm
 pyenv
 colored-man-pages
)

zstyle ':omz:update' mode auto
ZSH_DISABLE_COMPFIX=true
source $ZSH/oh-my-zsh.sh

