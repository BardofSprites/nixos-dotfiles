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

    hardware.graphics.enable = true;

    ############
    # touchpad #
    ############
    # up should be up and down should be down
    # services.libinput.touchpad.naturalScrolling = false;
    # pressing two fingers in middle shouldn't be middle click
    # services.libinput.touchpad.middleEmulation = false;
    # bad
    # services.libinput.touchpad.tapping = false;

    powerManagement.powertop.enable = true;
    services.thermald.enable = true;

    # services.displayManager.ly.enable = true;

    # lid close
    services.logind.settings.Login.HandleLidSwitch = "suspend";
    services.logind.settings.Login.HandleLidSwitchDocked = "suspend";
    services.logind.settings.Login.HandleLidSwitchExternalPower = "ignore";

    # screen locking
    programs.xss-lock.enable = true;
    programs.slock.enable = true;
    # services.xscreensaver.enable = true;

    # power management
    services.power-profiles-daemon.enable = false;
    services.tlp = {
      enable = true;

      settings = {
        # CPU
        CPU_SCALING_GOVERNOR_ON_AC = "schedutil";
        CPU_SCALING_GOVERNOR_ON_BAT = "schedutil";

        CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";

        CPU_DRIVER_OPMODE_ON_AC = "active";
        CPU_DRIVER_OPMODE_ON_BAT = "active";

        # Platform profile (ThinkPad specific)
        PLATFORM_PROFILE_ON_AC = "balanced";
        PLATFORM_PROFILE_ON_BAT = "low-power";

        # Runtime power management
        RUNTIME_PM_ON_AC = "auto";
        RUNTIME_PM_ON_BAT = "auto";

        # PCIe ASPM
        PCIE_ASPM_ON_AC = "default";
        PCIE_ASPM_ON_BAT = "powersave";

        # WiFi powersave
        WIFI_PWR_ON_AC = "off";
        WIFI_PWR_ON_BAT = "on";

        # SATA link power management
        SATA_LINKPWR_ON_BAT = "med_power_with_dipm";

        # USB autosuspend
        USB_AUTOSUSPEND = "1";

        # Let CPU reach deep sleep
        NMI_WATCHDOG = "0";
      };
    };
  };
}
