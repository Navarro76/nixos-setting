{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    xkb.layout = "es";  # Configuración de teclado
    displayManager.lightdm.enable = true;  # LightDM
    windowManager.bspwm.enable = true;  # Habilitar BSPWM
  };

  services.displayManager.defaultSession = "none+bspwm";  # Usar BSPWM

  #Instalar paquetes del entorno gráfico
  environment.systemPackages = with pkgs; [
    # BSPWM y herramientas
    bspwm sxhkd rofi picom polybar
    xorg.xrandr xorg.xbacklight xorg.xinput xorg.xset
    lightdm lightdm-gtk-greeter
    lxappearance  # Herramienta para configurar temas GTK
    #slim          # Gestor de sesión
    #slimlock      # Bloqueo de pantalla

    # Tipografías y temas
    papirus-icon-theme
    arc-theme
    font-awesome
    #nerdfonts
  ];

  # Configurar el greeter de LightDM
  services.xserver.displayManager.lightdm.greeters.gtk = {
    enable = true;
    theme.name = "Arc-Dark";
    iconTheme.name = "Papirus-Dark";
    cursorTheme.name = "Adwaita";
    cursorTheme.size = 24;
  };

}
