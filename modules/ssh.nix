{ config, pkgs, ... }:

{
  services.openssh = {
    enable = true;                      # Habilita el servicio SSH
    openFirewall = true;                # Abre el puerto 22 en el firewall automáticamente
    passwordAuthentication = false;     # Desactiva autenticación con contraseña (solo claves SSH)
    permitRootLogin = "no";             # Bloquea acceso SSH como root
  };

  # Opcional: Agregar clave pública SSH para el usuario alex
  users.users.alex.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3... tu-clave-publica"
  ];
}
