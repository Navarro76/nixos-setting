{ config, pkgs, ... }:

{
  services.openssh = {
    enable = true;                      # Habilita el servicio SSH
    openFirewall = true;                # Abre el puerto 22 en el firewall automáticamente
    settings = {
      PasswordAuthentication = true;  # Desactivar autenticación por contraseña
      PermitRootLogin = "yes";          # Desactivar acceso como root
    };
  };

  # Opcional: Agregar clave pública SSH para el usuario alex
  users.users.alex.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3... tu-clave-publica"
  ];
}
