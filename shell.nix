{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  name = "sunburng-shell";

  packages = with pkgs; [
    quarto
    libssh2
    curl
    librsvg
    julia-mono
  ];

  shellHook = ''
    export JULIA_BINDIR="$HOME/.julia/juliaup/julia-1.12.6+0.x64.linux.gnu/bin"
    export PATH="$JULIA_BINDIR:$PATH"
    export NIX_LD_LIBRARY_PATH="$HOME/.julia/juliaup/julia-1.12.6+0.x64.linux.gnu/lib/julia"
    export LD_LIBRARY_PATH="${pkgs.curl}/lib:${pkgs.libssh2}/lib:$LD_LIBRARY_PATH"
    export JULIA_NUM_THREADS=4
    export SSH_ASKPASS=""
  '';
}
