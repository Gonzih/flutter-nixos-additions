let
   pkgs = import <nixpkgs> {};
in pkgs.stdenv.mkDerivation rec {
  name = "flutter-development-app";
  buildInputs = with pkgs; [
    gnumake
    bash
    git
    flutter
    dart
  ];
  NIXPKGS_ALLOW_UNFREE = true;
  APP_ENV = "development";
  DART_SDK = "${pkgs.dart}";
  shellHook = ''
    export PATH="$PATH":"$HOME/.pub-cache/bin"
  '';
}
