{
  description = "MDW's NixOS Flake";

  # This is the standard format for flake.nix.
  # `inputs` are the dependencies of the flake,
  # and `outputs` function will return all the build results of the flake.
  # Each item in `inputs` will be passed as a parameter to
  # the `outputs` function after being pulled and built.
  inputs = {
    # There are many ways to reference flake inputs.
    # The most widely used is `github:owner/name/reference`,
    # which represents the GitHub repository URL + branch/commit-id/tag.

    # Official NixOS package source, using nixos-unstable branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    helix.url = "github:helix-editor/helix/23.05";
    sddm-sugar-candy-nix = {
      url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-theme = { url = "github:andreasgrafen/cascade"; flake = false; };
    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # `outputs` are all the build result of the flake.
  #
  # A flake can have many use cases and different types of outputs.
  # 
  # parameters in function `outputs` are defined in `inputs` and
  # can be referenced by their names. However, `self` is an exception,
  # this special parameter points to the `outputs` itself(self-reference)
  # 
  # The `@` syntax here is used to alias the attribute set of the
  # inputs's parameter, making it convenient to use inside the function.
  outputs = { self, nixpkgs, sddm-sugar-candy-nix, home-manager, firefox-theme, ... }@inputs: {
    nixosConfigurations = {
      "voyager" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = inputs;  # pass custom arguments into all sub module.
        modules = [
          # Import system configuration
          ./system
          # Import & set up home manager module
          sddm-sugar-candy-nix.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.mdw = import ./home { firefox-theme = firefox-theme; };
          }
        ];
      };
    };
  };
}
