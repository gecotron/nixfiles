{ config, pkgs, ... }:
# Firefox config
{
  home.file.".mozilla/firefox/ue8cjezt.default/chrome/firefox-theme".source = inputs.firefox-theme;

  programs.firefox.profiles.default = {
    settings = {
      "toolkit.legacyUSerProfileCustomizarions.stylesheets" = true;
      "browser.uidensity" = 0;
      "svg.context-properties.content.enabled" = true;
      "browser.theme.dark-private-windows" = false;
    };
  };
}
