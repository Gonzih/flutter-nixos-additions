.SHELLFLAGS =
SHELL=./scripts/shell.sh

shell:
	nix-shell shell.nix

run:
	flutter run

clean:
	flutter clean

flutter-deps:
	flutter packages get
