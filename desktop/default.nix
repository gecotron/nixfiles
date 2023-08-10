{ config, pkgs, ... }:

{
  # Import wm configs
  imports = [
    # ./berrywm
    ./gnome
    # ./hyprland
  ];
  
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable display manager
  services.xserver.displayManager.gdm.enable = true;
}