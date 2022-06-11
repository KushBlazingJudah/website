{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    lowdown
    cowsay
    fortune

    ruby # for neocities cli
  ];
}
