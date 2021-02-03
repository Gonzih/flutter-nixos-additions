{ pkgs ? import <nixpkgs> {} }:

(pkgs.buildFHSUserEnv {
  name = "flutter-fhs-env";
  multiPkgs = pkgs: [
    # Flutter only use these certificates
    (pkgs.runCommand "fedoracert" { } ''
      mkdir -p $out/etc/pki/tls/
      ln -s ${pkgs.cacert}/etc/ssl/certs $out/etc/pki/tls/certs
    '')
    pkgs.zlib
  ];
  targetPkgs = pkgs: (with pkgs; [
    bash
    curl
    git
    unzip
    which
    xz

    # flutter test requires this lib
    libGLU

    # for android emulator
    alsaLib
    dbus
    expat
    libpulseaudio
    libuuid
    libGL
    nspr
    nss
    systemd
  ]) ++ (with pkgs.xorg; [
    libX11
    libxcb
    libXcomposite
    libXcursor
    libXdamage
    libXext
    libXfixes
    libXi
    libXrender
    libXtst
  ]);
  profile = ''
    export FLUTTER_SDK="$HOME/opt/flutter"
    export DART_SDK="$FLUTTER_SDK/bin/cache/dart-sdk"
    export PATH="$PATH":"$DART_SDK/bin":"$FLUTTER_SDK/bin"
  '';
  runScript = "bash";
}).env
