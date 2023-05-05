{
  hmUsers,
  pkgs,
  ...
}: {
  home-manager.users = {inherit (hmUsers) atriw;};

  users.users.root.hashedPassword = "*";

  users.users.atriw = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
    shell = pkgs.zsh;
    # TODO: use agenix
    password = "nixos";
  };
}
