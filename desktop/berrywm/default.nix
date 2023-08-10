{ config, pkgs, ... }

{
  # Enable BerryWm & picom
  services.xserver.windowManager.berry.enable = true;
  services.picom = {
    enable = true;
    settings = ./picom.conf;
  };
  
}
