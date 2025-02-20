{ config, lib, pkgs, ... }:

with lib;

{
  options.wallpaper = {
    path = mkOption {
      type = types.str;
      default = "";
      description = "Ruta al archivo de wallpaper";
    };
  };

  config = {
    home.file.".config/wallpaper.png".source = config.wallpaper.path;
  };
}
