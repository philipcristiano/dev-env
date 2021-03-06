{ stdenv, lib, buildGoPackage, fetchpatch, fetchFromGitHub, pkgs ? import <nixpkgs> {} }:

let

  generic = {file, version, sha256, ...}@attrs:

    stdenv.mkDerivation {
      name = "kops-${version}";
      version = version;

      src = pkgs.fetchurl {
        url = "https://github.com/kubernetes/kops/releases/download/${version}/${file}";
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

    sha256 = if stdenv.system == "x86_64-darwin" then "17yx8cz7r5vjgm9p9n1rr6lcg30qipbfv561g2cf27j40m679p8y"
        else if stdenv.system == "x86_64-linux" then "1dcq5wjspn9inslqwfa39pvsi47z6394r3hdhcc96d9ab9l63p2b"
        else abort "Unsupported platform";
  };

  kops_1_7_1 = generic {
    version = "1.7.1";

    file = if stdenv.system == "x86_64-darwin" then "kops-darwin-amd64"
      else if stdenv.system == "x86_64-linux" then "kops-linux-amd64"
      else abort "Unsupported platform";

    sha256 = if stdenv.system == "x86_64-darwin" then "d6470ba8eb1192fc1675941256470bdac61667a43749f5d5ad42d87282d35a02"
        else if stdenv.system == "x86_64-linux" then "8dda056fd45cd0ea064762cb16fb23e8134c45d1c0e9205b3581aab83bbe288c"
        else abort "Unsupported platform";
  };

}
