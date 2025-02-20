{ config, pkgs, ... }:

{
  # Configuración básica de Home Manager
  home.username = "alex";
  home.homeDirectory = "/home/alex";

  imports = [
    ./modules/xresources.nix
    ./modules/packages.nix
    ./modules/bspwm.nix
    #./modules/services.nix
    ./modules/sxhkd.nix
    ./modules/zsh.nix
    ./modules/git.nix
    ./modules/kitty.nix
    #./modules/wallpaper.nix
  ];

  #wallpaper.path = "/home/alex/Wallpaper/rosario_vampire.png";
  #wallpaper.path = "${builtins.getEnv "HOME"}/Wallpaper/rosario_vampire.png";
  #home.file."Wallpaper/rosario_vampire.png".source = ./wallpaper.png;

  home.stateVersion = "24.11";

  # Habilitar Home Manager
  programs.home-manager.enable = true;
}
