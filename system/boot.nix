{ config, pkgs, ... }:

{
  # Bootloader.
  boot = {
	consoleLogLevel = 2;
	swraid.enable = false;
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
}
