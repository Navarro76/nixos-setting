{ config, pkgs, ... }:

{
  # Zona horaria
  time.timeZone = "America/Mexico_City";  # Cambia esto según tu zona horaria

  # Configuración de locales
  i18n.defaultLocale = "es_MX.UTF-8";  # Cambia esto según tu idioma

  i18n.extraLocaleSettings = {
    LC_TIME = "es_MX.UTF-8";
    LC_ALL = "es_MX.UTF-8";
  };

  # Layout del teclado (para TTY y Xorg)
  console.keyMap = "latam";  # Para TTY
  services.xserver = {
    layout = "latam";  # Para Xorg (BSPWM)
  };

  # Soporte para fuentes y renderizado de texto
  fonts = {
    enableDefaultPackages = true;
    fontconfig.defaultFonts = {
      monospace = [ "FiraCode Nerd Font" ];
      sansSerif = [ "Noto Sans" ];
      serif = [ "Noto Serif" ];
    };
  };
}
