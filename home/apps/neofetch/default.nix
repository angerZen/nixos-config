{pkgs, ...}: {
  home.packages = with pkgs; [
    neofetch
  ];
  xdg.configFile."neofetch".source = ./neofetch;
}
