{ pkgs ? import (fetchTarball "channel:nixos-23.05") {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.htop
    pkgs.libyaml
    pkgs.openssh
    pkgs.postgresql_15_jit
    pkgs.ruby
    pkgs.which
    pkgs.zlib
  ];
}
