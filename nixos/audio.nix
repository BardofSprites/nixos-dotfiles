{
  # audio
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    wireplumber.enable = true;

    extraConfig.pipewire."99-silent-bell.conf" = {
      "context.properties" = {
        "module.x11.bell" = false;
      };
    };
  };
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}
