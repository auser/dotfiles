{ config, pkgs, ... }:

{
  # Global Packages. Non nix installed packages can be seen:
  # https://github.com/nikitavoloboev/dotfiles/blob/master/.install.conf.yaml#L17
  environment.systemPackages =
    [
      # tools
      pkgs.git
      pkgs.neovim
      pkgs.vim
      pkgs.ffmpeg

      pkgs.antibody
      pkgs.gitAndTools.diff-so-fancy
      pkgs.direnv
      pkgs.wget
      pkgs.jq
      pkgs.tree
      pkgs.cmake
      pkgs.python2Full
      pkgs.python38Full

      pkgs.texlive.combined.scheme-full
      pkgs.nix
      pkgs.wifi-password
    ];


  # TODO: remove & test more
  # nixpkgs.overlays = [(import ../../src/clones/overlay-example/overlay.nix)];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;
  programs.zsh.enableCompletion = true;

  programs.zsh.enable = true;
  programs.zsh.promptInit = "";
  nix.nixPath = [
    "darwin-config=$HOME/.dotfiles/nix/darwin.nix"
    "nixpkgs=$HOME/src/clones/nixpkgs"
    "$HOME/.nix-defexpr/channels"
  ];
  # Extend PATH
    environment.systemPath = [ "/usr/local/go/bin:/usr/local/MacGPG2/bin" ];

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 3;

  # Generally set to total number of logical cores on the system. $(sysctl -n hw.ncpu)
  nix.maxJobs = 12;
  # Can cause instability in builds if more than 1
  nix.buildCores = 1;

  # TODO: create ~/.hushlogin file to supress login msg on new terminal sessions
}
