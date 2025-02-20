{ config, pkgs, ... }:

{
  # Habilitar zsh
  programs.zsh.enable = true;
  
  users.users.alex = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "networkmanager" "audio" "video"];
    shell = pkgs.zsh;
  };
}
