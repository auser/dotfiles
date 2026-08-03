# Install direnv's zsh hook only when direnv is available.
if (( $+commands[direnv] )); then
  eval "$(direnv hook zsh)"
fi
