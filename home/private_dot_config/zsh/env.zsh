# Static environment variables and small shell helpers.
# Keep this file quiet: it is sourced after Powerlevel10k instant prompt.

export EDITOR="${EDITOR:-nvim}"
export VISUAL="${VISUAL:-$EDITOR}"
export SUDO_EDITOR="${SUDO_EDITOR:-$EDITOR}"

# Optional tool-managed environment.
[[ -r "$HOME/.turso/env" ]] && source "$HOME/.turso/env"

function zed-omlx() {
  if (( ! $+commands[op] )); then
    print -u2 -- "zed-omlx: 1Password CLI (op) is not installed"
    return 127
  fi

  local omlx_api_key
  omlx_api_key="$(op item get "oMLX API key" --fields notesPlain)" || return
  OMLX_API_KEY="$omlx_api_key" open -a Zed
}
