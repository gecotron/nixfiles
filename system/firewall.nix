{ config, pkgs, ... }:

{
  networking.firewall.allowedTCPPortRanges = [
    # KDE/GS Connect
    {from = 1714; to = 1764; }
  ];
  networking.firewall.allowedUDPPortRanges = [
    # KDE/GS Connect
    {from = 1714; to = 1764 }
  ];
}
