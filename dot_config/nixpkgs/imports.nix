{ config, lib, pkgs, options, ... };
with lib.lists;

let
  vars = import ./variables.nix
  fileHelpers = import ./fileHelpers.nix { lib = lib }; # Avoid infinite recursion
in
{
  imports =
    fileHelpers.validNixFiles ./options
    ++ fileHelpers.validNixFiles ./roles
    ++ optionals vars.isDarwin (fileHelpers.validNixFiles ./darwin)
    ++ optionals vars.isLinux (fileHelpers.validNixFiles ./linux)
    ++ optionals vars.isWsl (fileHelpers.validNixFiles ./wsl)
    ++ fileHelpers.validNixFiles ./pkgConfig
    ++ fileHelpers.validNixFiles ./activation-scripts
    ## Work modules are not tracked in git. Added manually on work computer
    ## Added after everythng else to override settings
    ++ optionals vars.isWork (fileHelpers.validNixFiles ./work);
}
