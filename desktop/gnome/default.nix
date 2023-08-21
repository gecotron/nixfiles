{ config, pkgs, ... }:

{
  # Enable the GNOME Desktop Environment.
  services.xserver.desktopManager.gnome.enable = true;

  # Install extensions
  environment.systemPackages = with pkgs; [
    gnomeExtensions.gsconnect
    gnomeExtensions.user-themes
    gnome.gnome-tweaks
  ];
}
