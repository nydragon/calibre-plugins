{
  description = "Calibre Plugins";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
  };

  outputs = {nixpkgs, ...}: let
    supportedSystems = ["x86_64-linux"];
    forAllSystems = function:
      nixpkgs.lib.genAttrs
      supportedSystems
      (system: function nixpkgs.legacyPackages.${system});
  in {
    packages = forAllSystems (pkgs: {
      acsm-calibre-plugin = pkgs.callPackage ./packages/acsm-calibre-plugin {};
      dedrm-plugin = pkgs.callPackage ./packages/dedrm-plugin {};
    });
  };
}
