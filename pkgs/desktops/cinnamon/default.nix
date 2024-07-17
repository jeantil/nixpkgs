{ config, pkgs, lib }:

lib.makeScope pkgs.newScope (self: with self; {
  iso-flags-png-320x420 = pkgs.iso-flags.overrideAttrs (p: p // {
    buildPhase = "make png-country-320x240-fancy";
    # installPhase = "mkdir -p $out/share && mv build/png-country-4x2-fancy/res-320x240 $out/share/iso-flags-png-320x420";
    installPhase = "mkdir -p $out/share && mv build/png-country-4x2-fancy/res-320x240 $out/share/iso-flags-png";
  });

  iso-flags-svg = pkgs.iso-flags.overrideAttrs (p: p // {
    buildPhase = "mkdir -p $out/share";
    installPhase = "mv svg $out/share/iso-flags-svg";
  });

  # Extensions added here will be shipped by default
  # We keep this in sync with a default Mint installation
  # Right now (only) nemo-share is missing
  nemoExtensions = [
    pkgs.folder-color-switcher
    nemo-emblems
    nemo-fileroller
    nemo-python
  ];

  cinnamon-common = callPackage ./cinnamon-common { };
  cinnamon-control-center = callPackage ./cinnamon-control-center { };
  cinnamon-desktop = callPackage ./cinnamon-desktop { };
  cinnamon-gsettings-overrides = callPackage ./cinnamon-gsettings-overrides { };
  cinnamon-menus = callPackage ./cinnamon-menus { };
  cinnamon-translations = callPackage ./cinnamon-translations { };
  cinnamon-screensaver = callPackage ./cinnamon-screensaver { };
  cinnamon-session = callPackage ./cinnamon-session { };
  cinnamon-settings-daemon = callPackage ./cinnamon-settings-daemon { };
  cjs = callPackage ./cjs { };
  nemo = callPackage ./nemo { };
  nemo-emblems = callPackage ./nemo-extensions/nemo-emblems { };
  nemo-fileroller = callPackage ./nemo-extensions/nemo-fileroller { };
  nemo-python = callPackage ./nemo-extensions/nemo-python { };
  nemo-with-extensions = callPackage ./nemo/wrapper.nix { };
  mint-l-theme = callPackage ./mint-l-theme { };
  mint-themes = callPackage ./mint-themes { };
  muffin = callPackage ./muffin { };
  xapp = callPackage ./xapp { };
}) // lib.optionalAttrs config.allowAliases {
  # Aliases need to be outside the scope or they will shadow the attributes from parent scope.
  bulky = lib.warn "cinnamon.bulky was moved to top-level. Please use pkgs.bulky directly." pkgs.bulky; # Added on 2024-07-14
  folder-color-switcher = lib.warn "cinnamon.folder-color-switcher was moved to top-level. Please use pkgs.folder-color-switcher directly." pkgs.folder-color-switcher; # Added on 2024-07-14
  mint-artwork = lib.warn "cinnamon.mint-artwork was moved to top-level. Please use pkgs.mint-artwork directly." pkgs.mint-artwork; # Added on 2024-07-14
  mint-cursor-themes = lib.warn "cinnamon.mint-cursor-themes was moved to top-level. Please use pkgs.mint-cursor-themes directly." pkgs.mint-cursor-themes; # Added on 2024-07-14
  mint-l-icons = lib.warn "cinnamon.mint-l-icons was moved to top-level. Please use pkgs.mint-l-icons directly." pkgs.mint-l-icons; # Added on 2024-07-14
  mint-x-icons = lib.warn "cinnamon.mint-x-icons was moved to top-level. Please use pkgs.mint-x-icons directly." pkgs.mint-x-icons; # Added on 2024-07-14
  mint-y-icons = lib.warn "cinnamon.mint-y-icons was moved to top-level. Please use pkgs.mint-y-icons directly." pkgs.mint-y-icons; # Added on 2024-07-14
  pix = lib.warn "cinnamon.pix was moved to top-level. Please use pkgs.pix directly." pkgs.pix; # Added on 2024-07-14
  warpinator = lib.warn "cinnamon.warpinator was moved to top-level. Please use pkgs.warpinator directly." pkgs.warpinator; # Added on 2024-07-14
  xapps = pkgs.cinnamon.xapp; # added 2022-07-27
  xreader = lib.warn "cinnamon.xreader was moved to top-level. Please use pkgs.xreader directly." pkgs.xreader; # Added on 2024-07-14
  xviewer = lib.warn "cinnamon.xviewer was moved to top-level. Please use pkgs.xviewer directly." pkgs.xviewer; # Added on 2024-07-14
}
