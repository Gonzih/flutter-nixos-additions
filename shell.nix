{ pkgs ? import <nixpkgs> {} }:

(pkgs.buildFHSUserEnv {
  name = "flutter-fhs-env";
  targetPkgs = pkgs: (with pkgs; [
    gnumake
    bash
    git
  ]);
  profile = ''
    export PATH="$PATH":"$HOME/.pub-cache/bin":"$HOME/opt/flutter/bin"
  '';
  runScript = "bash";
}).env
