let
  pkgs = import <nixpkgs> {};
  stdenv = pkgs.stdenv;

  # Install from local file
  terraform = pkgs.callPackage nix/terraform.nix {};
  kops = pkgs.callPackage nix/kops.nix {};

  # Install from github
  terraform_src = pkgs.callPackage (pkgs.fetchurl
    { url = https://raw.githubusercontent.com/NixOS/nixpkgs/8a11612d502d8578d7828e21778dcf3391084095/pkgs/applications/networking/cluster/terraform/default.nix;
      sha256 = "46f2a5c916375365f10ea1623af221292f219c342557f1a8a8ceb49c7da310ec";
  }) {};

in stdenv.mkDerivation {
  name = "env";
  # change terraform_0_9_4 to any of the varieties listed in the called packages
  buildInputs = [ terraform_src.terraform_0_9_4
                  kops.kops_1_5_3
                ];
}
