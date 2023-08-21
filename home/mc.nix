{ config, pkgs, ... }:

let
  prismlauncherDesktop = pkgs.makeDesktopItem {
    name = "prismlauncher";
    desktopName = "Prism Launcher (Nvidia)";
    exec = ''sh -c "nv-offload prismlauncher"'';
    terminal = false;
  };
in {
  home.packages = with pkgs; [
    prismlauncher
    prismlauncherDesktop
  ];
}
