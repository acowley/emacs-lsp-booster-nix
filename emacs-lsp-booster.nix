{ lib, fetchFromGitHub, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "emacs-lsp-booster";
  version = "0.2.1";
  src = fetchFromGitHub {
    owner = "blahgeek";
    repo = "emacs-lsp-booster";
    rev = "v${version}";
    hash = "sha256-uP/xJfXQtk8oaG5Zk+dw+C2fVFdjpUZTDASFuj1+eYs=";
  };

  useFetchCargoVender = true;
  cargoHash = "sha256-CvIJ56QrIzQULFeXYQXTpX9PoGx1/DWtgwzfJ+mljEI=";
  doCheck = false;
  
  meta = {
    description = "Emacs LSP performance booster";
    homepage = "https://github.com/blahgeek/emacs-lsp-booster";
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.acowley ];
  };
}
