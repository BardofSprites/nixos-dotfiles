{ config, pkgs, lib, inputs, ... }:
with lib;
let cfg = config.bardConfig.laptop;
in {
  options.bardConfig.laptop = {
    enable = mkEnableOption "Laptop power management, touchpad, and more";
  };

  config = lib.mkIf cfg.enable {
    # packages
    environment.systemPackages = with pkgs; [
      brightnessctl
      acpi
    ];

    ############
    # touchpad #
    ############
    services.libinput.enable = true;
    # up should be up and down should be down
    services.libinput.touchpad.naturalScrolling = false;
    # pressing two fingers in middle shouldn't be middle click
    services.libinput.touchpad.middleEmulation = false;
    # bad
    services.libinput.touchpad.tapping = false;

    powerManagement.enable = true;
    services.thermald.enable = true; 
    services.power-profiles-daemon.enable = true;

    # lid close
    services.logind.lidSwitch = "suspend";
    services.logind.lidSwitchExternalPower = "lock";
    services.logind.lidSwitchDocked = "ignore";

    # screen locking
    programs.xss-lock.enable = true;
    programs.slock.enable = true;
    # services.xscreensaver.enable = true;

    # power management
    services.tlp = {
      enable = false;
      settings = {
        # CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_DRIVER_OPMODE_ON_BAT="active"; # passive caps 400mhz
        CPU_SCALING_GOVERNOR_ON_BAT="powersave";
        CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
        PLATFORM_PROFILE_ON_BAT = "balanced";
        PLATFORM_PROFILE_ON_AC = "performance";
        RUNTIME_PM_ON_AC = "auto";
        RUNTIME_PM_ON_BAT = "auto";
        WIFI_PWR_ON_BAT = "off";
	      WIFI_PWR_ON_AC = "off";
	      NMI_WATCHDOG = "1"; 
      };
    };
  };
}
