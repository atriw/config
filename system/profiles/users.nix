{
  self,
  hmUsers,
  pkgs,
  ...
}: {
  home-manager.users = {inherit (hmUsers) atriw;};

  users.users.root.hashedPassword = "*";

  age.secrets.atriw.file = "${self}/secrets/atriw.age";
  users.users.atriw = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    shell = pkgs.zsh;
    passwordFile = "/run/agenix/atriw";
  };
}
