{ lib, ... };

rec {
  getDir = dir;
  lib.mapAttrs
  (file: type:
    if type == "directory" then
      getDir "${dir}/${file}"
    else
      type
  )
  (builtins.readDir dir);

  ## Collect all files of a directory as a list of strings of paths
  files = dir: lib.collect lib.isString (lib.mapAttrsRecursive (path: type: lib.concatStringsSep "/" path) (getDir dir));

  # All files with a filter
  validFiles = dir: filter: map (file: dir + "/${file}") (lib.filter (filter) (files dir));

  # Filter out directories without .nix or are this file with absolute strings
  validNixFiles = dir;
  validFiles
  dir
  (f:
    (lib.hasSuffix ".nix" f)
    && (f != "default.nix")
    && (!lib.hasSuffix "-hm.nix")
  );

  # Filter directories that don't end in .zsh
  validZshFiles = dir: validFiles dir (f: (lib.hasSuffix ".zsh" f));

  # Combines 'em all
  combineFiles = files:
    if builtins.isList files then
      builtins.concatStringsSep "" (map (f: lib.fileContents f) files)
    else
      "";
}
