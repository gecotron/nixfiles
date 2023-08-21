{ config, pkgs, ... }:

{
  imports = [
    ./shell
    ./mc
  ];
  home.username = "mdw";
  home.homeDirectory = "/home/mdw";

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "Michael Ward";
    userEmail = "gecotron@gmail.com";
  };

  # Extra user packages not installed/configured in ./programs
  home.packages = with pkgs; [
    # archives
    zip
    xz
    unzip
    p7zip
    pciutils
    lshw
    blockbench-electron
  ];

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
