{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "yamifrankc";
  home.homeDirectory = "/home/yamifrankc";

programs.zsh = {
  enable = true;
    enableCompletion = true;
  enableAutosuggestions = true;
  syntaxHighlighting.enable = true;
  shellAliases = {  
    ll = "ls -l";
    wifisetup = "nmtui";
    tree = "tree -C";
    calculator = "bc";
    ls = "eza";
    pokesay = "pokemonsay"; 
  };
#  antidote = {  
 #   enable = true;
  #  plugins = [ "rupa/z"];
 # };
};

#programs.starship = { 
 # enable = true;






  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello
    cowsay
    htop
    godot_4
    pokemonsay
    rofi
    figurine
    zsh-autocomplete
    fortune
    todofi-sh
    todo-txt-cli
    thefuck
    kitty
    bash
    zsh-you-should-use
    tree
    fzf
    starship

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    ".config/todofish.conf".source = ./programs/todofish/todofish.conf;
    ".config/todo" = {
     source = ./programs/todo;
     recursive = true;
     };
    ".config/zellij" = {
      source = ./programs/zellij;
      recursive = true;
      };
    ".i3blocks.conf".source = ./programs/i3block/i3block.conf;
    ".config/i3" = {
       source = ./programs/i3;
       recursive = true;
       };
    ".config/rofi" = {
       source = ./programs/rofi;
       recursive = true;
       };
    ".config/awesome" = {
	source = ./programs/awesome;
	recursive = true;
	};
    ".config/kitty" = {
	source = ./programs/kitty;
	recursive = true;
	};
    ".config/starship.toml".source = ./programs/starship/starship.toml;
    ".vimrc".source = ./programs/vim/vimrc;
    ".zshrc".source = ./programs/zsh/zshrc;
    ".tmux.conf".source = ./programs/tmux/tmux.conf;
    ".tmux" = {
	source = ./programs/tmux/tmux;
	recursive = true;
	};
  };


  
  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/yamifrankc/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;


}
