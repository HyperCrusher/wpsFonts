{
  description = "A flake providing WPS compatibility fonts";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let 
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages.default = pkgs.stdenvNoCC.mkDerivation {
          name = "wps-compatibility-fonts";
          src = ./.;

          installPhase = ''
            mkdir -p $out/share/fonts/truetype
            cp *.ttf *.TTF $out/share/fonts/truetype/
          '';

          meta = {
            description = "Compatibility fonts for WPS Office";
          };
        };
      }
    );
}
