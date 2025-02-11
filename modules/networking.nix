{ config, pkgs, ... }:

{
  networking = {
    hostName = "nixos-alex";  # Nombre del host

    # Desactiva NetworkManager si configuras la red manualmente
    networkmanager.enable = false;

    interfaces.enp3s0 = {  # Cambia "enp3s0" por el nombre de tu interfaz de red
      useDHCP = false;  # Desactiva DHCP
      ipv4.addresses = [
        { address = "192.168.1.5"; prefixLength = 24; }  # IP estática
      ];
    };

    defaultGateway = "192.168.1.1";  # Puerta de enlace
    nameservers = [ "8.8.8.8" "1.1.1.1" ];  # Servidores DNS (Google y Cloudflare)
  };
}
