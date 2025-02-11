{ config, pkgs, ... }:

{
  home.username = "alex";
  home.homeDirectory = "/home/alex";

  # 1. Instalar paquetes personales (pero sin gestionar configuración en Home Manager)
  home.packages = with pkgs; [
    neovim
    git
    chezmoi       # Manejo de dotfiles
    calibre       # Lector de ebooks
    ncmpcpp       # Cliente de MPD
    zsh           # Shell
    zsh-autosuggestions
    zsh-syntax-highlighting
    fast-syntax-highlighting
    powerlevel10k
    tmux
    navi
    amule
    onlyoffice-bin
    smplayer
    koodo-reader
    nerdfonts     # Fuentes necesarias para Powerlevel10k
  ];

  # 2. NO configurar Zsh en Home Manager (Chezmoi lo manejará)

  # 3. Habilitar Home Manager
  programs.home-manager.enable = true;

  # 4. Definir la versión de Home Manager
  home.stateVersion = "23.11";
}
