# Configure Jump
status --is-interactive; and source (jump shell fish | psub)

# Load all saved ssh keys
/usr/bin/ssh-add --apple-load-keychain ^/dev/null

# Fish syntax highlighting
set -g fish_color_autosuggestion '555'  'brblack'
set -g fish_color_cancel -r
set -g fish_color_command --bold
set -g fish_color_comment red
set -g fish_color_cwd green
set -g fish_color_cwd_root red
set -g fish_color_end brmagenta
set -g fish_color_error brred
set -g fish_color_escape 'bryellow'  '--bold'
set -g fish_color_history_current --bold
set -g fish_color_host normal
set -g fish_color_match --background=brblue
set -g fish_color_normal normal
set -g fish_color_operator bryellow
set -g fish_color_param cyan
set -g fish_color_quote yellow
set -g fish_color_redirection brblue
set -g fish_color_search_match 'bryellow'  '--background=brblack'
set -g fish_color_selection 'white'  '--bold'  '--background=brblack'
set -g fish_color_user brgreen
set -g fish_color_valid_path --underline

# https://gist.github.com/gagarine/cf3f65f9be6aa0e105b184376f765262
set -U fish_user_paths /opt/homebrew/bin $fish_user_paths
set -g fish_complete_path $fish_complete_path /opt/homebrew/share/fish/vendor_completions.d

set -Ux fifc_editor "nvim"

# Conda
#conda init fish

# Install Starship
starship init fish | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /opt/homebrew/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
