let
  pkgs = import <nixpkgs> {};
  stdenv = pkgs.stdenv;

  # Get from github
  ghpkgs = pkgs.callPackage (fetchTarball https://github.com/philipcristiano/dev-env/archive/v0.0.8.tar.gz) {};
  # Get local version used for testing
  # ghpkgs = pkgs.callPackage "/Users/philipcristiano/gits/dev-env/default.nix" {};

in stdenv.mkDerivation {
  name = "env";
  buildInputs = [ ghpkgs.terraform.terraform_0_10_0
                  ghpkgs.kops.kops_1_6_2
                  ghpkgs.kubectl.kubectl_1_6_6
                  ghpkgs.op.op_0_1_1
                ];
}
