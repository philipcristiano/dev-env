let
  pkgs = import <nixpkgs> {};
  stdenv = pkgs.stdenv;

  # Get from github
  ghpkgs = pkgs.callPackage (fetchTarball https://github.com/philipcristiano/dev-env/archive/v0.0.1.tar.gz) {};

in stdenv.mkDerivation {
  name = "env";
  buildInputs = [ ghpkgs.terraform.terraform_0_9_4
                  ghpkgs.kops.kops_1_5_3
                ];
}
