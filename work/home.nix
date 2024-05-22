{ config, pkgs, ... }:

{
  imports = [ ../shared/home.nix ];

  xsession.windowManager.bspwm = {
    monitors = {
      eDP-1 = [
        "I"
        "II"
        "III"
        "IV"
      ];
    };
    extraConfig = ''
      bspc node @I:/ --insert-receptacle
      bspc rule --add Alacritty --one-shot node=@I:/
      bspc node @II:/ --insert-receptacle
      bspc rule --add firefox --one-shot node=@II:/
      bspc node @III:/ --insert-receptacle
      bspc rule --add KeePassXC --one-shot node=@III:/
    '';
    startupPrograms = [
      "alacritty"
      "firefox"
      "keepassxc"
    ];
  };

  programs.autorandr = {
    enable = true;
    hooks.postswitch.move_desktops = ''
      target=$AUTORANDR_MONITORS
      monitors=$(bspc query -M --names)
      for source in $monitors; do
        if [ $source == $target ]; then
          continue
        fi
        desktops=$(bspc query -D --names --monitor $source)
        bspc monitor $source --add-desktops temp
        for desktop in $desktops; do
          bspc desktop $desktop --to-monitor $target
        done
        bspc monitor $source --remove
      done
      bspc desktop Desktop --remove
    '';
    hooks.postswitch.move_bar = ''
      pkill -x polybar
      polybar -q mybar &
    '';
    profiles.docked1 = {
      fingerprint = {
        "e-DP1" = "00ffffffffffff000daed013000000000f210104a51d127803ee95a3544c99260f505400000001010101010101010101010101010101743c80a070b028403020a6001eb21000001a000000fd00303c4a4a0f010a202020202020000000fe003233575657803133334a43470a0000000000024101a8000000000a410a202000a0";
        "DP-1-2" = "00ffffffffffff0010ac2cd1564858300e200104b5502178fb19f5aa4d43aa24105054a54b00714f8140818081c081009500b300d1c0e77c70a0d0a0295030203a001d4e3100001a000000ff00445830595336330a2020202020000000fc0044454c4c205333343232445747000000fd003090e6e651010a202020202020027a020332f149020403901112131f3f2309070783010000e200d5e305c000e60605016c6c2c6d1a00000203309000076c2c6c2c5a8780a070384d40302035001d4e3100001a4ed470a0d0a0465030203a001d4e3100001a09ec00a0a0a06750302035001d4e3100001a6fc200a0a0a05550302035001d4e3100001a00000000002b701279000003013c663801066f0d9f002f801f009f05660002000900520101066f0d9f002f801f009f05540002000900555e0004ff099f002f801f009f05280002000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004e90";
      };
      config = {
        "eDP-1".enable = false;
        "DP-1-2" = {
          enable = true;
          primary = true;
          mode = "3440x1440";
          rate = "143.97";
        };
      };
    };
    profiles.docked2 = {
      fingerprint = {
        "e-DP1" = "00ffffffffffff000daed013000000000f210104a51d127803ee95a3544c99260f505400000001010101010101010101010101010101743c80a070b028403020a6001eb21000001a000000fd00303c4a4a0f010a202020202020000000fe003233575657803133334a43470a0000000000024101a8000000000a410a202000a0";
        "DP-1-1" = "00ffffffffffff0010ac2cd1565458300e200104b5502178fb19f5aa4d43aa24105054a54b00714f8140818081c081009500b300d1c0e77c70a0d0a0295030203a001d4e3100001a000000ff00445a54575336330a2020202020000000fc0044454c4c205333343232445747000000fd003090e6e651010a202020202020024a020332f149020403901112131f3f2309070783010000e200d5e305c000e60605016c6c2c6d1a00000203309000076c2c6c2c5a8780a070384d40302035001d4e3100001a4ed470a0d0a0465030203a001d4e3100001a09ec00a0a0a06750302035001d4e3100001a6fc200a0a0a05550302035001d4e3100001a00000000002b701279000003013c663801066f0d9f002f801f009f05660002000900520101066f0d9f002f801f009f05540002000900555e0004ff099f002f801f009f05280002000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004e90";
      };
      config = {
        "eDP-1".enable = false;
        "DP-1-1" = {
          enable = true;
          primary = true;
          mode = "3440x1440";
          rate = "143.97";
        };
      };
    };
    profiles.docked3 = {
      fingerprint = {
        "e-DP1" = "00ffffffffffff000daed013000000000f210104a51d127803ee95a3544c99260f505400000001010101010101010101010101010101743c80a070b028403020a6001eb21000001a000000fd00303c4a4a0f010a202020202020000000fe003233575657803133334a43470a0000000000024101a8000000000a410a202000a0";
        "DP-1-2" = "00ffffffffffff0010ac2cd1565558300e200104b5502178fb19f5aa4d43aa24105054a54b00714f8140818081c081009500b300d1c0e77c70a0d0a0295030203a001d4e3100001a000000ff00463033575336330a2020202020000000fc0044454c4c205333343232445747000000fd003090e6e651010a2020202020200292020332f149020403901112131f3f2309070783010000e200d5e305c000e60605016c6c2c6d1a00000203309000076c2c6c2c5a8780a070384d40302035001d4e3100001a4ed470a0d0a0465030203a001d4e3100001a09ec00a0a0a06750302035001d4e3100001a6fc200a0a0a05550302035001d4e3100001a00000000002b701279000003013c663801066f0d9f002f801f009f05660002000900520101066f0d9f002f801f009f05540002000900555e0004ff099f002f801f009f05280002000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004e90";
      };
      config = {
        "eDP-1".enable = false;
        "DP-1-2" = {
          enable = true;
          primary = true;
          mode = "3440x1440";
          rate = "143.97";
        };
      };
    };
    profiles.docked4 = {
      fingerprint = {
        "e-DP1" = "00ffffffffffff000daed013000000000f210104a51d127803ee95a3544c99260f505400000001010101010101010101010101010101743c80a070b028403020a6001eb21000001a000000fd00303c4a4a0f010a202020202020000000fe003233575657803133334a43470a0000000000024101a8000000000a410a202000a0";
        "DP-1-2" = "00ffffffffffff0010ac2cd1564e58300e200104b5502178fb19f5aa4d43aa24105054a54b00714f8140818081c081009500b300d1c0e77c70a0d0a0295030203a001d4e3100001a000000ff00445932575336330a2020202020000000fc0044454c4c205333343232445747000000fd003090e6e651010a2020202020200273020332f149020403901112131f3f2309070783010000e200d5e305c000e60605016c6c2c6d1a00000203309000076c2c6c2c5a8780a070384d40302035001d4e3100001a4ed470a0d0a0465030203a001d4e3100001a09ec00a0a0a06750302035001d4e3100001a6fc200a0a0a05550302035001d4e3100001a00000000002b701279000003013c663801066f0d9f002f801f009f05660002000900520101066f0d9f002f801f009f05540002000900555e0004ff099f002f801f009f05280002000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004e90";
      };
      config = {
        "eDP-1".enable = false;
        "DP-1-2" = {
          enable = true;
          primary = true;
          mode = "3440x1440";
          rate = "143.97";
        };
      };
    };
    profiles.docked5 = {
      fingerprint = {
        "e-DP1" = "00ffffffffffff000daed013000000000f210104a51d127803ee95a3544c99260f505400000001010101010101010101010101010101743c80a070b028403020a6001eb21000001a000000fd00303c4a4a0f010a202020202020000000fe003233575657803133334a43470a0000000000024101a8000000000a410a202000a0";
        "DP-1-1" = "00ffffffffffff0010ac0da14c493830311f0104b57822783eee91a3544c99260f5054a54b00714f81008180a940d1c00101010101011a6800a0f0381f4030203a00ae514100001a000000ff003151464c5848330a2020202020000000fc0044656c6c20553439313944570a000000fd00185619732f010a20202020202002e1020310b14b900504030201141f12135acd4600a0a0381f4030203a00ae514100001a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d0701279030001000ccd2e2a0d0014a0051078ff9903012833b70088ff139f002f801f009f05280002000900545a0008ff139f002f801f009f051400020009000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006e90";
      };
      config = {
        "eDP-1".enable = false;
        "DP-1-1" = {
          enable = true;
          primary = true;
          mode = "5120x1440";
          rate = "60";
        };
      };
    };
    profiles.mobile = {
      fingerprint = {
        "e-DP1" = "00ffffffffffff000daed013000000000f210104a51d127803ee95a3544c99260f505400000001010101010101010101010101010101743c80a070b028403020a6001eb21000001a000000fd00303c4a4a0f010a202020202020000000fe003233575657803133334a43470a0000000000024101a8000000000a410a202000a0";
      };
      config = {
        "eDP-1" = {
          enable = true;
          primary = true;
          mode = "1920x1200";
          rate = "60";
        };
      };
    };
    profiles.office = {
      fingerprint = {
        "e-DP1" = "00ffffffffffff000daed013000000000f210104a51d127803ee95a3544c99260f505400000001010101010101010101010101010101743c80a070b028403020a6001eb21000001a000000fd00303c4a4a0f010a202020202020000000fe003233575657803133334a43470a0000000000024101a8000000000a410a202000a0";
        "DP-1-3" = "00ffffffffffff0010ac24d1563336310e20010380502178ea19f5aa4d43aa24105054a54b00714f8140818081c081009500b300d1c0e77c70a0d0a0295030203a001d4e3100001a000000ff004a3644575336330a2020202020000000fc0044454c4c205333343232445747000000fd0030781dc83c000a202020202020011f020353f1550102030711121613042f4647141f05103f4c4e60612309070783010000e200d567030c001000183c67d85dc4017888016d1a000002033078e6076c2c6c2ce305c000e40f000038e60605016c6c2c4ed470a0d0a0465030203a001d4e3100001a6fc200a0a0a05550302035001d4e3100001a000000000000000033";
      };
      config = {
        "eDP-1".enable = false;
        "DP-1-3" = {
          enable = true;
          primary = true;
          mode = "3440x1440";
          rate = "60";
        };
      };
    };
  };

  home.packages = with pkgs; [ pavucontrol ];

  home.file.".config/polybar/vpn.sh" = {
    source = pkgs.callPackage ./polybar/vpn.nix { };
    executable = true;
  };

  services.polybar = {
    enable = true;
    script = "sleep 10; polybar mybar &";
    settings = {
      "colors" = {
        background = "#282A2E";
        background-alt = "#373B41";
        foreground = "#C5C8C6";
        primary = "#F0C674";
        secondary = "#8ABEB7";
        alert = "#A54242";
        disabled = "#707880";
      };
      "bar/mybar" = {
        width = "100%";
        background = "\${colors.background}";
        foreground = "\${colors.foreground}";
        modules.left = "bspwm";
        modules.right = "cpu memory filesystem wireless-network vpn alsa battery date";
        module.margin = 1;
        separator = "|";
      };
      "module/bspwm" = {
        type = "internal/bspwm";
        enable.click = false;
        enable.scroll = false;
        label.focused.background = "\${colors.background-alt}";
      };
      "module/cpu" = {
        type = "internal/cpu";
        format.prefix = "CPU ";
      };
      "module/memory" = {
        type = "internal/memory";
        format.prefix = "RAM ";
      };
      "module/wireless-network" = {
        type = "internal/network";
        interface = "wlp0s20f3";
        label = {
          connected = "WIFI %essid% %downspeed:9%";
          disconnected = "WIFI not connected";
        };
      };
      "module/filesystem" = {
        type = "internal/fs";
        label.mounted = "%mountpoint% %percentage_used%%";
      };
      "module/alsa" = {
        type = "internal/alsa";
        label = {
          volume = "VOL %percentage%%";
          muted = "Muted";
        };
      };
      "module/battery" = {
        type = "internal/battery";
        label = {
          charging = "Charging %percentage%%";
          discharging = "Discharging %percentage%%";
          full = "Fully charged";
          low = "BATTERY LOW";
        };
      };
      "module/date" = {
        type = "internal/date";
        interval = 1;
        date = "%H:%M";
        label = "%date%";
      };
      "module/vpn" = {
        type = "custom/script";
        exec = "~/.config/polybar/vpn.sh";
        label = "VPN %output%";
        interval = 5;
      };
    };
  };
}
