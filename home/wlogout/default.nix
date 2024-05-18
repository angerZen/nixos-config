{
  config,
  pkgs,
  ...
}: {
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "${pkgs.hyprlock}/bin/hyprlock";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
      {
        label = "logout";
        action = "killall -9 Hyprland sleep 2";
        text = "Exit";
        keybind = "e";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Suspend";
        keybind = "u";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
    ];

    style = ''
      @import '../../.cache/wal/colors-waybar.css';
        * {
          background-image: none;
          transition: 20ms;
        }
        window {
          background-color: rgba(12,12,12,0.5);
        }
        button {
          color: @foreground;
          font-size:20px;
          background-repeat: no-repeat;
          background-position: center;
          background-size: 25%;
          border: 3px solid @background;
          background-color: @background;
          box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }
        button:focus,
        button:active {
          color: @foreground;
          background-color: @background;
          border: 3px solid @background;
        }
        /*
          -----------------------------------------------------
          Buttons
          -----------------------------------------------------
        */

        #lock,#logout,#suspend,#hibernate,#shutdown,#reboot {
          margin: 10px;
          border-radius: 8px;
        }
        #lock {
          background-image: image(url("assets/lock.png"));
        }
        #logout {
          background-image: image(url("assets/logout.png"));
        }
        #suspend {
          background-image: image(url("assets/suspend.png"));
        }
        #hibernate {
          background-image: image(url("assets/hibernate.png"));
        }
        #shutdown {
          background-image: image(url("assets/shutdown.png"));
        }
        #reboot {
          background-image: image(url("assets/reboot.png"));
        }
    '';
  };

  xdg.configFile."wlogout/assets" = {
    recursive = false;
    source = ./assets;
  };
}
