# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/auser/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/auser/opt/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/auser/opt/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/auser/opt/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/auser/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/auser/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/auser/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/auser/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

