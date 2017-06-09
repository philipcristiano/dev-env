let
  pkgs = import <nixpkgs> {};
  stdenv = pkgs.stdenv;

  # Install from local file
  terraform = pkgs.callPackage nix/terraform.nix {};
  kops = pkgs.callPackage nix/kops.nix {};
  devpkgs = pkgs.callPackage nix/default.nix {};

  # Install from github
  terraform_src = pkgs.callPackage (pkgs.fetchurl
    { url = https://raw.githubusercontent.com/NixOS/nixpkgs/8a11612d502d8578d7828e21778dcf3391084095/pkgs/applications/networking/cluster/terraform/default.nix;
      sha256 = "46f2a5c916375365f10ea1623af221292f219c342557f1a8a8ceb49c7da310ec";
  }) {};

  # Get from github
  ghpkgs = pkgs.callPackage (fetchTarball https://github.com/philipcristiano/dev-env/archive/v0.0.1.tar.gz) {};

in stdenv.mkDerivation {
  name = "env";
  buildInputs = [ ghpkgs.terraform.terraform_0_9_4
                  ghpkgs.kops.kops_1_5_3
                ];
}
