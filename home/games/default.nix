{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    lutris
    protonup-qt
    protontricks
    wine
    obs-studio
  ];
}
