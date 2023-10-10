{
  description = "Nix applications packages";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          devShells.default = import ./shell.nix {
            inherit pkgs;
          };
        }
      ) // {
      templates =
        {
          default = {
            path = ./projects/minimal;
            description = "minimal project";
          };
          minimal = {
            path = ./projects/minimal;
            description = "minimal project";
          };
          scala = {
            path = ./projects/scala;
            description = "scala project";
          };
          deno = {
            path = ./projects/deno;
            description = "deno project";
          };
        };
    };
}
