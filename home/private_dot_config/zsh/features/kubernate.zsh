#compdef kubernate
###-begin-kubernate-completions-###
#
# yargs command completion script
#
# Installation: /opt/homebrew/bin/kubernate completion >> ~/.zshrc
#    or /opt/homebrew/bin/kubernate completion >> ~/.zprofile on OSX.
#
_kubernate_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" /opt/homebrew/bin/kubernate --get-yargs-completions "${words[@]}"))
  IFS=$si
  _describe 'values' reply
}
compdef _kubernate_yargs_completions kubernate
###-end-kubernate-completions-###
# TODO: move this
fpath=($fpath ~/.zsh/completion)
