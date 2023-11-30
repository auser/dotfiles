if [ -d $HOME/.asdk  ]; then
#export PATH=~/.asdf/bin:$PATH
#. $HOME/.asdf/asdf.sh
# . $(brew --prefix asdf)/asdf.sh
fi

# curl https://rtx.pub/rtx-latest-macos-arm64 > ~/.bin/rtx
export PATH="$HOME/.local/share/rtx/shims:$PATH"
# eval "$($HOME/.bin/rtx activate zsh)"

eval "$(brew --prefix rtx) activate zsh)"
# chmod +x ~/.bin/rtx

export PATH="$HOME/.bin:$PATH"

