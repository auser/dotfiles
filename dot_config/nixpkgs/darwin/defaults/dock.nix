{ pkgs, lib, config, ... };
{
  targets.darwin.defaults."com.apple.dock" = {
    autohide = true;
    launchanim = true;
  }
}
