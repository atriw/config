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

  environment.sessionVariables = {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_BIN_HOME = "$HOME/.local/bin";
  };

  services.xserver = {
    enable = true;
    windowManager = {
      bspwm = {
        enable = true;
      };
    };
    displayManager = {
      lightdm.enable = true;
      lightdm.greeters.mini = {
        enable = true;
        user = "atriw";
      };
      defaultSession = "none+bspwm";
      autoLogin = {
        enable = true;
        user = "atriw";
      };
      sessionCommands = ''
        ${pkgs.xorg.xrdb}/bin/xrdb -merge <<EOF
          xterm*faceName: FiraCode Nerd Font
          xterm*faceSize: 20
          Xcursor.theme: Adwaita
          Xcursor.size: 32
        EOF
      '';
    };
    libinput = {
      enable = true;
      touchpad.naturalScrolling = true;
      touchpad.disableWhileTyping = true;
    };
    dpi = 150;
  };

  services.picom = {
    enable = true;
    backend = "glx";
    vSync = true;
    opacityRules = [
      "90:class_g = 'Alacritty' && focused"
      "60:class_g = 'Alacritty' && !focused"
      "100:class_g = 'Rofi'"
    ];
    shadowExclude = [
      "! name~='(rofi|scratch|Dunst)$'"
    ];
    settings = {
      blur-background-exclude = [
        "window_type = 'dock'"
        "window_type = 'desktop'"
        "class_g = 'Rofi'"
        "_GTK_FRAME_EXTENTS@:c"
      ];
      unredir-if-possible = true;
      glx-no-stencil = true;
      xrender-sync-fence = true;
    };
  };

  hardware.pulseaudio = {
    enable = true;
  };

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      source-han-sans
      source-han-serif
      sarasa-gothic
      inter
      source-sans-pro
      source-serif-pro
      (nerdfonts.override {fonts = ["Iosevka" "FiraCode"];})

      material-design-icons
      font-awesome
      meslo-lgs-nf
    ];
    fontconfig = {
      defaultFonts = {
        emoji = ["Noto Color Emoji"];
        monospace = [
          "Noto Sans Mono CJK SC"
          "Sarasa Mono SC"
          "Inter"
          "Iosevka"
          "FiraCode Nerd Font"
        ];
        sansSerif = [
          "Noto Sans CJK SC"
          "Source Han Sans SC"
          "Source Sans Pro"
        ];
        serif = [
          "Noto Serif CJK SC"
          "Source Han Serif SC"
          "Source Serif Pro"
        ];
      };
    };
  };

  i18n = {
    defaultLocale = "zh_CN.UTF-8";
    inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-rime
        fcitx5-chinese-addons
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    dunst
    libnotify
    (polybar.override {
      pulseSupport = true;
    })
    firefox
  ];

  programs.dconf.enable = true;
}
