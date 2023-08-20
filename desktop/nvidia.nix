{ config, pkgs, ... }:

  let
  # wrapper to offload program to nv-gpu
  nv-offload = pkgs.writeShellScriptBin "nv-offload" '' 
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec "$@"
  '';
  in {
  # Configure nvidia GPU drivers
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    # Set up prime
    prime = {
      # Offload to nv-gpu
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      
      intelBusId = "PCI:00:02:0";
      nvidiaBusId = "PCI:01:00:0";
    };
  };

  environment.systemPackages = [ nv-offload ];
  }
