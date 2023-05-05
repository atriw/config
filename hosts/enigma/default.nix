{suites, ...}: {
  imports = suites.laptop ++ [./hardware-configuration.nix];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "22.11";

  networking.proxy.default = "http://192.168.50.108:7890";
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
}
