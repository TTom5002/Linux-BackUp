{ config, pkgs, ... }:

{  
  imports = [
    ./cpp.nix
    ./webdev.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "tomast";
  home.homeDirectory = "/home/tomast";


  nixpkgs.config.allowUnfree = true;
  
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment
  home.packages = with pkgs; [
    wl-clipboard 
    lua-language-server
    tree-sitter
    ripgrep

    python3
    python3Packages.pynvim

    libreoffice

    gparted

    ranger
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
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/tomast/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
     EDITOR = "nvim";
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = 
      (with pkgs.vimPlugins; [
        mini-pick
        nvim-lspconfig
        oil-nvim
        nvim-dap
        nvim-dap-lldb
        nvim-dap-ui
        nvim-dap-virtual-text
        nvim-treesitter.withAllGrammars
        nvim-treesitter-refactor
        nord-nvim
        nightfly
        vim-css-color
        emmet-vim

        nvim-cmp
        cmp-nvim-lsp
        cmp-buffer
        cmp-path
        luasnip
      ]);
    extraPackages = with pkgs; [
       texlive.combined.scheme-full
       texlab
       sioyek
    ];
     #  ++ [
     #   (pkgs.neovimUtils.buildVimPlugin {
     #    name = "oil-nvim";
     #    src = pkgs.lua54Packages.oil-nvim;
     #  })
     # ];
  };

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [

    ];
  };

  programs.git = {
    enable = true;
    userName = "Tomáš Tomšů";
    userEmail = "t.tomt5002@gmail.com";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
