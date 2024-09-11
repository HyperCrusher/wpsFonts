# wpsFonts Flake
A nixos flake that provides all the font's that Wps Office need to avoid errors on linux for math and list rendering.

## Usage
To use pipe this flake as an input to your flake.nix
### Flake.nix
```nix
wpsFonts.url = "github:hypercrusher/wpsfonts";
```
Then wherever you define your fonts, make sure to pass system

### Fonts.nix
```nix
{
  pkgs, inputs, system, ...
}:
{
  nixpkgs.config.joypixels.acceptLicense = true;
  fonts.packages = with pkgs; [
    inputs.wpsFonts.packages.${system}.default
  ];
}
```
