
############################### SYSTEMD HARDENING PROFILES ################################

{ config, pkgs, lib, ... }:

{

systemd.services.syslog = {
serviceConfig = {
  PrivateNetwork= true;
  CapabilityBoundingSet= ["CAP_DAC_READ_SEARCH" "CAP_SYSLOG" "CAP_NET_BIND_SERVICE"];
  NoNewPrivileges= true;
  PrivateDevices= true;
  ProtectClock= true;
  ProtectKernelLogs= true;
  ProtectKernelModules= true;
  PrivateMounts= true;
  SystemCallArchitectures= "native";
  MemoryDenyWriteExecute= true;
  LockPersonality= true;
  ProtectKernelTunables= true;
  RestrictRealtime= true;
  PrivateUsers= true;
  PrivateTmp= true;
  UMask= "0077";
  RestrictNamespace = true;
  ProtectProc= "invisible";
  ProtectHome= true;
  DeviceAllow= false;
  ProtectSystem = "full";
  };
};

systemd.services.systemd-journald = {
  serviceConfig = {
  UMask = 0077;
  PrivateNetwork= true;
  ProtectHostname= true;
  ProtectKernelModules= true;
  };
};

systemd.services.auto-cpufreq = {
    serviceConfig = {
      CapabilityBoundingSet = "";
      ProtectSystem = "full";
      ProtectHome = true;
      PrivateNetwork = true;
      IPAddressDeny = "any";
      NoNewPrivileges = true;
      ProtectKernelTunables = true;
      ProtectKernelModules = true;
      ProtectControlGroups = true;
      ProtectHostname = false;
      MemoryDenyWriteExecute = true;     
      ProtectClock = true;
      RestrictNamespaces = true ;
      PrivateTmp = true;
      PrivateUsers = true;
      ProtectProc= true;
      ReadOnlyPaths = [ "/" ];
      InaccessiblePaths = [ "/home" "/root" "/proc" ];
      SystemCallFilter = [ "@system-service" ];
      SystemCallArchitectures = "native";
      UMask = "0077";
    };
  };


systemd.services.emergency = {
  serviceConfig = {
    ProtectSystem = "strict";
    ProtectHome = true;
    ProtectKernelTunables = true;
    ProtectKernelModules = true;
    ProtectControlGroups = true;
    ProtectKernelLogs = true;
    ProtectClock = true;
    ProtectProc = "invisible";
    ProcSubset = "pid";
    PrivateTmp = true;
    PrivateUsers = true;
    PrivateDevices = true;  # Might need adjustment for emergency access
    PrivateIPC = true;
    MemoryDenyWriteExecute = true;
    NoNewPrivileges = true;
    LockPersonality = true;
    RestrictRealtime = true;
    RestrictSUIDSGID = true;
    RestrictAddressFamilies = "AF_INET";
    RestrictNamespaces = true;
    SystemCallFilter = [ "write" "read" "openat" "close" "brk" "fstat" "lseek" "mmap" "mprotect" "munmap" "rt_sigaction" "rt_sigprocmask" "ioctl" "nanosleep" "select" "access" "execve" "getuid" "arch_prctl" "set_tid_address" "set_robust_list" "prlimit64" "pread64" "getrandom" ];
    UMask = "0077";
    IPAddressDeny = "any";
  };
};

systemd.services."getty@tty1" = {
  serviceConfig = {
    ProtectSystem = "strict";
    ProtectHome = true;
    ProtectKernelTunables = true;
    ProtectKernelModules = true;
    ProtectControlGroups = true;
    ProtectKernelLogs = true;
    ProtectClock = true;
    ProtectProc = "invisible";
    ProcSubset = "pid";
    PrivateTmp = true;
    PrivateUsers = true;
    PrivateDevices = true;
    PrivateIPC = true;
    MemoryDenyWriteExecute = true;
    NoNewPrivileges = true;
    LockPersonality = true;
    RestrictRealtime = true;
    RestrictSUIDSGID = true;
    RestrictAddressFamilies = "AF_INET";
    RestrictNamespaces = true;
    SystemCallFilter = [ "write" "read" "openat" "close" "brk" "fstat" "lseek" "mmap" "mprotect" "munmap" "rt_sigaction" "rt_sigprocmask" "ioctl" "nanosleep" "select" "access" "execve" "getuid" "arch_prctl" "set_tid_address" "set_robust_list" "prlimit64" "pread64" "getrandom" ];
    SystemCallArchitectures = "native";
    UMask = "0077";
    IPAddressDeny = "any";
  };
};


systemd.services."getty@tty7" = {
  serviceConfig = {
    ProtectSystem = "strict";
    ProtectHome = true;
    ProtectKernelTunables = true;
    ProtectKernelModules = true;
    ProtectControlGroups = true;
    ProtectKernelLogs = true;
    ProtectClock = true;
    ProtectProc = "invisible";
    ProcSubset = "pid";
    PrivateTmp = true;
    PrivateUsers = true;
    PrivateDevices = true;
    PrivateIPC = true;
    MemoryDenyWriteExecute = true;
    NoNewPrivileges = true;
    LockPersonality = true;
    RestrictRealtime = true;
    RestrictSUIDSGID = true;
    RestrictAddressFamilies = "AF_INET";
    RestrictNamespaces = true;
    SystemCallFilter = [ "write" "read" "openat" "close" "brk" "fstat" "lseek" "mmap" "mprotect" "munmap" "rt_sigaction" "rt_sigprocmask" "ioctl" "nanosleep" "select" "access" "execve" "getuid" "arch_prctl" "set_tid_address" "set_robust_list" "prlimit64" "pread64" "getrandom" ];
    SystemCallArchitectures = "native";
    UMask = "0077";
    IPAddressDeny = "any";
  };
};

systemd.services.NetworkManager = {
  serviceConfig = {
  NoNewPrivileges = true;
  ProtectClock = true;
  ProtectKernelLogs = true;
  ProtectControlGroups = true;
  ProtectKernelModules = true; 
  SystemCallArchitectures = "native";
  MemoryDenyWriteExecute= true;
  ProtectProc = "invisible";
  ProcSubset = "pid";  
  RestrictNamespaces = true;
  ProtectKernelTunables= true;
  ProtectHome = true;
  PrivateTmp = true;
  UMask = "0077";
  };
};

systemd.services."nixos-rebuild-switch-to-configuration" = {
    serviceConfig = {
    ProtectHome = true;
    NoNewPrivileges = true;  # Prevent gaining new privileges
   };
  };

systemd.services.nix-daemon = {
  serviceConfig = {
    ProtectHome = true;
    PrivateUsers = false;
  };
};

systemd.services.reload-systemd-vconsole-setup = {
  serviceConfig = {
    ProtectSystem = "strict";
    ProtectHome = true;
    ProtectKernelTunables = true;
    ProtectKernelModules = true;
    ProtectControlGroups = true;
    ProtectKernelLogs = true;
    ProtectClock = true;
    PrivateUsers = true;
    PrivateDevices = true;
    MemoryDenyWriteExecute = true;
    NoNewPrivileges = true;
    LockPersonality = true;
    RestrictRealtime = true;
    RestrictNamespaces = true;
    UMask = "0077";
    IPAddressDeny = "any";
  };
};

systemd.services.rescue = {
  serviceConfig = {
    ProtectSystem = "strict";
    ProtectHome = true;
    ProtectKernelTunables = true;
    ProtectKernelModules = true;
    ProtectControlGroups = true;
    ProtectKernelLogs = true;
    ProtectClock = true;
    ProtectProc = "invisible";
    ProcSubset = "pid";
    PrivateTmp = true;
    PrivateUsers = true;
    PrivateDevices = true;  # Might need adjustment for rescue operations
    PrivateIPC = true;
    MemoryDenyWriteExecute = true;
    NoNewPrivileges = true;
    LockPersonality = true;
    RestrictRealtime = true;
    RestrictSUIDSGID = true;
    RestrictAddressFamilies = "AF_INET AF_INET6";  # Networking might be necessary in rescue mode
    RestrictNamespaces = true;
    SystemCallFilter = [ "write" "read" "openat" "close" "brk" "fstat" "lseek" "mmap" "mprotect" "munmap" "rt_sigaction" "rt_sigprocmask" "ioctl" "nanosleep" "select" "access" "execve" "getuid" "arch_prctl" "set_tid_address" "set_robust_list" "prlimit64" "pread64" "getrandom" ];
    SystemCallArchitectures = "native";
    UMask = "0077";
    IPAddressDeny = "any";  # May need to be relaxed for network troubleshooting in rescue mode
  };
};


systemd.services."systemd-ask-password-console" = {
  serviceConfig = {
    ProtectSystem = "strict";
    ProtectHome = true;
    ProtectKernelTunables = true;
    ProtectKernelModules = true;
    ProtectControlGroups = true;
    ProtectKernelLogs = true;
    ProtectClock = true;
    ProtectProc = "invisible";
    ProcSubset = "pid";
    PrivateTmp = true;
    PrivateUsers = true;
    PrivateDevices = true;  # May need adjustment for console access
    PrivateIPC = true;
    MemoryDenyWriteExecute = true;
    NoNewPrivileges = true;
    LockPersonality = true;
    RestrictRealtime = true;
    RestrictSUIDSGID = true;
    RestrictAddressFamilies = "AF_INET AF_INET6";
    RestrictNamespaces = true;
    SystemCallFilter = [ "@system-service" ];  # A more permissive filter
    SystemCallArchitectures = "native";
    UMask = "0077";
    IPAddressDeny = "any";
  };
};


systemd.services."systemd-ask-password-wall" = {
  serviceConfig = {
    ProtectSystem = "strict";
    ProtectHome = true;
    ProtectKernelTunables = true;
    ProtectKernelModules = true;
    ProtectControlGroups = true;
    ProtectKernelLogs = true;
    ProtectClock = true;
    ProtectProc = "invisible";
    ProcSubset = "pid";
    PrivateTmp = true;
    PrivateUsers = true;
    PrivateDevices = true;
    PrivateIPC = true;
    MemoryDenyWriteExecute = true;
    NoNewPrivileges = true;
    LockPersonality = true;
    RestrictRealtime = true;
    RestrictSUIDSGID = true;
    RestrictAddressFamilies = "AF_INET AF_INET6";
    RestrictNamespaces = true;
    SystemCallFilter = [ "@system-service" ];  # A more permissive filter
    SystemCallArchitectures = "native";
    UMask = "0077";
    IPAddressDeny = "any";
  };
};


systemd.services.thermald = {
  serviceConfig = {
    ProtectSystem = "strict";
    ProtectHome = true;
    ProtectKernelTunables = true;  # Necessary for adjusting cooling policies
    ProtectKernelModules = true;  # May need adjustment for module control
    ProtectControlGroups = true;
    ProtectKernelLogs = true;
    ProtectClock = true;
    ProtectProc = "invisible";
    ProcSubset = "pid";
    PrivateTmp = true;
    PrivateUsers = true;
    PrivateDevices = true;  # May require access to specific hardware devices
    PrivateIPC = true;
    MemoryDenyWriteExecute = true;
    NoNewPrivileges = true;
    LockPersonality = true;
    RestrictRealtime = true;
    RestrictSUIDSGID = true;
    CapabilityBoundingSet = "";    
    RestrictNamespaces = true;
    SystemCallFilter = [ "@system-service" ];
    SystemCallArchitectures = "native";
    UMask = "0077";
    IPAddressDeny = "any";
    DeviceAllow= [];
    RestrictAddressFamilies = [ ]; 
 };
};

systemd.services.virtlockd = {
  serviceConfig = {
    ProtectSystem = "strict";
    ProtectHome = true;
    ProtectKernelTunables = true;
    ProtectKernelModules = true;
    ProtectControlGroups = true;
    ProtectKernelLogs = true;
    ProtectClock = true;
    ProtectProc = "invisible";
    ProcSubset = "pid";
    PrivateTmp = true;
    PrivateUsers = true;
    PrivateDevices = true;  # May need adjustment for accessing VM resources
    PrivateIPC = true;
    MemoryDenyWriteExecute = true;
    NoNewPrivileges = true;
    LockPersonality = true;
    RestrictRealtime = true;
    RestrictSUIDSGID = true;
    RestrictAddressFamilies = "AF_INET AF_INET6";
    RestrictNamespaces = true;
    SystemCallFilter = [ "@system-service" ];  # Adjust as necessary
    SystemCallArchitectures = "native";
    UMask = "0077";
    IPAddressDeny = "any";  # May need adjustment for network operations
  };
};


systemd.services.virtlogd = {
  serviceConfig = {
    ProtectSystem = "strict";
    ProtectHome = true;
    ProtectKernelTunables = true;
    ProtectKernelModules = true;
    ProtectControlGroups = true;
    ProtectKernelLogs = true;
    ProtectClock = true;
    ProtectProc = "invisible";
    ProcSubset = "pid";
    PrivateTmp = true;
    PrivateUsers = true;
    PrivateDevices = true;  # May need adjustment for accessing VM logs
    PrivateIPC = true;
    MemoryDenyWriteExecute = true;
    NoNewPrivileges = true;
    LockPersonality = true;
    RestrictRealtime = true;
    RestrictSUIDSGID = true;
    RestrictAddressFamilies = "AF_INET AF_INET6";
    RestrictNamespaces = true;
    SystemCallFilter = [ "@system-service" ];  # Adjust based on log management needs
    SystemCallArchitectures = "native";
    UMask = "0077";
    IPAddressDeny = "any";  # May need to be relaxed for network-based log collection
  };
};


systemd.services.virtlxcd = {
  serviceConfig = {
    ProtectSystem = "strict";
    ProtectHome = true;
    ProtectKernelTunables = true;  # Necessary for container management
    ProtectKernelModules = true;
    ProtectControlGroups = true;
    ProtectKernelLogs = true;
    ProtectClock = true;
    ProtectProc = "invisible";
    ProcSubset = "pid";
    PrivateTmp = true;
    PrivateUsers = true;  # Be cautious, might need adjustment for container user management
    PrivateDevices = true;  # Containers might require broader device access
    PrivateIPC = true;
    MemoryDenyWriteExecute = true;
    NoNewPrivileges = true;
    LockPersonality = true;
    RestrictRealtime = true;
    RestrictSUIDSGID = true;
    RestrictAddressFamilies = "AF_INET AF_INET6";  # Necessary for networked containers
    RestrictNamespaces = true;
    SystemCallFilter = [ "@system-service" ];  # Adjust based on container operations
    SystemCallArchitectures = "native";
    UMask = "0077";
    IPAddressDeny = "any";  # May need to be relaxed for network functionality
  };
};


systemd.services.virtqemud = {
  serviceConfig = {
    ProtectSystem = "strict";
    ProtectHome = true;
    ProtectKernelTunables = true;  # Necessary for VM management
    ProtectKernelModules = true;  # May need adjustment for VM hardware emulation
    ProtectControlGroups = true;
    ProtectKernelLogs = true;
    ProtectClock = true;
    ProtectProc = "invisible";
    ProcSubset = "pid";
    PrivateTmp = true;
    PrivateUsers = true;  # Be cautious, might need adjustment for VM user management
    PrivateDevices = true;  # VMs might require broader device access
    PrivateIPC = true;
    MemoryDenyWriteExecute = true;
    NoNewPrivileges = true;
    LockPersonality = true;
    RestrictRealtime = true;
    RestrictSUIDSGID = true;
    RestrictAddressFamilies = "AF_INET AF_INET6";  # Necessary for networked VMs
    RestrictNamespaces = true;
    SystemCallFilter = [ "@system-service" ];  # Adjust based on VM operations
    SystemCallArchitectures = "native";
    UMask = "0077";
    IPAddressDeny = "any";  # May need to be relaxed for network functionality
  };
};

systemd.services.virtvboxd = {
  serviceConfig = {
    ProtectSystem = "strict";
    ProtectHome = true;
    ProtectKernelTunables = true;  # Required for some VM management tasks
    ProtectKernelModules = true;  # May need adjustment for module handling
    ProtectControlGroups = true;
    ProtectKernelLogs = true;
    ProtectClock = true;
    ProtectProc = "invisible";
    ProcSubset = "pid";
    PrivateTmp = true;
    PrivateUsers = true;  # Be cautious, might need adjustment for VM user management
    PrivateDevices = true;  # VMs may require access to certain devices
    PrivateIPC = true;
    MemoryDenyWriteExecute = true;
    NoNewPrivileges = true;
    LockPersonality = true;
    RestrictRealtime = true;
    RestrictSUIDSGID = true;
    RestrictAddressFamilies = "AF_INET AF_INET6";  # Necessary for networked VMs
    RestrictNamespaces = true;
    SystemCallFilter = [ "@system-service" ];  # Adjust based on VM operations
    SystemCallArchitectures = "native";
    UMask = "0077";
    IPAddressDeny = "any";  # May need to be relaxed for network functionality
  };
};

systemd.services."NetworkManager-dispatcher" = {
    serviceConfig = {
      ProtectSystem = "strict";
      ProtectHome = true;
      PrivateDevices = true;
      ProtectKernelModules = true;
      ProtectKernelLogs = true;
      ProtectControlGroups = true;
      RestrictRealtime = true;
      NoNewPrivileges = true;
      CapabilityBoundingSet = [ ];
      SystemCallFilter = "~@privileged @debug @mount";
    };
  };


systemd.services.podman = {
    serviceConfig = {
      PrivateTmp = true;
      ProtectSystem = "full";
      ProtectHome = true;
      NoNewPrivileges = true;

      CapabilityBoundingSet = [ "CAP_NET_BIND_SERVICE" ];
      RestrictAddressFamilies = [ "AF_INET" "AF_INET6" ];

      SystemCallFilter = "@system-service";
      SystemCallArchitectures = "native";

      ExecStart = "${pkgs.podman}/bin/podman system service";
      Restart = "on-failure";
      Type = "simple";
    };

    wantedBy = [ "multi-user.target" ];
};

 systemd.services.acpid = {
    serviceConfig = {
      NoNewPrivileges = true;
      PrivateTmp = true;
      ProtectSystem = "full";
      ProtectHome = true;
      CapabilityBoundingSet = [ "" ];
      SystemCallFilter = "@system-service";
      SystemCallArchitectures = "native";
    };
    wantedBy = [ "multi-user.target" ];
};

systemd.services.wpa_supplicant = {
    serviceConfig = {
      ProtectSystem = "full";
      ProtectHome = "yes";
      PrivateTmp = true;
      NoNewPrivileges = true;
      CapabilityBoundingSet = [ "CAP_NET_ADMIN" "CAP_NET_RAW" ];
      RestrictRealtime = true;
      SystemCallFilter = "~@mount @reboot @swap";
   };
};


}
