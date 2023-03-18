{suites, ...}: {
  ### root password is empty by default ###
  imports = suites.wsl-dev;

  system.stateVersion = "22.11";

  wsl.defaultUser = "atriw";
}
