{ config, pkgs, ... }:

{
  users.users.alex = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "networkmanager" "audio" "video"];
    shell = pkgs.bash;
  };
}
