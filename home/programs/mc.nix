{ config, pkgs, ... }:

{
  pkgs.symlinkJoin {
    name = "prismlauncher";
    paths = [ pkgs.prismlauncher ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram nv-offload $out/bin/prismlauncher
    '';
  }
}
