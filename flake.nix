{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
        perlAdditionalPackages = pkgs.callPackage ./perl-packages.nix { inherit pkgs; };
        devDeps = with pkgs; with perlPackages; with perlAdditionalPackages; [
          perlAdditionalPackages.CodeTidyAll
          DistZilla
          DistZillaPluginGit
          DistZillaPluginPodWeaver
          DistZillaPluginTestPerlCritic
          PerlCritic
          PerlTidy
        ];
        deps = with pkgs; with perlPackages; [
          perl
          Mojolicious
          RoleTiny
          ClassMethodModifiers
          HTTPDate
        ] ++ devDeps;
      in
      with pkgs; {
        devShells.default = mkShell {
          buildInputs = deps;
          shellHook = ''
            export PERL5LIB="$PERL5LIB:$PWD/lib"
          '';
        };
      }
    );
}
