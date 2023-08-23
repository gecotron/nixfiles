{ config, lib, ... }:

{
  services.xserver.displayManager.sddm.sugarCandyNix = {
    enable = true;
    Background = lib.cleanSource ./background.jpg;
    ScreenWidth = 1920;
    ScreenHeight = 1080;
    FormPosition = "left";
    HaveFormBackground = true;
    PartialBlur = true;
  }; 
}
