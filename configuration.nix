{ config, pkgs, ... }:

{
    imports =
        [ # Include the results of the hardware scan.
        ./hardware-configuration.nix
        ];

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "pocket";
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
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

    # Configure keymap in X11
    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };

    users.users.bard = {
        isNormalUser = true;
        description = "bard";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [];
    };

    # List packages installed in system profile
    environment.systemPackages = with pkgs; [
        vim
        tmux
        git
        powertop
    ];

    fonts.packages = with pkgs; [
        nerd-fonts.ubuntu-mono
    ];

    # List services that you want to enable:

    services.xserver.enable = true;

    services.displayManager.ly.enable = true;

    services.openssh.enable = true;
    services.openssh.passwordAuthentication = true;


    system.stateVersion = "25.05";

}
