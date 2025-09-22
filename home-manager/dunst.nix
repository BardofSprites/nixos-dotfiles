{ lib, pkgs, config, inputs, ... }:
with lib;
let
  cfg = config.bardConfig.dunst;
in {
  options.bardConfig.dunst = {
    enable = mkEnableOption "Dunst notification daemon";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ libnotify ];

    services.dunst = {
      enable = true;

      settings = {
        global = {
          monitor = 0;
          follow = "none";
          width = 300;
          height = 300;
          origin = "top-right";
          offset = "10x50";
          scale = 0;
          notification_limit = 0;

          progress_bar = true;
          progress_bar_height = 10;
          progress_bar_frame_width = 1;
          progress_bar_min_width = 150;
          progress_bar_max_width = 300;

          indicate_hidden = true;
          transparency = 0;
          separator_height = 2;
          padding = 8;
          horizontal_padding = 8;
          text_icon_padding = 0;
          frame_width = 3;
          frame_color = "#ffffff";
          gap_size = 0;
          separator_color = "frame";
          sort = true;

          font = "Iosevka Comfy 16";
          line_height = 0;
          markup = "full";
          format = "<b>%s</b>\n%b";
          alignment = "left";
          vertical_alignment = "center";
          show_age_threshold = 60;
          ellipsize = "middle";
          ignore_newline = false;
          stack_duplicates = true;
          hide_duplicate_count = false;
          show_indicators = true;

          enable_recursive_icon_lookup = true;
          icon_theme = "Papirus";
          icon_position = "left";
          min_icon_size = 32;
          max_icon_size = 128;

          sticky_history = true;
          history_length = 20;

          dmenu = "dmenu -p dunst:";
          browser = "librewolf";
          always_run_script = true;
          title = "Dunst";
          class = "Dunst";
          corner_radius = 0;
          ignore_dbusclose = false;
          force_xwayland = false;
          force_xinerama = false;

          mouse_left_click = "close_current";
          mouse_middle_click = "do_action, close_current";
          mouse_right_click = "close_all";
        };

        experimental = {
          per_monitor_dpi = false;
        };

        urgency_low = {
          background = "#222222";
          foreground = "#888888";
          timeout = 10;
        };

        urgency_normal = {
          background = "#000000";
          foreground = "#ffffff";
          timeout = 10;
          default_icon = "${config.home.homeDirectory}/.fvwm/icon/Yoritsuki/Kanban (sign).png";
        };

        urgency_critical = {
          background = "#9d1f1f";
          foreground = "#ffffff";
          frame_color = "#ff0000";
          timeout = 0;
        };

        play-sound = {
          summary = "*";
          script = "${config.home.homeDirectory}/.local/bin/scripts/alert";
        };
      };
    };

  };
}
