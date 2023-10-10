{ pkgs ? import <nixpkgs> { } }:

pkgs.stdenv.mkDerivation {
  name = "nix-projects";

  buildInputs = with pkgs; [
    cocogitto
    nixpkgs-fmt
    nodePackages.markdownlint-cli
    pre-commit
  ];

  shellHook = ''
    export PROJ="nix-projects"

    echo ""
    echo "⭐ Welcome to the $PROJ project ⭐"
    echo ""
  '';
}
