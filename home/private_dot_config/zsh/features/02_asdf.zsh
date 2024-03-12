export PATH="$HOME/.bin:$PATH"

# mise
if [[ -o interactive ]]; then
  eval "$(mise activate zsh)"
else
  eval "$(mise activate zsh --shims)"
fi
