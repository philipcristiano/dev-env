{ stdenv, lib, buildGoPackage, fetchpatch, fetchFromGitHub, pkgs ? import <nixpkgs> {} }:

let

  generic = {file, version, sha256, ...}@attrs:

    stdenv.mkDerivation {
      name = "op-${version}";
      version = version;

      src = pkgs.fetchurl {
        url = "https://cache.agilebits.com/dist/1P/op/pkg/v0.1.1/op_${file}_v${version}.zip";
        sha256 = sha256;
      };

      buildCommand = ''
        mkdir -p $out/bin
        cd $out/bin
        unzip $src
        chmod +x $out/bin/op
        echo Installed op to $out/bin/op
        '';

    buildInputs = [ pkgs.unzip ];

    };

in {

  op_0_1_1 = generic {
    version = "0.1.1";

    file = if stdenv.system == "x86_64-darwin" then "darwin_amd64"
      else if stdenv.system == "x86_64-linux" then "linux_amd64"
      else abort "Unsupported platform";

    sha256 = if stdenv.system == "x86_64-darwin" then "95eb4cfd62a5bf1eab99d4acb24ab9229fc4dfb16a931dd7f9628f88b54c1fc7"
        else if stdenv.system == "x86_64-linux" then "6dc01dce5138f5ec8c6d6853fb22d02cfe1c0b0178f02754278d4dcac11f038b"
        else abort "Unsupported platform";
  };

}
