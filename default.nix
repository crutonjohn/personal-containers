# shell.nix
with (import <nixpkgs> {});
stdenv.mkDerivation {
  name = "containers";
  buildInputs = [
    go-task
    cue
  ];
}
