{pkgs, ...}: {
  programs.steam.enable = true;
  programs.gamescope.enable = true;
  environment.systemPackages = with pkgs; [
    protonup-qt
    lutris
  ];
}
