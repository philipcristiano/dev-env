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
        cp $src $out/bin/kops
        chmod +x $out/bin/kops
        echo Installed kops to $out/bin/kops
        '';

    buildInputs = [ pkgs.unzip ];

    };

in {

  kops_1_5_3 = generic {
    version = "1.5.3";

    file = if stdenv.system == "x86_64-darwin" then "kops-darwin-amd64"
      else if stdenv.system == "x86_64-linux" then "kops-linux-amd64"
      else abort "Unsupported platform";

    sha256 = if stdenv.system == "x86_64-darwin" then "46ae58b0d490a6b1cd2fdc697f3f33c5c7b9a3f0c5ec7596784b93f0ee0cb629"
        else if stdenv.system == "x86_64-linux" then "7e3fcd62a968f29c7d1add28bbd9467b568d5d4a9c349330c7d67cfdf7cf1b52"
        else abort "Unsupported platform";
  };

  kops_1_6_0 = generic {
    version = "1.6.0";

    file = if stdenv.system == "x86_64-darwin" then "kops-darwin-amd64"
      else if stdenv.system == "x86_64-linux" then "kops-linux-amd64"
      else abort "Unsupported platform";

    sha256 = if stdenv.system == "x86_64-darwin" then "d220505a220eefc7aca39f218706a74cfc5e0649e6050f1b1e9847d1766832f4"
        else if stdenv.system == "x86_64-linux" then "91058b40241e4b9f1c94a85936626dd69eea604f448ad3164d283d9bda94b29a"
        else abort "Unsupported platform";
  };

  kops_1_6_2 = generic {
    version = "1.6.2";

    file = if stdenv.system == "x86_64-darwin" then "kops-darwin-amd64"
      else if stdenv.system == "x86_64-linux" then "kops-linux-amd64"
      else abort "Unsupported platform";

    sha256 = if stdenv.system == "x86_64-darwin" then "41225a58595826b91723fb39e7bd9466d6bfc6aebdb80f71b22961887846a0cc"
        else if stdenv.system == "x86_64-linux" then "4bdc61685a2a359318830d8e4cd230ff90a8f74d43398ea9b631d9ab252f98b5"
        else abort "Unsupported platform";
  };

}
