{ config, pkgs, ... }:

{
  # TODO por favor, cambie el nombre de usuario y el directorio de inicio por los tuyos
  home.username = "alex";
  home.homeDirectory = "/home/alex";

  # vincula el archivo de configuración en el directorio actual a la ubicación
  # definida en el directorio home
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # vincular todos los archivos en `./scripts` a `~/.config/i3/scripts`.
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # vincular recursivamente
  #   executable = true;  # hacer ejecutables todos los archivos
  # };

  # codificar directamente el contenido del archivo en el archivo de configuración nix
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # configurar tamaño del cursor y dpi para monitor 4k
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  # Paquetes que deben instalarse en el perfil de usuario.
  home.packages = with pkgs; [
    # he aquí algunas herramientas de línea de comandos que utilizo con frecuencia
    # siéntase libre de añadir las tuyas propias o eliminar algunas

    neovim
    #git
    chezmoi       # Manejo de dotfiles
    calibre       # Lector de ebooks
    ncmpcpp       # Cliente de MPD
    zsh           # Shell
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-fast-syntax-highlighting
    zsh-powerlevel10k
    tmux
    navi
    amule
    onlyoffice-bin
    smplayer

    #neofetch
    nnn # gestor de archivos de terminal

    # archivos
    zip
    xz
    unzip
    p7zip

    # utilidades
    ripgrep # busca recursivamente un patrón regex en los directorios
    jq # Un procesador JSON de línea de comandos ligero y flexible
    yq-go # procesador yaml https://github.com/mikefarah/yq
    eza # Un sustituto moderno de 'ls
    fzf # filtro de línea de comandos interactivo

    # herramientas de red
    mtr # Una herramienta de diagnóstico de red
    iperf3
    dnsutils  # `dig` + `nslookup`
    ldns # en sustitución de `dig`, proporciona el comando `drill`
    aria2 # Una ligera utilidad de descarga multiprotocolo y multifuente desde la línea de comandos
    socat # reemplazo de openbsd-netcat
    nmap # Utilidad de detección de redes y auditoría de seguridad
    ipcalc  # es una calculadora para las direcciones IPv4/v6

    # varios
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    # relacionados con nix
    #
    # proporciona el comando `nom` funciona igual que `nix`.
    # con más detalles de salida de registro
    nix-output-monitor

    # productividad
    hugo # generador de sitios estáticos
    glow # previsualizador de markdown en terminal

    btop  # reemplazo de htop/nmon
    iotop # monitorización de io
    iftop # supervisión de redes

    # monitorización de llamadas al sistema
    strace # monitorización de llamadas al sistema
    ltrace # monitorización de llamadas a bibliotecas
    lsof # lista de archivos abiertos

    # herramientas del sistema
    sysstat
    lm_sensors # para el comando `sensores`
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];

  # configuración básica de git, por favor cambie a la tuya propia
  programs.git = {
    enable = true;
    userName = "Navarro76";
    userEmail = "alexnm76@gmail.com";
  };

  # starship - un prompt personalizable para cualquier shell
  programs.starship = {
    enable = true;
    # ajustes personalizados
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  # alacritty - un emulador de terminal multiplataforma acelerado en la GPU
  programs.alacritty = {
    enable = true;
    # ajustes personalizados
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 12;
        draw_bold_text_with_bright_colors = true;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO añade aquí tu bashrc personalizado
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';

    # establece algunos alias, siéntete libre de añadir más o eliminar algunos
    shellAliases = {
      k = "kubectl";
      urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
      urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
    };
  };

  # Este valor determina la versión de Home Manager con la que tu
  # configuración es compatible. Esto ayuda a evitar interrupciones
  # cuando una nueva versión de Home Manager introduce cambios
  # incompatibles con versiones anteriores.
  #
  # Puede actualizar home Manager sin cambiar este valor. Consulta
  # las notas de la versión de Home Manager para obtener una lista
  # de los cambios de versión de estado en cada versión.
  home.stateVersion = "24.11";

  # Deja que Home Manager se instale y gestione solo.
  programs.home-manager.enable = true;
}
