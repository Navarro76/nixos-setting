{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      font_size = 6;
      font_family = "Fira Code";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      cursor_shape = "beam";
      scrollback_lines = 10000;
      enable_audio_bell = false;
      confirm_os_window_close = 0;
      background_opacity = "0.9";
    };
    extraConfig = ''
      # Configuración adicional de Kitty
      map ctrl+shift+v paste_from_clipboard
      map ctrl+shift+c copy_to_clipboard
    '';
  };
}
