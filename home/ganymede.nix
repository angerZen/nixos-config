# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    ./apps/firefox
    ./apps/discord
    ./scripts
    ./desktop/hyprland

    ./games

    ./apps/mako
    ./apps/waybar
    ./apps/wlogout
    ./apps/wofi

    ./apps/qmk
    ./apps/vscode
    ./apps/git
    ./apps/bat
    ./apps/neofetch
    ./apps/btop
    ./apps/cider

    ./apps/pywal
    ./apps/gtk
  ];

  nixpkgs = {
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "angerzen";
    homeDirectory = "/home/angerzen";
  };

  home.packages = with pkgs; [
    pavucontrol

    # utilites
    unzip
    pcmanfm

    # Multimedia
    imv

    # Nixos
    nix-prefetch-github
  ];

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
