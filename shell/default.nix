{
  pkgs,
  inputs,
  ...
}: let
  pkgWithCategory = category: package: {inherit package category;};
  dev = pkgWithCategory "dev";
  formatter = pkgWithCategory "formatter";
in {
  imports = [];

  packages = with pkgs; [
    alejandra
    editorconfig-checker
  ];

  commands = with pkgs; [
    (dev nixUnstable)
    (dev agenix)
    (dev cachix)
    (formatter treefmt)
  ];
}
