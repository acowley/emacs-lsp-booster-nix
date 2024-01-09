{ lib, fetchFromGitHub, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "emacs-lsp-booster";
  version = "0.1.1";
  src = fetchFromGitHub {
    owner = "blahgeek";
    repo = "emacs-lsp-booster";
    rev = "v${version}";
    hash = "sha256-0roQxzQrxcmS2RHQPguBRL76xSErf2hVjuJEyFr5MeM=";
  };
  
  cargoHash = "sha256-quqhAMKsZorYKFByy2bojGgYR2Ps959Rg/TP8SnwbqM=";
  doCheck = false;
  
  meta = {
    description = "Emacs LSP performance booster";
    homepage = "https://github.com/blahgeek/emacs-lsp-booster";
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.acowley ];
  };
}
