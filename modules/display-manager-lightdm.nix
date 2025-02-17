# modules/display-manager-lightdm.nix
{ config, pkgs, ... }:

{
  services.xserver.displayManager.lightdm.enable = true;

  # Configurar el greeter de LightDM
  services.xserver.displayManager.lightdm.greeters.gtk = {
    enable = true;
    theme.name = "Arc-Dark";  # Tema del greeter
    iconTheme.name = "Papirus-Dark";  # Tema de iconos
    cursorTheme.name = "Adwaita";  # Tema del cursor
    cursorTheme.size = 24;  # Tamaño del cursor
  };
}
