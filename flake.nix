{
  description = "Wrapper to speed up LSP interactions on emacs";
  inputs = {
    nixpkgs.url = github:nixos/nixpkgs/nixpkgs-23.11-darwin;
    flake-utils.url = github:numtide/flake-utils;
  };

  outputs = { self, nixpkgs, flake-utils }:
  flake-utils.lib.eachDefaultSystem (system: 
  let pkgs = nixpkgs.legacyPackages.${system};
  emacs-lsp-booster = pkgs.callPackage ./emacs-lsp-booster.nix {};
  in rec {
    packages = {
      inherit emacs-lsp-booster;
      default = emacs-lsp-booster;
    };

    apps = rec {
      emacs-lsp-booster = flake-utils.lib.mkApp {
        drv = packages.emacs-lsp-booster;
      };
      default = emacs-lsp-booster;
    };
  }
  ) // {
    overlay = final: prev: {
      emacs-lsp-booster = prev.callPackage ./emacs-lsp-booster.nix {};
    };
  };
}
