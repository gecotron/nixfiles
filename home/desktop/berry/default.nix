{ config, pkgs, ... }:

{
    # Set autostart
    home.file.".config/berry/autostart" = ./autostart;

    # Programs & services for berry

    # Programs:


    # Services:
    services.sxhkd = {
        enable = true;
        keybindings = {
            "super + return" = "wezterm";
        };
    };

    services.polybar = {
        enable = true;
        script = "";
        config = ./config.ini;
    };
}
