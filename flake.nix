{
  description = "Calibre Plugins";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
  };

  outputs =
    { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" ];
      forEachSystem = nixpkgs.lib.genAttrs systems;
      pkgsForEach = nixpkgs.legacyPackages;
    in
    {
      packages = forEachSystem (system: {
        acsm-calibre-plugin = pkgsForEach.${system}.callPackage ./packages/acsm-calibre-plugin { };
      });
    };
}
