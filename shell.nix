{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    lowdown
    cowsay
    fortune
    darkhttpd

    ruby # for neocities cli
  ];
}
