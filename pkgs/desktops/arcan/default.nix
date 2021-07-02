{ callPackage, lib, pkgs }:

rec {
  # Dependencies

  espeak = pkgs.espeak-ng;
  ffmpeg = pkgs.ffmpeg-full;
  harfbuzz = pkgs.harfbuzzFull;

  # Arcan

  arcan = callPackage ./arcan.nix { };
  arcan-wrapped = callPackage ./wrapper.nix { };
  xarcan = callPackage ./xarcan.nix { };
}
