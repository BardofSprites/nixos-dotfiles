{ config, pkgs, ... }:

{
    imports =
        [ # Include the results of the hardware scan.
          ./hardware-configuration.nix
          ../../nixos
        ];

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "pocket";
    # Enable networking
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "America/New_York";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_US.UTF-8";
        LC_IDENTIFICATION = "en_US.UTF-8";
        LC_MEASUREMENT = "en_US.UTF-8";
        LC_MONETARY = "en_US.UTF-8";
        LC_NAME = "en_US.UTF-8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_PAPER = "en_US.UTF-8";
        LC_TELEPHONE = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";
    };

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nixpkgs.config.allowUnfree = true;

    # Configure keymap in X11
    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };

    # tailscale vpn
    services.tailscale.enable = true;

    users.users.bard = {
        isNormalUser = true;
        description = "bard";
        extraGroups = [ "networkmanager" "wheel" "dialout" "plugdev" "storage" ];
        packages = with pkgs; [];
    };

    # List packages installed in system profile
    environment.systemPackages = with pkgs; [
        vim
        tmux
        git
        powertop
        rsync
        bc
    ];

    bardConfig = {
      syncthing.enable = true;
      print.enable = false;
      laptop.enable = true;
      i3.enable = true;
      fvwm.enable = false;
    };

    system.stateVersion = "25.11";

}
