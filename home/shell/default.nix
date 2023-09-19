{ config, pkgs, ... }:

{
  # Enable shell
  programs.fish = {
    enable = true;
    

  # set aliases
    shellAliases = {
    rebuild = "sudo nixos-rebuild switch";
    update = "sudo cp -r /home/mdw/nixfiles/* /etc/nixos";
    };
  };

  # Configure git
    programs.git = {
    enable = true;
    userName = "Michael Ward";
    userEmail = "gecotron@gmail.com";
  };

  # Programs used on shell
  home.packages = with pkgs; [
    bunnyfetch
    nnn
    aerc
    bombadillo
    amfora
    gitui
    gnumake
    just
    ouch
    maven
    fzf
    ripgrep
    bottom
  ];
}
