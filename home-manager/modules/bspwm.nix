{ config, pkgs, ... }:

{

  home.packages = [
    (pkgs.writeShellScriptBin "launch-polybar" ''
      #!/bin/sh
      $HOME/polybar-collection/launch.sh
    '')
  ];

  home.file.".config/bspwm/bspwmrc".text = ''
    # Establecer el wallpaper
    

    # Configuración de bspwm
    # bspc monitor -d I II III IV V VI VII VIII IX X
    ( sleep 3 && bspc monitor -d 1 2 3 4 5 6 7 8 9 0 )

    bspc config border_width         2
    bspc config window_gap          12

    bspc config automatic_scheme longest_side
    bspc config split_ratio          0.52
    bspc config borderless_monocle   true
    bspc config gapless_monocle      true

    bspc config border_width         1
    bspc config focused_border_color "#61afef"

    # RESOLUCION ARANDR
    xrandr -s 1920x1080 & 

    # Ejecutar Polybar
    launch-polybar &

    # POLYBAR
    #/home/alex/polybar-collection/launch.sh &
  '';
}
