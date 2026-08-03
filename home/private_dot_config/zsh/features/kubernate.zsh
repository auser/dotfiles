# kubernate completion is optional and only registered when the command exists.
if [[ -x /opt/homebrew/bin/kubernate ]]; then
  _kubernate_yargs_completions() {
    local reply
    local saved_ifs="$IFS"
    IFS=$'\n' reply=(
      $(COMP_CWORD="$((CURRENT - 1))" \
        COMP_LINE="$BUFFER" \
        COMP_POINT="$CURSOR" \
        /opt/homebrew/bin/kubernate --get-yargs-completions "${words[@]}")
    )
    IFS="$saved_ifs"
    _describe 'values' reply
  }
  compdef _kubernate_yargs_completions kubernate
fi
