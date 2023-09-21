flakes: { config, pkgs, ... }:

{
  imports = [
    ./desktop
    ./shell
    ./apps
  ];
  home.username = "mdw";
  home.homeDirectory = "/home/mdw";

  # Firefox config
  home.file.".mozilla/firefox/default/chrome/firefox-theme".source = flakes.firefox-theme;

  programs.firefox.profiles.default = {
    settings = {
      "toolkit.legacyUSerProfileCustomizarions.stylesheets" = true;
      "browser.uidensity" = 0;
      "svg.context-properties.content.enabled" = true;
      "browser.theme.dark-private-windows" = false;
    };
  };

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
