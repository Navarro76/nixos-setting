{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pipewire  # Servidor de audio
    mpd       # Music Player Daemon
    spaceFM   # Administrador de archivos ligero
    feh       # Visualizador de imágenes
    kitty
  ];

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  services.mpd = {
    enable = true;
    musicDirectory = "/home/alex/Music";  # Cambia esto según tu estructura
    network.listenAddress = "localhost";  # Asegura que MPD solo escuche en localhost
    #network.listenAddress = "127.0.0.1";
    extraConfig = ''
      audio_output {
        type "pulse"
        name "MPD PulseAudio"
      }
    '';
  };
  
}
