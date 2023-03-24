{
  config,
  pkgs,
  ...
}: {
  wsl = {
    enable = true;
    startMenuLaunchers = true;
    wslConf = {
      interop.appendWindowsPath = false;
    };
  };
}
