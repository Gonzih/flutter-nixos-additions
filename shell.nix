{ pkgs ? import <nixpkgs> {} }:

(pkgs.buildFHSUserEnv {
  name = "flutter-fhs-env";
  targetPkgs = pkgs: (with pkgs; [
    gnumake
    bash
    git
  ]);
  profile = ''
    export FLUTTER_SDK="$HOME/opt/flutter"
    export DART_SDK="$FLUTTER_SDK/bin/cache/dart-sdk"
    export PATH="$PATH":"$HOME/.pub-cache/bin":"$FLUTTER_SDK/bin"
  '';
  runScript = "bash";
}).env
