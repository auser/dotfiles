# Activate mise once for interactive shells.
if (( $+commands[mise] )); then
  eval "$(mise activate zsh)"
fi
