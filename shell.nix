{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  packages = with pkgs; [
    cmakeCurses
    (python3.withPackages (
      ps: with ps; [
        auditwheel
        (buildPythonPackage rec {
          pname = "delocate";
          version = "0.13.0";
          # repo on github doesn't have tags
          src = fetchFromGitHub {
            owner = "matthew-brett";
            repo = pname;
            tag = version;
            hash = "sha256-k6Lqj4tOEk+wg9ySs+vyjrfxKyEWuKHIAKPjx5iRIl8=";
          };
          pyproject = true;
          build-system = [
            setuptools
            setuptools_scm
          ];
          dependencies = [
            macholib
            typing-extensions
          ];
          pythonImportsCheck = [ pname ];
        })
        (buildPythonPackage rec {
          pname = "delvewheel";
          version = "1.11.0";
          # repo on github doesn't have tags
          src = fetchPypi {
            inherit pname version;
            hash = "sha256-5ZOuJ9hanJN/+B5L2rWQ5iRtqbu11hEcw8uCcbQ6/X4=";
          };
          pyproject = true;
          build-system = [ setuptools ];
          dependencies = [ pefile ];
          pythonImportsCheck = [ pname ];
        })
        pybind11
      ]
    ))
  ];
}
