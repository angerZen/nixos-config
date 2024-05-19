{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [waypaper];

  xdg.configFile."waypaper/config.ini".text = ''
    [Settings]
    language = en
    folder = /home/angerzen/Pictures/wallpapers
    wallpaper = /home/angerzen/Pictures/wallpapers/wallhaven-2ywxm9.jpg
    backend = swww
    monitors = All
    fill = Fill
    sort = name
    color = #000000
    subfolders = False
    post_command =
    swww_transition_type = any
    swww_transition_step = 90
    swww_transition_angle = 0
    swww_transition_duration = 1
  '';
}
