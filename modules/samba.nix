{ config, pkgs, ... }:

{
  # Instalar Samba
  environment.systemPackages = with pkgs; [ samba ];

  # Habilitar el servicio de Samba
  services.samba = {
    enable = true;
    openFirewall = true;  # Abre los puertos necesarios en el firewall
    settings = ''
      [global]
      workgroup = WORKGROUP
      server string = NixOS Samba Server
      security = user
      map to guest = Bad User
      log file = /var/log/samba/log.%m
      max log size = 50
      server role = standalone server
      dns proxy = no

      [Public]
      path = /srv/samba/public
      browseable = yes
      read only = no
      guest ok = yes

      [Private]
      path = /srv/samba/private
      browseable = yes
      read only = no
      guest ok = no
      valid users = alex
    '';
  };

  # Configurar carpetas compartidas con permisos correctos
  systemd.tmpfiles.rules = [
    "d /srv/samba/public  2775 root users -"
    "d /srv/samba/private 2770 root users -"
  ];

  # Agregar el usuario 'alex' al grupo 'users' para que tenga acceso
  users.users.alex.extraGroups = [ "users" ];
}
