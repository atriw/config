{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.modules.doomemacs;
  inherit (config) configDir;
in {
  options = {
    modules.doomemacs = {
      enable = mkEnableOption "Doomemacs";
    };
  };

  config = mkIf cfg.enable {
    programs.doom-emacs = rec {
      enable = true;
      doomPrivateDir = pkgs.callPackage "${configDir}/doom" {};
      doomPackageDir = let
        filteredPath = builtins.path {
          path = doomPrivateDir;
          name = "doom-private-dir-filtered";
          filter = path: type:
            builtins.elem (baseNameOf path) ["init.el" "packages.el"];
        };
      in
        pkgs.linkFarm "doom-packages-dir" [
          {
            name = "init.el";
            path = "${filteredPath}/init.el";
          }
          {
            name = "packages.el";
            path = "${filteredPath}/packages.el";
          }
          {
            name = "config.el";
            path = pkgs.emptyFile;
          }
        ];
    };

    fonts.fontconfig.enable = true;
    home.packages = with pkgs; [emacs-all-the-icons-fonts];
    services.emacs.enable = true;
    services.emacs.client.enable = true;
  };
}
