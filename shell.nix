{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  packages = with pkgs; [
    cmakeCurses
    gcc
    (python3.withPackages (ps: [ ps.pybind11 ]))
  ];
}