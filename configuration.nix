
############################### GENERAL CONFIGURATION ################################


{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./systemd-hardening.nix
      ./security.nix
      ./applications.nix 
       <home-manager/nixos>
    ];


###### Bootloader #####

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


###### Use latest kernel #####

  boot.kernelPackages = pkgs.linuxPackages_latest;


##### Networking #####

  networking.hostName = "dxc-0";
  # networking.wireless.enable = true;  
  networking.networkmanager.enable = true;


##### Wayland / X11 #####

  services.xserver.enable = true;


##### Desktop Environment #####

services.desktopManager.cosmic.enable = true;


##### Keyring #####

services.gnome.gnome-keyring.enable = true;


#### Polkit #####

security.polkit.enable = true; 

##### User Acccount #####
 
  users.users.alerion = {
    isNormalUser = true;
    description = "alerion";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };

  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "alerion";

  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

home-manager.users.alerion = { pkgs, ... }: {
  home.packages = [ ];
  home.stateVersion = "25.05";  
  };



##### Nvidia Drivers #####

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true; 


##### Audio Drivers #####


  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

  };


##### Flatpak support #####

  services.flatpak.enable = true;  


#### Nix Flakes Support ####

 nix.settings.experimental-features = [ "nix-command" "flakes" ];


##### Allow unfree packages #####

  nixpkgs.config.allowUnfree = true;


##### Brightness Control #####

  hardware.i2c.enable = true;

  
##### Podman containers support #####

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
};


##### Time Zone #####

  time.timeZone = "Europe/Paris";


##### Layout Keyboard #####

  services.xserver.xkb = {
    layout = "fr";
    variant = "";
  };


  console.keyMap = "fr";



  # Select internationalisation properties.

  i18n.defaultLocale = "fr_FR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };


}
