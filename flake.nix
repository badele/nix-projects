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
          deno = {
            path = ./projects/deno;
            description = "deno project";
          };
          hugo-geekdoc = {
            path = ./projects/hugo-geekdoc;
            description = "Hugo geekdoc project";
          };
          deno-module = {
            path = ./projects/deno-module;
            description = "deno project";
          };
          minimal = {
            path = ./projects/minimal;
            description = "minimal project";
          };
          scala = {
            path = ./projects/scala;
            description = "scala project";
          };
        };
    };
}
