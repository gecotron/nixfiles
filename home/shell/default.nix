{ config, pkgs, ... }:

{
  # Enable shell
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

  # set aliases
    shellAliases = {
    rebuild = "sudo nixos-rebuild switch";
    update = "sudo cp -r /home/mdw/nixfiles/* /etc/nixos";
    };
  };
  # Programs used on shell
  home.packages = with pkgs; [
    bunnyfetch
    nnn
    gitui
    fzf
    ripgrep
    bottom
  ];
}
