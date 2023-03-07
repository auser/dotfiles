# Setting and editing of env variables.

# Vars
export EDITOR='nvim'
export SUDO_EDITOR='nvim'

# PATH
# if command -v pyenv 1>/dev/null 2>&1; then
#     export PATH="~/.pyenv/bin:$PATH"
#     export PYENV_ROOT="$HOME/.pyenv"
#     export PATH="$PYENV_ROOT/bin:$PATH"
#     eval "$(pyenv init --path)"
# fi

# if command -v pyenv-virtualenv &>/dev/null; then
#     eval "$(pyenv virtualenv-init -)"
# fi


export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# place this after nvm initialization!
eval "$(nodenv init -)"

export PNPM_HOME="/Users/auser/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
export PATH=~/.mix/escripts:$PATH

# ASDF
. $(brew --prefix asdf)/libexec/asdf.sh
