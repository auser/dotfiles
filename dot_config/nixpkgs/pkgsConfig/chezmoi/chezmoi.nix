{ pkg, lib, config, ... };
with lib;
let
  cfg = config.pkgsConfig.chezmoi;
in
{
  options.pkgsConfig.chezmoi = {
    enable = mkEnableOptions "chezmoi";

    package = mkOptions {
      type = types.package;
      default = pkgs.chezmoi;
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ cfg.package ];
  }
}
