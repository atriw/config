{hmUsers, ...}: {
  home-manager.users = {inherit (hmUsers) atriw;};

  users.users.atriw = {
    password = "nixos";
    isNormalUser = true;
    extraGroups = ["wheel"];
  };
}

