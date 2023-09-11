{ config, pkgs, ... }:

{
  # Bootloader.
  boot = {
	loader = {
		efi = {
			canTouchEfiVariables = true;
		};
		grub = {
			enable = true;
			device = "nodev";
			efiSupport = true;
			configurationLimit = 10;
			useOSProber = true;
		};
	};
  };
  plymouth = {
    enable = true;
    themePackages = [
      adi1090x-plymouth-themes
    ];
    theme = "Black HUD";
  };
}
