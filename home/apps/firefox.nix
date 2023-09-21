{ config, pkgs, ... }:
# Firefox config
{
  home.file.".mozilla/firefox/default/chrome/firefox-theme".source = firefox-theme;

  programs.firefox.profiles.default = {
    settings = {
      "toolkit.legacyUSerProfileCustomizarions.stylesheets" = true;
      "browser.uidensity" = 0;
      "svg.context-properties.content.enabled" = true;
      "browser.theme.dark-private-windows" = false;
    };
  };
}
