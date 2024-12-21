{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nix-develop.url = "github:nicknovitski/nix-develop";
  };

  outputs = { self, nixpkgs, flake-utils, nix-develop }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs {
            inherit system;
          };

        in {
          devShells.default = pkgs.mkShell {
            buildInputs = [
              pkgs.nodejs
              pkgs.pnpm

            ];
          };
        }
      );
}
