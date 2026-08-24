# Initialize Nix's multi-user environment when it is installed.
if [[ -r /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]]; then
  source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
fi

# `nix profile add` has used both legacy and XDG-based per-user profile
# locations. Add every existing layout so newly installed commands are visible
# in interactive shells without depending on one Nix configuration mode.
typeset -gaU path
typeset -a _nix_profile_paths
_nix_state_home="${XDG_STATE_HOME:-$HOME/.local/state}"
for _dir in \
  "$_nix_state_home/nix/profile/bin" \
  "$_nix_state_home/nix/profiles/profile/bin" \
  "$HOME/.nix-profile/bin"
do
  [[ -d "$_dir" ]] && _nix_profile_paths+=("$_dir")
done
path=("${_nix_profile_paths[@]}" "${path[@]}")
export PATH
unset _dir _nix_profile_paths _nix_state_home
