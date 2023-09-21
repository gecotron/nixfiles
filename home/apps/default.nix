{ config, pkgs, ... }:

{
  imports = [
    ./mc
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
    gimp-with-plugins
    blockbench-electron
    castor
    agate
    # googleearth-pro
    steam
    blender
    libreoffice-fresh
    desktop-file-utils
  ];
}
