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
  console.keyMap = "es";  # Para TTY
  #services.xserver.xkb = {
  #  layout = "es";  # Para Xorg (BSPWM)
  #};
 
  services.xserver.xkb.layout = "es";

  # Soporte para fuentes y renderizado de texto
  fonts = {
    enableDefaultPackages = true;
    fontconfig.defaultFonts = {
      monospace = [ "FiraCode Nerd Font" ];
      sansSerif = [ "Noto Sans" ];
      serif = [ "Noto Serif" ];
    };
  };

  #NEW
  fonts.packages = with pkgs; [
    #nerd-fonts.hack
  ];

  #NEW
  # Asegúrate de que fcitx5 esté habilitado en tu configuración
  #i18n.inputMethod = {
  #  enabled = "fcitx5";
  #  fcitx5.enable = true;
  #  fcitx5.addons = with pkgs; [
  #    fcitx5-googlepinyin
  #    fcitx5-qt
  #    fcitx5-configtool
  #  ];
  #};

  #boot.loader.grub = {
  #  enable = true;
  #  efiSupport = true;
  #  device = "/dev/sda"; # Cambia "/dev/sdX" por el disco donde instalarás GRUB, como "/dev/sda"
  #  #useOSProber = true;  # Opcional, útil si tienes otro sistema operativo instalado (dual boot)
  #};

  #boot.loader.timeout = 5; # Tiempo en segundos antes de arrancar automáticamente

  # Asegurar que el sistema es UEFI si es necesario
  # boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.systemd-boot = {
    enable = true;
  };  

  boot.loader.efi.canTouchEfiVariables = true;
}
