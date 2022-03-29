{ config, lib, pkgs, ... }:


{
  # Home manager should manage itself
  programs.home-manager.enable = true;

  imports = [ ./imports.nix ];

  home = {
    ## Some personal info
    username = builtins.getEnv "USER";
    homeDirectory = builtins.getEnv "HOME";

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "22.05";

    packages = [
      pkgs.chezmoi
      pkgs.git
      pkgs.openssh
      pkgs.zsh
    ];
  };

  fonts.fontconfig.enable = true;

  services.lorri.enable = true;

  nixpkgs.config.allowUnfree = true;
}
