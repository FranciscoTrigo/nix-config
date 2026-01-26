# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:


{

  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];


  programs.hyprland = {
   enable = true;
   xwayland.enable = true;
   };

  programs.sway = {
   enable = true;
   wrapperFeatures.gtk = true;
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 5";
    };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "anomalocarisNix"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [
       networkmanager-openvpn
       networkmanager-vpnc
    ];
};



  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  #services.libinput.enable = true;
  services.libinput = {
    enable = true;
    
    mouse = {
      accelProfile = "flat";  # or "adaptive"
      accelSpeed = "0";
    };
    
    touchpad = {
      tapping = true;
      naturalScrolling = false;
      disableWhileTyping = true;
      clickMethod = "clickfinger";  # two-finger = right-click, three-finger = middle-click
    };
  };

# samba shares
  services.gvfs = {
   enable = true;
};

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.dpi = 144;

  # Enable this for firmware update on framework 16
  services.fwupd.enable = true;

  # Enable the XFCE Desktop Environment.
#  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xfce = {
     enable = true;
     noDesktop = true;
     enableXfwm = false;
  };

  # enable Qtile
  services.xserver.windowManager.qtile = {
    enable = true;
    extraPackages = python3Packages: with python3Packages; [
       qtile-extras
    ];
};


  
  #enable fingerprint reader
  services.fprintd.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  security.pam.services.sddm.enableGnomeKeyring = true;

  #enable awesome WM
  services.xserver.windowManager.awesome = {
    enable = true;
    luaModules = with pkgs.luaPackages; [
	luarocks
	luadbi-mysql
	];
	};	

  services.xserver.windowManager.i3 = {
  #package = pkgs.i3-gaps;
  package = pkgs.i3;
  enable = true;
  extraPackages = with pkgs; [
    i3status
    i3lock
    i3blocks
    polybar
  ];
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

 services = { 
   syncthing = {
     enable = true;
     user = "yamifrankc";
     dataDir = "/home/yamifrankc";
     configDir = "/home/yamifrankc/.config/syncthing";
};
};

 # Enable bluetooth stuff
 hardware.bluetooth.enable = true;
 hardware.bluetooth.powerOnBoot = false; # Set true to enable on boot
 services.blueman.enable = true;

 # enable QMK stuff
 hardware.keyboard.qmk.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  #sound.enable = true;
  #hardware.pulseaudio.enable = false;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.yamifrankc = {
    isNormalUser = true;
    description = "yamifrankc";
    extraGroups = [ "networkmanager" "wheel" "input" "video" "audio" ];
    packages = with pkgs; [
      firefox
    #  thunderbird
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.permittedInsecurePackages = [ "electron-25.9.0" ];


 ### Packages
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
   wget
   via
   libinput
   wofi
   waybar
   dunst
   hyprpaper
   grim # screenshot in wayland
   slurp # screenshot in wailand
   wl-clipboard #
   mako #notification system developed by a person
   lxqt.lxqt-policykit
   cacert
   openssl
   #niri
   neofetch
   tmux
   git
   lua
   love
   flameshot
   clipit
   libnotify
   zellij
   feh
   pokemon-cursor
   ashell
   psmisc
   gsimplecal
   waybar
   swww
   sqlite
   bat
   fish
   bsdgames
   prusa-slicer
   chromium
   emacs
   eza
   awscli2
   mplayer
   #mongodb
   #nodejs_21
   obsidian
   ripgrep
   amfora
   lagrange
   coreutils
   fd
   cifs-utils
   pcmanfm
   xclip
   scrot
   graphviz
   shellcheck
   logseq
   hugo
   openvpn
   networkmanager-vpnc
   networkmanager-openvpn
   pinentry-gnome3
   #obsidian
   dwarf-fortress
   clang
   python3
   zsh
   nixfmt
   pokete
   pinentry-curses
   discord
   espanso
   swaybg
   vscode.fhs
   home-manager
  ];

fonts.packages = with pkgs; [
  # ... other fonts ...
  iosevka
  nerd-fonts.fira-code
  nerd-fonts.droid-sans-mono
  nerd-fonts.iosevka
];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
     enable = true;
     pinentryPackage = with pkgs; pinentry-curses;
     enableSSHSupport = true;
   };

 services.gnome.gnome-keyring.enable = true;
 security.pam.services.hyprland.enableGnomeKeyring = true;


  # Alternatively, you can use the `authUserPassFile` attribute if you are using
  # a Nix secrets manager. Here's an example using sops-nix.
  #
  # The secret you provide to `authUserPassFile` should be a multiline string with
  # a single username on the first line a single password on the second line.

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  services.udev.packages = [ pkgs.via ];
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
