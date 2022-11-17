
#######################################################################
# GOLANG
#######################################################################

export GOPATH="$HOME/go"; export GOROOT="$HOME/.go"; export PATH="$GOPATH/bin:$PATH"; # g-install: do NOT edit, see https://github.com/stefanmaric/g
alias gogo="$GOPATH/bin/g"; # g-install: do NOT edit, see https://github.com/stefanmaric/g
# g-install: do NOT edit, see https://github.com/stefanmaric/g

#######################################################################
# Anaconda
#######################################################################

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

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
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/drew/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# compinstall
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit


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

export JAVA_HOME=$(/usr/libexec/java_home)
export ANDROID_HOME=$HOME/Library/Android/sdk

export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH":"$HOME/fvm/default/bin"
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
