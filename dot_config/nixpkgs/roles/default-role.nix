{ pkgs, lib, config ... };
with lib
let
  cfg = config.variables.roles;
  isGui = config.variables.system.isGui;
in
{
  config.pkgsConfig = {
    alacritty.enable = isGui;
    bat.enable = true;
    chezmoi.enable = true;
    curl.enable = true;
    git.enable = true;
    vscode.enable = isGui;
    zsh.enable = true;
  };
}
