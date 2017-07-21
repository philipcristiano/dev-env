{ stdenv, lib, buildGoPackage, fetchpatch, fetchFromGitHub, pkgs ? import <nixpkgs> {} }:

let

  generic = {platform, version, sha256, ...}@attrs:

    stdenv.mkDerivation {
      name = "kubectl-${version}";
      version = version;

      src = pkgs.fetchurl {
        url = "https://storage.googleapis.com/kubernetes-release/release/v${version}/bin/${platform}/kubectl";
        sha256 = sha256;
      };

      buildCommand = ''
        mkdir -p $out/bin
        cp $src $out/bin/kubectl
        chmod +x $out/bin/kubectl
        echo Installed kubectl to $out/bin/kubectl
        '';

    buildInputs = [ pkgs.unzip ];

    };

in {
  kubectl_1_6_6 = generic {
    version = "1.6.6";

    platform = if stdenv.system == "x86_64-darwin" then "darwin/amd64"
          else if stdenv.system == "x86_64-linux" then "linux/amd64"
          else abort "Unsupported platform";

    file = if stdenv.system == "x86_64-darwin" then "kops-darwin-amd64"
      else if stdenv.system == "x86_64-linux" then "kops-linux-amd64"
      else abort "Unsupported platform";

    sha256 = if stdenv.system == "x86_64-darwin" then "b647e4a09280961c6a68bd19625eac082b2604813e6cf41e8d9d57be706b77c0"
        else if stdenv.system == "x86_64-linux" then "c7e1830010f58ca42e4b201ea712683d1f52f4c43b2af28cbe216257da963645"
        else abort "Unsupported platform";

  };


}
