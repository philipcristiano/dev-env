{ stdenv, lib, buildGoPackage, fetchFromGitHub, pkgs }:

buildGoPackage rec {
  name = "cfssl-${version}";
  version = "1.3.2";

  goPackagePath = "github.com/cloudflare/cfssl";

  src = fetchFromGitHub {
    owner = "cloudflare";
    repo = "cfssl";
    rev = "1.3.2";
    sha256 = "0j2gz2vl2pf7ir7sc7jrwmjnr67hk4qhxw09cjx132jbk337jc9x";
  };

  meta = with stdenv.lib; {
    homepage = https://cfssl.org/;
    description = "Cloudflare's PKI and TLS toolkit";
    platforms = platforms.all;
    license = licenses.bsd2;
  };
}

