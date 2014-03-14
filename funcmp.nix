/* Build instructions for the continuous integration system Hydra. */

{ funcmpSrc ? { outPath = ../funcmp; revCount = 0; gitTag = "dirty"; }
, supportedPlatforms ? [ "x86_64-linux" ]
, supportedCompilers ? [ "ghc6104" "ghc6123" "ghc704" "ghc722" "ghc742" "ghc763" "ghc781" "ghcHEAD" ]
}:

let
  genAttrs = (import <nixpkgs> { }).lib.genAttrs;
in
rec {
  funcmp = genAttrs supportedCompilers (ghcVer: genAttrs supportedPlatforms (system:
    let
      pkgs = import <nixpkgs> { inherit system; };
      haskellPackages = pkgs.lib.getAttrFromPath ["haskellPackages_${ghcVer}"] pkgs;
    in
    haskellPackages.cabal.mkDerivation (self: {
      pname = "funcmp";
      src = funcmpSrc;
      version = funcmpSrc.gitTag;
    })));
}
