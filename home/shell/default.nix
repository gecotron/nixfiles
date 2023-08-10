{ config, pkgs, ... }:

{
  # Enable shell
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

  # set aliases
    shellAliases = {
    rebuild = "sudo nix flake update && sudo nixos-rebuild switch";
    };
  };
  # Programs used on shell
  home.packages = with pkgs; [
    bunnyfetch
    nnn
    gitui
    git-brunch
    fzf
    ripgrep
    bottom
  ];
}
