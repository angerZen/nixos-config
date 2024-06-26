{
  pkgs,
  self,
  lib,
  inputs,
  ...
}: {
  nixpkgs.overlays = [
    (final: prev: {
      waybar = prev.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
        postPatch =
          (oldAttrs.postPatch or "")
          + ''
            sed -i 's/zext_workspace_handle_v1_activate(workspace_handle_);/const std::string command = "hyprctl dispatch workspace " + name_;\n\tsystem(command.c_str());/g' src/modules/wlr/workspace_manager.cpp'';
      });
    })
  ];
  programs.waybar = {
    enable = true;
    systemd = {
      enable = false;
      target = "graphical-session.target";
    };
    settings = [
      {
        layer = "top";
        position = "top";
        modules-left = [
          "custom/launcher"
          "hyprland/workspaces"
          "idle_inhibitor"
          # "cava"
          "custom/cava-internal"
        ];
        modules-center = [
          "clock"
          "custom/weather"
        ];
        modules-right = [
          "pulseaudio"
          "pulseaudio#microphone"
          "memory"
          "cpu"
          "network"
          "tray"
        ];
        "custom/launcher" = {
          "format" = " ";
          "on-click" = "pkill rofi || rofi -show drun";
        };
        "idle_inhibitor" = {
          "format" = "{icon}";
          "format-icons" = {
            "activated" = "";
            "deactivated" = "";
          };
        };
        "hyprland/workspaces" = {
          "format" = "{icon}";
          "on-click" = "activate";
          "on-scroll-up" = "hyprctl dispatch workspace e+1";
          "on-scroll-down" = "hyprctl dispatch workspace e-1";
          "format-icons" = {
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "10" = "10";
          };
        };
        "custom/cava-internal" = {
          "exec" = "sleep 1s && cava-internal";
          "tooltip" = false;
        };
        "temperature" = {
          "thermal-zone" = 2;
          "hwmon-path" = "/sys/class/hwmon/hwmon2/temp1_input";
          "format" = " {temperatureC}°C";
        };
        "pulseaudio" = {
          "scroll-step" = 5;
          "format" = "{icon} {volume}%";
          "format-muted" = "󰸈 Muted";
          "format-icons" = {
            "default" = ["" "" "󱄠"];
          };
          "on-click" = "pamixer -t";
          "on-click-right" = "pavucontrol";
        };
        "pulseaudio#microphone" = {
          "format" = "{format_source}";
          "format-source" = "󰍬 {volume}%";
          "format-source-muted" = "󰍭 Muted";
          "on-click" = "pamixer --default-source -t";
          "on-scroll-up" = "pamixer --default-source -i 5";
          "on-scroll-down" = "pamixer --default-source -d 5";
          "scroll-step" = 5;
          "on-click-right" = "pavucontrol";
        };
        "clock" = {
          "interval" = 1;
          # "format" = "{:%I:%M %p  %A %b %d}";
          "format" = "{:%A %d %b - %OI:%M %p}";
          "tooltip-format" = "<tt>{calendar}</tt>";
        };
        "memory" = {
          "interval" = 3;
          "format" = " {percentage}%";
        };
        "cpu" = {
          "interval" = 3;
          "format" = " {usage}%";
        };
        "network" = {
          "interval" = 1;
          "format" = "󰣺 Connected";
          "format-alt" = " {bandwidthUpBytes} -  {bandwidthDownBytes}";
          "format-disconnected" = "󰣼 Disconnected";
        };
        "custom/weather" = {
          "exec" = "python3 ~/.config/waybar/weather.py";
          "restart-interval" = 300;
          "return-type" = "json";
        };
        "tray" = {
          "icon-size" = 20;
          "spacing" = 8;
        };
      }
    ];

    style = "

          @import '../../.cache/wal/colors-waybar.css';
          * {
            font-family: Fira Code;
            font-weight: bold;
            font-size: 14px;
            min-height: 0;
          }
          @keyframes blink {
            to {
              background-color: rgb(242, 143, 173);
              color: rgb(26, 24, 38);
            }
          }
          .warning, .critical, .urgent {
            animation-name: blink_red;
            animation-duration: 1s;
            animation-timing-function: linear;
            animation-iteration-count: infinite;
            animation-direction: alternate;
          }
          window#waybar {
            background-color: rgba(0, 0, 0, 0.3);
            transition-property: background-color;
            transition-duration: 0.5s;
            transition: all linear 0.5s;
          }
          .modules-right {
            margin-right: 15px;
          }
          .modules-left {
            margin-left: 15px;
          }
          #workspaces {
            padding: 0px;
          }
          #workspaces button {
            padding: 4px 6px;
            margin: 4px 2px;
            border-radius: 5px;
            background-color: @background;
            color: @foreground;
          }
          #workspaces button.active {
            background-color: @color2;
            border-radius: 5px;
            color: @foreground;
          }
          #workspaces button:hover {
            color: @color2;
            background: @background;
            border: 0px solid @color2;
            box-shadow: inherit;
            text-shadow: inherit;
          }
          #workspaces button.active:hover {
            background-color: @color2;
            color: @foreground;
          }
          tooltip {
            background-color: @background;
            border-radius: 0px;
            border: 2px solid @color2;
          }
          tooltip label {
            color: @foreground;
          }
          #custom-launcher {
            font-size: 16px;
            padding-left: 10px;
            padding-right: 6px;
            color: @color2;
          }
          #clock {
            border-radius: 5px;
            padding: 4px 6px;
            margin: 4px 2px;
            font-family: Comfortaa;
            color: @foreground;
          }
          #memory,
          #temperature,
          #custom-weather,
          #cpu,
          #mpd,
          #custom-wall,
          #temperature,
          #backlight,
          #pulseaudio,
          #network,
          #battery,
          #disk,
          #idle_inhibitor
          {
            padding-left: 8px;
            padding-right: 8px;
            color: @foreground;
          }

          #custom-cava-internal {
            margin-left: 10px;
            color: @color2;
          }

          #memory, #cpu, #clock, #pulseaudio, #network {
            background-color: @color2;
            border-radius: 5px;
            padding: 0px 8px;
            margin: 4px;
            color: @foreground;
          }

          #tray {
            margin: 0px 10px 0px 4px;
          }

          #memory {
            border-radius: 5px;
            margin-right: 0px;
          }

          #cpu {
            border-radius: 5px;
            margin-left: 0px;
          }

          #pulseaudio {
            border-radius: 5px;
            margin-right: 0px;
          }

          #pulseaudio.microphone {
            border-radius: 5px;
            margin-left: 0px;
            margin-right: 4px;
          }

          #custom-cava-internal {
            padding-left: 10px;
            padding-right: 10px;
          }
          #custom-weather {
            padding: 4px 6px;
            margin: 4px 2px;
            padding-left: 10px;
            padding-right: 10px;
            background-color: @color2;
            border-radius: 5px;
          }
            ";
  };
  xdg.configFile."waybar/weather.py".text = ''
    #!/usr/bin/env python
    import json
    import requests
    from datetime import datetime

    WEATHER_CODES = {
        '113': '☀️',
        '116': '⛅️',
        '119': '☁️',
        '122': '☁️',
        '143': '🌫',
        '176': '🌦',
        '179': '🌧',
        '182': '🌧',
        '185': '🌧',
        '200': '⛈',
        '227': '🌨',
        '230': '❄️',
        '248': '🌫',
        '260': '🌫',
        '263': '🌦',
        '266': '🌦',
        '281': '🌧',
        '284': '🌧',
        '293': '🌦',
        '296': '🌦',
        '299': '🌧',
        '302': '🌧',
        '305': '🌧',
        '308': '🌧',
        '311': '🌧',
        '314': '🌧',
        '317': '🌧',
        '320': '🌨',
        '323': '🌨',
        '326': '🌨',
        '329': '❄️',
        '332': '❄️',
        '335': '❄️',
        '338': '❄️',
        '350': '🌧',
        '353': '🌦',
        '356': '🌧',
        '359': '🌧',
        '362': '🌧',
        '365': '🌧',
        '368': '🌨',
        '371': '❄️',
        '374': '🌧',
        '377': '🌧',
        '386': '⛈',
        '389': '🌩',
        '392': '⛈',
        '395': '❄️'
    }

    data = {}


    weather = requests.get("https://wttr.in/?format=j1").json()


    def format_time(time):
        return time.replace("00", "").zfill(2)


    def format_temp(temp):
        return (hour['FeelsLikeF']+"°").ljust(3)


    def format_chances(hour):
        chances = {
            "chanceoffog": "Fog",
            "chanceoffrost": "Frost",
            "chanceofovercast": "Overcast",
            "chanceofrain": "Rain",
            "chanceofsnow": "Snow",
            "chanceofsunshine": "Sunshine",
            "chanceofthunder": "Thunder",
            "chanceofwindy": "Wind"
        }

        conditions = []
        for event in chances.keys():
            if int(hour[event]) > 0:
                conditions.append(chances[event]+" "+hour[event]+"%")
        return ", ".join(conditions)


    data['text'] = WEATHER_CODES[weather['current_condition'][0]['weatherCode']] + \
        " "+weather['current_condition'][0]['temp_F']+"°"

    data['tooltip'] = f"<b>{weather['current_condition'][0]['weatherDesc'][0]['value']} {weather['current_condition'][0]['temp_C']}°</b>\n"
    data['tooltip'] += f"Feels like: {weather['current_condition'][0]['FeelsLikeF']}°\n"
    data['tooltip'] += f"Wind: {weather['current_condition'][0]['windspeedMiles']}Mph\n"
    data['tooltip'] += f"Humidity: {weather['current_condition'][0]['humidity']}%\n"
    for i, day in enumerate(weather['weather']):
        data['tooltip'] += f"\n<b>"
        if i == 0:
            data['tooltip'] += "Today, "
        if i == 1:
            data['tooltip'] += "Tomorrow, "
        data['tooltip'] += f"{day['date']}</b>\n"
        data['tooltip'] += f"⬆️ {day['maxtempF']}° ⬇️ {day['mintempF']}° "
        data['tooltip'] += f"🌅 {day['astronomy'][0]['sunrise']} 🌇 {day['astronomy'][0]['sunset']}\n"
        for hour in day['hourly']:
            if i == 0:
                if int(format_time(hour['time'])) < datetime.now().hour-2:
                    continue
            data['tooltip'] += f"{format_time(hour['time'])} {WEATHER_CODES[hour['weatherCode']]} {format_temp(hour['FeelsLikeC'])} {hour['weatherDesc'][0]['value']}, {format_chances(hour)}\n"


    print(json.dumps(data))
  '';
}
