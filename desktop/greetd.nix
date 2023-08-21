{ config, pkgs, ... }:

{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --sessions ${config.services.xserver.displayManager.session.desktops}";
        user = "greeter";
      };
    };
  };
}
