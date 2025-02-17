{ config, pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
    enableNvidia = false; # Cambia a true si usas NVIDIA
    daemon.settings = {
      data-root = "/var/lib/docker";
      storage-driver = "overlay2";
    };
  };

  users.users.alex.extraGroups = [ "docker" ];  # Agregar al usuario alex al grupo docker
}
