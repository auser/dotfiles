export ZSH="$HOME/.oh-my-zsh"

export ZSH_THEME="robbyrussell"

plugins=(
    git
 git-extras
 docker
 vi-mode
 marked2
 rust
 fzf
 dotenv
 tmux
 macos
 python
 npm
 pip
 pyenv
 colored-man-pages
)

zstyle ':omz:update' mode auto
ZSH_DISABLE_COMPFIX=true
source $ZSH/oh-my-zsh.sh

