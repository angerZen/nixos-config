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

    ./firefox
    ./discord
    ./scripts
    ./hyprland

    ./games

    ./wayland/mako
    ./wayland/hypridle
    ./wayland/hyprlock
    ./wayland/waybar
    ./wayland/wlogout
    ./wayland/foot
    ./wayland/rofi

    ./qmk
    ./vscode
    ./utilities/git
    ./utilities/bat
    ./utilities/neofetch
    ./utilities/btop

    ./theme/pywal
    ./theme/gtk
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
    btop
    playerctl
    pamixer
    xfce.thunar
    neofetch
    zathura
    pcmanfm

    # Multimedia
    mpv
    imv
    cider

    # Nixos
    nix-prefetch-github

    (python311.withPackages (ps:
      with ps; [
        requests
        datetime
      ]))

    wofi
  ];

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];

  programs.home-manager.enable = true;
  programs.git.enable = true;

  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
