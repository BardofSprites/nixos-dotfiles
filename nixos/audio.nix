{
  # audio
  services.pipewire = {
    enable = true;
    pulse.enable = true;

    extraConfig.pipewire."99-silent-bell.conf" = {
      "context.properties" = {
        "module.x11.bell" = false;
      };
    };
  };  
}
