
#######################################################################
# GOLANG
#######################################################################

export GOPATH="$HOME/go";
export GOROOT="$HOME/.go";
export PATH="$GOPATH/bin:$PATH";
# g-install: do NOT edit, see https://github.com/stefanmaric/g

#######################################################################
# Anaconda
#######################################################################

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/.asdf/installs/python/anaconda3-5.3.1/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/.asdf/installs/python/anaconda3-5.3.1/etc/profile.d/conda.sh" ]; then
        . "$HOME/.asdf/installs/python/anaconda3-5.3.1/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/.asdf/installs/python/anaconda3-5.3.1/bin:$PATH"
    fi
fi
unset __conda_setup

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/.anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/.anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/.anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/auser/.anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# <<< conda initialize <<<


if command -v pyenv 1>/dev/null 2>&1; then
    export PATH="~/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
fi

if which pyenv-virtualenv-init > /dev/null; then
  eval "$(pyenv virtualenv-init -)";
fi

#######################################################################
# Python poetry
#######################################################################
[ -f $HOME/.poetry/env ] && source $HOME/.poetry/env

#######################################################################
# RUST
#######################################################################
autoload -U is-at-least

#######################################################################
# FLUTTER
#######################################################################
export PATH=/home/auser/Development/flutter/mine/flutter/bin:$PATH

#######################################################################
# ELIXIR
#######################################################################
export PATH=$HOME/.mix/escripts:$PATH

#######################################################################
# NODE
#######################################################################
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


function change_node_version {
	nvmrc="./.node-version"
	if [ -f "$nvmrc" ]; then
		version="$(cat "$nvmrc")"
    nvm use $version
	fi
}

chpwd_functions=(change_node_version)

#######################################################################
# NIX
#######################################################################
#. /home/auser/.nix-profile/etc/profile.d/nix.sh

#######################################################################
# WASMER
#######################################################################
export WASMER_DIR="/home/auser/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

#######################################################################
# NODE
#######################################################################
export ANDROID=$HOME/work/android
export PATH=$ANDROID/cmdline-tools/bin:$PATH
export PATH=$ANDROID/flutter/bin:$PATH

# Android SDK
export ANDROID_SDK=$ANDROID
export PATH=$ANDROID_SDK:$PATH

# Flutter
export FLUTTER=$HOME/work/android/flutter
export PATH=$FLUTTER/bin:$PATH