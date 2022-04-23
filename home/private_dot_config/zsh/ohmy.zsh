export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
    git
 git-extras 
 docker 
 vi-mode 
 marked2
 rust
 fzf 
 emoji
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