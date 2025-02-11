{ config, pkgs, ... }:

{
  # Instalar Samba
  environment.systemPackages = with pkgs; [ samba ];

  # Habilitar el servicio de Samba
  services.samba = {
    enable = true;
    openFirewall = true;  # Abre los puertos necesarios en el firewall

    # Configuración de Samba
    settings = {
      "global" = {
        workgroup = "WORKGROUP";
        serverString = "NixOS Samba Server";
        security = "user";
        mapToGuest = "Bad User";
        logFile = "/var/log/samba/log.%m";
        maxLogSize = 50;
        serverRole = "standalone server";
        dnsProxy = "no";
      };

      # Compartir directorio público
      "Public" = {
        path = "/srv/samba/public";
        browseable = true;
        readOnly = false;
        guestOk = true;
      };

      # Compartir directorio privado
      "Private" = {
        path = "/srv/samba/private";
        browseable = true;
        readOnly = false;
        guestOk = false;
        validUsers = [ "alex" ];  # Usuario permitido para acceder
      };
    };
  };

  # Configurar carpetas compartidas con permisos correctos
  systemd.tmpfiles.rules = [
    "d /srv/samba/public  2775 root users -"
    "d /srv/samba/private 2770 root users -"
  ];

  # Agregar el usuario 'alex' al grupo 'users' para que tenga acceso
  users.users.alex.extraGroups = [ "users" ];
}
