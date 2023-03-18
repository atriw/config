{
  config,
  pkgs,
  ...
}: {
  wsl = {
    enable = true;
    automountPath = "/mnt";
    startMenuLaunchers = true;
  };
}
