{ config, pkgs, ... }:

{
  # Habilitar Xorg
  services.xserver = {
    enable = true;
    layout = "latam";  # Configuración de teclado para Xorg
    displayManager.lightdm.enable = true;  # Habilitar LightDM
    displayManager.defaultSession = "none+bspwm";  # Usar BSPWM
    windowManager.bspwm.enable = true;  # Habilitar BSPWM
  };

  # Instalar paquetes del entorno gráfico
  environment.systemPackages = with pkgs; [
    # BSPWM y herramientas
    bspwm sxhkd rofi picom polybar  
    xorg.xrandr xorg.xbacklight xorg.xinput xorg.xset
    lightdm lightdm-gtk-greeter
    lxappearance  # Herramienta para configurar temas GTK
    slim          # Gestor de sesión
    slimlock      # Bloqueo de pantalla

    # Tipografías y temas
    papirus-icon-theme
    arc-theme
    font-awesome
    nerdfonts
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
