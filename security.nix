
############################### SECURITY / HARDENING ################################

{ config, pkgs, lib, ... }:

{

#### Firewall configuration

networking.firewall.enable = true;
services.opensnitch.enable = true;


#### Limit Sudo

security.sudo.execWheelOnly = true;
nix.allowedUsers = [ "@wheel" ];


#### Use Hardened Malloc

#environment.memoryAllocator.provider = "graphene-hardened-light"; # Problem with thunderbird and librewolf/firefox


#### Kernel Hardening 

boot.kernelParams = [

    # Don't merge slabs
    "slab_nomerge"

    # Overwrite free'd pages
    "page_poison=1"

    # Enable page allocator randomization
    "page_alloc.shuffle=1"

    # Reset memory to 0
    "init_on_alloc=1"

    # Clean available memory
    "init_on_free=1"

    # Pointers hide
    "kptr_restrict=2"

    # Memory corruption attack protection
    "randomize_kstack_offset=on"

    # Spectre Variant mitigation
    "spec_store_bypass_disable=on"

    # Meltdown Variant mitigation
    "pti=on"

    # Hardware Peripheral Hardening
    "amd_iommu=on"
    "iommu.strict=1"
    "efi=disable_early_pci_dma"
    
    # Vsyscall deactivation
    "vsyscall=none"

  ];


security.forcePageTableIsolation = true;

systemd.coredump.enable = false;

boot.kernel.sysctl."kernel.ftrace_enabled" = false;


# Prevent zombies processes

services.logind.killUserProcesses = true;


}
