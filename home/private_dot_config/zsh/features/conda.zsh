# Conda is optional. Prefer an existing PATH entry, then check common installs.
_conda_exe="$(command -v conda 2>/dev/null)" || _conda_exe=""
if [[ -z "$_conda_exe" ]]; then
  for _candidate in \
    /opt/homebrew/Caskroom/miniforge/base/bin/conda \
    "$HOME/miniforge3/bin/conda" \
    "$HOME/mambaforge/bin/conda" \
    "$HOME/anaconda3/bin/conda"
  do
    if [[ -x "$_candidate" ]]; then
      _conda_exe="$_candidate"
      break
    fi
  done
fi

if [[ -x "$_conda_exe" ]]; then
  __conda_setup="$("$_conda_exe" shell.zsh hook 2>/dev/null)" || __conda_setup=""
  [[ -n "$__conda_setup" ]] && eval "$__conda_setup"
  unset __conda_setup
fi
unset _candidate _conda_exe
