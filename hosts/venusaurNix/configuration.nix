# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

{

  networking.hostName = "venusaurNix";
  environment.shells = with pkgs; [ zsh ] ;
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  imports = [
    # include NixOS-WSL modules
    <nixos-wsl/modules>
  ];

  wsl.enable = true;
  wsl.defaultUser = "nixos";

  users.users.yamifrankc = {
    isNormalUser = true;
    home = "/home/yamifrankc";
    description = "yamifrankc";
    extraGroups = [ "networkmanager" "wheel" ];
};  

  # allow unfree
  nixpkgs.config.allowUnfree = true;

  # packages
  environment.systemPackages = with pkgs; [
  vim
  git
  tmux
  bat
  emacs
  ripgrep
  coreutils
  fd
  xclip
  hugo
  home-manager
  zsh
  scrot
  nixfmt
  graphviz
  wget
  tmux
  ];

  fonts.packages = with pkgs; [ 
  iosevka
  (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Iosevka" ]; })
];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
