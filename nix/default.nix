{ system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };

  callPackage = pkgs.lib.callPackageWith (pkgs // pkgs.xlibs // self);

  self = {
    kops = callPackage ./kops.nix { };
    terraform = callPackage ./terraform.nix { };

  };
in
self
