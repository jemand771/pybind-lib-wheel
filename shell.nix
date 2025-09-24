{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  packages = with pkgs; [
    cmakeCurses
    (python3.withPackages (ps: [ ps.pybind11 ]))
  ];
}