if status is-interactive
    # Commands to run in interactive sessions can go here
end
# https://gist.github.com/gagarine/cf3f65f9be6aa0e105b184376f765262
set -U fish_user_paths /opt/homebrew/bin $fish_user_paths
set -g fish_complete_path $fish_complete_path /opt/homebrew/share/fish/vendor_completions.d
starship init fish | source

