{ config, pkgs, ... }:

{
  # Import wm configs
  imports = [
    # ./berrywm
    ./gnome
    # ./hyprland
  ];

  # Configure nvidia GPU drivers
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    open = true;
  };

  # Enable X11 and nvidia drivers
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
  };
  
  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable display manager
  services.xserver.displayManager.gdm.enable = true;
}