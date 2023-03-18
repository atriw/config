{
  config,
  lib,
  pkgs,
  ...
}: let
  packages = with pkgs; [
    httpie # curl
    duf # df
    du-dust # du
    tldr # man
    sd # sed
    difftastic # diff
    lnav # browse log files

    fortune
    gum # interactive shell script
    glow # markdown
    sqlite
    unzip
    cloc
    shellcheck
    just # make
  ];
  program_list = [
    "git"
    "starship"
    "exa" # ls
    "bat" # cat
    "fzf"
    "mcfly"
    "direnv"
    "zellij" # tmux
    "btop" # htop
    "broot" # tree
    "jq"
    "lazygit"
    "pandoc"
    "zoxide" # z
  ];
  configs = {
    git.delta.enable = true;
    git.extraConfig = {
      credential.helper = "store";
    };
    exa.enableAliases = true;
    bat.config = {theme = "TwoDark";};
    fzf.defaultCommand = "rg --files --hidden --glob '!.git'";
    fzf.defaultOptions = ["--height=40%" "--layout=reverse" "--border" "--margin=1" "--padding=1"];
    mcfly.keyScheme = "vim";
    direnv.nix-direnv.enable = true;
    zellij.settings = {
      pane_frames = false;
      default_mode = "locked";
      default_layout = "compact";
    };
  };
in {
  home.packages = packages;
  programs = lib.recursiveUpdate (lib.genAttrs program_list (_: {enable = true;})) configs;
}
