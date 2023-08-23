{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ (callPackage ./theme.nix {}.sddm-sugar-dark) ];
  services.xserver.displayManager.sddm.theme = "sddm-sugar-dark";
}
