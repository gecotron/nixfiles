{ config, pkgs, ... }:

{
  imports = [
    ./mc
    # ./firefox.nix
  ];

  # Extra packages not at system level
  home.packages = with pkgs; [
    firefox
    vscode-fhs
    vencord
    (discord.override {
      withVencord = true;
    })
    zip
    xz
    unzip
    p7zip
    pciutils
    lshw
    blockbench-electron
    # googleearth-pro
    steam
    blender
    libreoffice-fresh
    desktop-file-utils
  ];
}
