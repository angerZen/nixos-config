{pkgs, ...}: {
  home.packages = [
    pkgs.neofetch
  ];
  xdg.configFile."neofetch".source = ./neofetch;
}
