{ config, pkgs, ... }:

{
  # Habilitar los drivers de AMD
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Soporte de aceleración OpenGL y Vulkan
  hardware.opengl = {
    enable = true;
    #driSupport = true;  #deprecated
    driSupport32Bit = true;  # Habilitar soporte para aplicaciones de 32 bits (Ej: Steam, Wine)
    extraPackages = with pkgs; [
      vaapiVdpau
      libvdpau
      libva
    ];
  };

  # Instalar paquetes gráficos y de compatibilidad
  environment.systemPackages = with pkgs; [
    mesa
    mesa.drivers
    vulkan-loader
    vulkan-validation-layers
    vulkan-tools  # Herramientas como vulkaninfo
    libvdpau-va-gl
    vaapiVdpau
    libva
    amdvlk  # Driver Vulkan de AMD (opcional)
  ];

  # Asegurar que el kernel cargue correctamente amdgpu
  boot.kernelParams = [ "radeon.si_support=0" "amdgpu.si_support=1" ];

  # Opcional: Usar el kernel más reciente
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
