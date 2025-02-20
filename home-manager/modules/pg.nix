{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # he aquí algunas herramientas de línea de comandos que utilizo con frecuencia
    # siéntase libre de añadir las tuyas propias o eliminar algunas

    neovim
    wmname
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
}
