{ stdenv, lib, buildGoPackage, fetchpatch, fetchFromGitHub, pkgs ? import <nixpkgs> {} }:

let

  generic = {version, sha256, ...}@attrs:

    stdenv.mkDerivation {
      name = "kops-${version}";
      version = version;

      src = pkgs.fetchurl {
        url = "https://github.com/kubernetes/kops/releases/download/${version}/kops-darwin-amd64";
        sha256 = sha256;
      };

      buildCommand = ''
        mkdir -p $out/bin
        mv $src $out/bin/kops
        echo Installed kops to $out/bin/kops
        '';

    buildInputs = [ pkgs.unzip ];

    };

in {

  kops_1_5_3 = generic {
    version = "1.5.3";
    sha256 = "46ae58b0d490a6b1cd2fdc697f3f33c5c7b9a3f0c5ec7596784b93f0ee0cb629";
  };

}
