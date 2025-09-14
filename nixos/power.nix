{ config, pkgs, lib, inputs, ... }:

let cfg = config.bardConfig.power;
in {
  options.bardConfig.power.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable power optimization for laptop";
  };

  config = lib.mkIf cfg.enable {
    # lid close
    services.logind.lidSwitch = "poweroff";
    services.logind.lidSwitchExternalPower = "lock";
    services.logind.lidSwitchDocked = "ignore";

    services.tlp = {
      enable = true;
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
