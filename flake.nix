{
  description = "Configuración de NixOS con flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    # home-manager, utilizado para gestionar la configuración de los usuarios
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      # La palabra clave `follows` en las entradas se utiliza para la herencia.
      # Aquí, `inputs.nixpkgs` de home-manager se mantiene coherente con
      # el `inputs.nixpkgs` del flake actual,
      # para evitar problemas causados por diferentes versiones de nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      # TODO cambia el nombre de host por el tuyo
      my-nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          #./configuration.nix
          ./hosts/default.nix
          # convierte home-manager como un módulo de nixos para que la configuración
          # de home-manager se despliegue automáticamente al ejecutar
          # `nixos-rebuild switch`.
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # TODO sustituye ryan por tu propio nombre de usuario
            home-manager.users.alex = import ./home-manager/home.nix;

            # Opcionalmente, utiliza home-manager.extraSpecialArgs para pasar
            # argumentos a home.nix
          }
        ];
      };
    };

    # Agregar esta sección para homeConfigurations
    homeConfigurations = {
      alex = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [ ./home-manager/home.nix ];
      };
    };

  };
}
