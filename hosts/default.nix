{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix    # Configuración de hardware
    ../modules/system.nix            # Timezone, locales, etc.
    ../modules/bspwm.nix             # Configuración gráfica (bspwm, polybar, etc.)
    ../modules/networking.nix        # Configuración de red
    ../modules/user-alex.nix         # Configuración del usuario alex
    ../modules/system-packages.nix   # Paquetes del sistema
    ../modules/docker.nix            # Configuración de Docker
    ../modules/samba.nix             # Configuración de Samba
    ../modules/ssh.nix               # Configuración de SSH
    ../modules/firewall.nix          # Configuración de Samba
    ../modules/hardware/amd.nix     # Importar configuración de AMD
  ];

  # Habilitar flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Nombre del sistema
  networking.hostName = "nixos-alex";

  # Versión del sistema
  system.stateVersion = "23.11";
}
