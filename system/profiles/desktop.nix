{
  config,
  pkgs,
  ...
}: {
  networking.networkmanager.enable = true;

  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";
    packages = with pkgs; [terminus_font];
  };

  services.xserver = {
    enable = true;
    windowManager.bspwm.enable = true;
    displayManager = {
      lightdm.enable = true;
      defaultSession = "none+bspwm";
      autoLogin = {
        enable = true;
        user = "atriw";
      };
      sessionCommands = ''
        ${pkgs.xorg.xrdb}/bin/xrdb -merge <<EOF
          xterm*faceName: FiraCode Nerd Font
          xterm*faceSize: 18
          Xcursor.theme: Adwaita
          Xcursor.size: 48
        EOF
      '';
    };
    libinput = {
      enable = true;
      touchpad.naturalScrolling = true;
    };
    dpi = 180;
  };

  fonts.fonts = with pkgs; [
    source-sans-pro
    source-serif-pro
    (nerdfonts.override {fonts = ["Iosevka" "FiraCode"];})
  ];

  fonts.fontconfig = {
    defaultFonts = {
      monospace = ["Iosevka"];
      sansSerif = ["Source Sans Pro"];
      serif = ["Source Serif Pro"];
    };
  };

  environment.systemPackages = with pkgs; [
    firefox
  ];
}
