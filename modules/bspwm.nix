{ config, pkgs, ... }:

{
  # Habilitar Xorg
  services = {
    xserver = {
      enable = true;
      resolutions = [
        { x = 1920; y = 1080; }  # Resolución deseada
      ];
      monitorSection = ''
        Option "PreferredMode" "1920x1080"
      '';
      xkb.layout = "es";  # Configuración de teclado para Xorg
      displayManager.lightdm.enable = true;  # Habilitar LightDM
      windowManager.bspwm = {
        enable = true;  # Habilitar BSPWM
        configFile = pkgs.writeText "bspwmrc" ''
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
          xrandr -s 1920x1080  

          # WALLPAPER
          feh --bg-scale ~/Wallpaper/rosario_vampire.png
        '';
        sxhkd.configFile = pkgs.writeText "sxhkdrc" ''
          # ================
          # APPS
          # ================

          mod4 + BackSpace
              notify-send -u low "Status" "BSPWM is running"

          # Terminal emulator
          mod4 + Return
              cd && kitty

          # Browser
          mod4 + shift + w
              firefox

          # App launcher
          mod4 + d
              cd && zsh -c "rofi -show run"

          # Music hotkeys
          XF86Audio{Play,Prev,Next}
              playerctl {pause, previous, next}

          # Brightness control
          XF86MonBrightness{Down,Up}
              brightnessctl s {5%-, 5%+}

          # ================
          # BSPWM FUNCTIONS
          # ================

          # Windows
          # ------------
          # Close window
          mod4 + shift + q
              bspc node -c

          # Focus window
          mod4 + {Left, Down, Up, Right}
              bspc node -f {west,south,north,east}

          # Focus window by prev/next
          mod4 + {_,shift + }c
              bspc node -f {next,prev}.local

          # Move window
          mod4 + shift + {Left, Down, Up, Right}
              bspc node -v {west,south,north,east}

          # Resize window by moving bounds out
          mod4 + alt + {Left, Down, Up, Right}
              bspc node -z {left -20 0,down 20 0,top 0 -20,right 20 0}

          # Resize window by moving bounds in
          mod4 + alt + shift + {Left, Down, Up, Right}
              bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0}

          # Desktops
          # ------------
          # Focus the given desktop
          mod4 + {1-9,0}
              bspc desktop -f '^{1-9,10}'

          # Send focused window to given desktop
          mod4 + shift + {1-9,0}
              bspc node -d '^{1-9,10}'

          # Toggle monocle layout
          mod4 + m
              bspc desktop -l next

          # ================
          # SYSTEM
          # ================

          # Reconfigure sxhkd
          mod4 + shift + r
              pkill -USR1 -x sxhkd

          # Volume
          {XF86AudioMute,XF86AudioLowerVolume,XF86AudioRaiseVolume}
              amixer -D pulse sset Master {toggle,5%-,5%+}
        '';
      };
    };
    displayManager.defaultSession = "none+bspwm";  # Usar BSPWM
  };

  # Instalar paquetes del entorno gráfico
  environment.systemPackages = with pkgs; [
    # BSPWM y herramientas
    bspwm sxhkd rofi picom polybar
    xorg.xrandr xorg.xbacklight xorg.xinput xorg.xset
    lightdm lightdm-gtk-greeter
    lxappearance  # Herramienta para configurar temas GTK

    # Tipografías y temas
    papirus-icon-theme
    arc-theme
    font-awesome

    # Herramientas adicionales
    kitty firefox playerctl brightnessctl
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
