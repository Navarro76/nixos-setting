{ config, pkgs, ... }:

{
  networking.firewall = {
    enable = true;          # Habilita el firewall
    allowedTCPPorts = [ 22 80 443 ];  # Abre los puertos para SSH, HTTP y HTTPS
    allowedUDPPorts = [ ];  # No abrir puertos UDP por defecto
    rejectPackets = true;   # Rechaza conexiones no permitidas en lugar de descartarlas
  };
}
