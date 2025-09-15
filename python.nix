{
  description = "Python Packages Example";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs {
            inherit system;
          };

          python = pkgs.python3.override {
            self = python;
            packageOverrides = python-self: python-super: {
              redshift-connector = python-super.redshift-connector.overridePythonAttrs (oldAttrs: {
                # redshift-connector tests don't work
                doCheck = false;
              });
              google-cloud-bigquery = python-super.google-cloud-bigquery.overridePythonAttrs (oldAttrs: {
                # this package marked as broken, so normally we need run NIXPKGS_ALLOW_BROKEN=1; nix develop --impure
                # however, we can override that here, because we like to live dangerously
                meta = oldAttrs.meta // { broken = false; };
                doCheck = false;
                propagatedBuildInputs = oldAttrs.propagatedBuildInputs ++ [ python-super.packaging ];
              });
            };
          };

          # pandas-gbq and db-types are not in nixpkgs so we will define them here
          pywayfire = pkgs.python3Packages.buildPythonPackage rec {
            pname = "PyWayfire";
            version = "3.2";

            src = pkgs.fetchFromGitHub {
              owner = "WayfireWM";
              repo = "pywayfire";
              rev = "v${version}";
              sha256 = "";
            };

            doCheck = false; # check requires infrastructure
          };


        in
        with pkgs;
        {
          devShells.default = mkShell {
            name = "soip reports";
            packages = [
              # put any non-Python packages here
              pywayfire
              # Python packages:
              (python.withPackages (p: with p; [
              ]))
            ];

            shellHook = ''
            echo "Look at all these amazing Python packages!"
            '';
          };
        }
      );
}