{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./swww.nix
    ./hyperidle.nix
    ./hyperlock.nix
    ./waypaper.nix
  ];

  systemd.user.targets.hyprland-session.Unit.Wants = ["xdg-desktop-autostart.target"];

  home.packages = with pkgs; [
    hyprpicker
    hyprshot
    hyprcursor
    wlr-randr
    wayland-utils
    wayland-protocols
    wl-clipboard
    mate.mate-polkit
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    systemd.variables = ["--all"];
    xwayland = {
      enable = true;
      #       hidpi = true;
    };
    settings = {
      "$mainMod" = "SUPER";
      monitor = [
        ",3440x1440@120,0x0,1"
      ];
      source = [
        "/home/angerzen/.cache/wal/colors-hyprland.conf"
      ];
      input = {
        kb_layout = "us";
        numlock_by_default = true;
        follow_mouse = 1;
        sensitivity = 0;
      };
      misc = {
        vfr = true;
        vrr = 1;
        layers_hog_keyboard_focus = true;
        disable_autoreload = true;
        disable_hyprland_logo = true;
        always_follow_on_dnd = true;
        animate_manual_resizes = true;
        enable_swallow = true;
        focus_on_activate = true;
        disable_splash_rendering = true;
        animate_mouse_windowdragging = true;
        mouse_move_enables_dpms = false; #prevents accidental wake up
        key_press_enables_dpms = true;
      };
      general = {
        gaps_in = 4;
        gaps_out = 8;
        border_size = 2;
        "col.inactive_border" = "rgba(000000ee)";
        apply_sens_to_raw = 1;
        resize_on_border = true;
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      decoration = {
        rounding = 2;
        active_opacity = 0.95;
        inactive_opacity = 0.5;
        # multisample_edges = true;
        drop_shadow = true;
        shadow_ignore_window = true;
        shadow_offset = "0 8";
        shadow_range = 50;
        shadow_render_power = 3;
        "col.shadow" = "rgba(00000099)";
        blur = {
          size = 3;
          passes = 2;
          new_optimizations = true;
          ignore_opacity = true;
          # noise = "0.18";
          contrast = "1";
          brightness = "0.9";
          xray = false;
        };
      };
      animations = {
        enabled = true;
        bezier = "overshot, 0.13, 0.99, 0.29, 1.1";
        animation = [
          "windows, 1, 4, overshot, slide"
          "windowsOut, 1, 4, overshot, slide"
          "border, 1, 4, overshot"
          "fade, 1, 4, overshot"
          "workspaces, 1, 4, overshot"
          "specialWorkspace, 1, 5, overshot, slidevert"
        ];
      };
      bind = [
        # basic bindings
        "$mainMod, Q, killactive,"
        "$mainMod, F, fullscreen,"
        "$mainMod, Space, togglefloating,"
        "$mainMod, P, pseudo,"
        "$mainMod, Y, pin,"
        "$mainMod, S, togglesplit,"
        "$mainMod, C, exec, hyprctl dispatch centerwindow none"
        "SUPER, M, movetoworkspace, special"
        "$mainMod SHIFT, M, togglespecialworkspace"
        "$mainMod, mouse_down, workspace, e-1"
        "$mainMod, mouse_up, workspace, e+1"
        # shortcuts bindings
        "$mainMod, T, exec, foot"
        "$mainMod SHIFT, Return, exec, foot --fullscreen"
        "$mainMod, R, exec, pkill rofi || rofi -show drun"
        "$mainMod SHIFT, Z, exec, pkill rofi || rofi -show run"
        "$mainMod, W, exec, pkill rofi || wallpaper-picker"
        # "$mainMod SHIFT, W, exec, pkill rofi || reload"
        "SUPER, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
        "$mainMod, X, exec, pkill wlogout || launch-wlogout"
        "$mainMod, B, exec, pkill -SIGUSR1 .waybar-wrapped"
        "$mainMod SHIFT, c ,exec, hyprpicker -a"
        # screenshots bindings
        '',Print, exec, grimblast --notify --cursor save area ~/Pictures/screenshots/screenshot_$(date +"%b_%-d_%Y_%H:%M:%S").png''
        "$mainMod, Print, exec, grimblast --notify --cursor  copy area"
        # switch workspaces bindings
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        # move windows to workspace bindings
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        # switch focus bindings
        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"
        # window move bindings
        "SUPER SHIFT, h, movewindow, l"
        "SUPER SHIFT, l, movewindow, r"
        "SUPER SHIFT, k, movewindow, u"
        "SUPER SHIFT, j, movewindow, d"
        # window reposition bindings
        "SUPER SHIFT, h, moveactive,  -80 0"
        "SUPER SHIFT, l, moveactive, 80 0"
        "SUPER SHIFT, k, moveactive, 0 -80"
        "SUPER SHIFT, j, moveactive, 0 80"
        # window resize bindings
        "SUPER CTRL, h, resizeactive, -80 0"
        "SUPER CTRL, l, resizeactive, 80 0"
        "SUPER CTRL, k, resizeactive, 0 -80"
        "SUPER CTRL, j, resizeactive, 0 80"
        # volume control bindings
        ",XF86AudioRaiseVolume,exec, pamixer -i 5"
        ",XF86AudioLowerVolume,exec, pamixer -d 5"
        ",XF86AudioMute,exec, pamixer -t"
        # music control bindings
        ",XF86AudioPlay,exec, playerctl play-pause"
        ",XF86AudioNext,exec, playerctl next"
        ",XF86AudioPrev,exec, playerctl previous"
        ",XF86AudioStop, exec, playerctl stop"
      ];
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
      windowrule = [
        "size 700 450, pavucontrol"
        "move 1200 72, pavucontrol"
        "float,title:^(Transmission)$"
        "float,title:^(Volume Control)$"
        "float, Nautilus"
        "float, wlogout"
        "noanim, wlogout"
        "float,mpv"
        "move 510 290,mpv"
        "size 900 500,mpv"
        "idleinhibit focus,mpv"
        "float,imv"
        "move 510 290,imv"
        "size 900 500,imv"
        "float,title:^(Firefox — Sharing Indicator)$"
        "move 0 0,title:^(Firefox — Sharing Indicator)$"
      ];
      windowrulev2 = [
        "float, title:^(Picture-in-Picture)$"
        "opacity 1.0 override 1.0 override, title:^(Picture-in-Picture)$"
        "pin, title:^(Picture-in-Picture)$"
        "idleinhibit fullscreen, class:^(firefox)$"
        "idleinhibit focus, class:^(mpv)$"
      ];
      exec-once = [
        "${pkgs.hypridle}/bin/hypridle"
        "hyprctl setcursor Catppuccin-Latte-Dark 16 &"
        "exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "exec-once=waypaper --restore"
        "wl-paste --type text --watch cliphist store &"
        "wl-paste --type image --watch cliphist store &"
        "waybar &"
        "mako -c /home/angerzen/.cache/wal/mako.conf"
        "${pkgs.mate.mate-polkit}/libexec/polkit-mate-authentication-agent-1 &"
        "sleep 5 && discord --start-minimized &"
        "exec systemctl --user import-environment PATH"
        "systemctl --user restart xdg-desktop-portal.service"
      ];
    };
    extraConfig = "general:col.active_border = $color2 $color3 $color4 $color5 45deg";
  };
}
