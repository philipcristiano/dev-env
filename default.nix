{ system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };

  callPackage = pkgs.lib.callPackageWith (pkgs // pkgs.xlibs // self);

  self = {
    kops = callPackage ./nix/kops.nix { };
    kubectl = callPackage ./nix/kubectl.nix { };
    terraform = callPackage ./nix/terraform.nix { };
  };
in
self
