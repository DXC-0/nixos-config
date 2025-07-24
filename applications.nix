
############################### SOFTWARES / PACKAGES ################################


{ config, pkgs, ... }:

{

environment.systemPackages = with pkgs; [

  fastfetch
  freetube
  librewolf
  signal-desktop
  thunderbird
  protonmail-bridge
  tuba
  discord
  
  #### Developper tools ####

  podman
  docker
  podman-compose
  podman-desktop
  distrobox
  boxbuddy  
  neovim
  tmux
  ghostty
  vscode
  git
  curl

  #### Other ####


  ddcutil
  mpv
  btop
  opensnitch-ui

  ];

}
