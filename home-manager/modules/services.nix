{ config, lib, pkgs, ... }:

{
  systemd.user.services.polybar = {
    enable = true;
    description = "Polybar Status Bar";
    after = lib.mkForce [ "graphical-session.target" ];
    wantedBy = [ "graphical-session.target" ];

    serviceConfig = {
      ExecStart = "%h/polybar-collection/launch.sh";
      Restart = "always";
      RestartSec = 3;
    };
  };
}
