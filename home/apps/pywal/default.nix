with lib; let
  cfg = config.programs.pywal;
in {
  options = {programs.pywal = {enable = mkEnableOption "pywal";};};

  config = mkIf cfg.enable {
    home.packages = with pkgs; [pywal pywalfox-native];

    programs.kitty.extraConfig = ''
      include ${config.xdg.cacheHome}/wal/colors-kitty.conf
    '';

    programs.wofi.style = ''
      include ${config.xsg.cacheHome}/wal/colors.css
    '';

    # wal generates and that's the one we should load from /home/teto/.cache/wal/colors.Xresources ~/.Xresources
    xsession.windowManager.i3 = {
      extraConfig = ''
        set_from_resource $bg           i3wm.color0 #ff0000
        set_from_resource $bg-alt       i3wm.color14 #ff0000
        set_from_resource $fg           i3wm.color15 #ff0000
        set_from_resource $fg-alt       i3wm.color2 #ff0000
        set_from_resource $hl           i3wm.color13 #ff0000
      '';

      config.colors = {
        focused = {
          border = "$fg-alt";
          background = "$bg";
          text = "$hl";
          indicator = "$fg-alt";
          childBorder = "$hl";
        };

        focusedInactive = {
          border = "$fg-alt";
          background = "$bg";
          text = "$fg";
          indicator = "$fg-alt";
          childBorder = "$fg-alt";
        };

        unfocused = {
          border = "$fg-alt";
          background = "$bg";
          text = "$fg";
          indicator = "$fg-alt";
          childBorder = "$fg-alt";
        };

        urgent = {
          border = "$fg-alt";
          background = "$bg";
          text = "$fg";
          indicator = "$fg-alt";
          childBorder = "$fg-alt";
        };

        background = "$bg";
      };
    };
  };
}
