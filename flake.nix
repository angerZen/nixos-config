{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    inputs.swww.url = "github:LGFae/swww";

    alejandra = {
      url = "github:kamadorueda/alejandra";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    apple-fonts.url = "github:Lyndeno/apple-fonts.nix";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: {
    nixosConfigurations = {
      ganymede = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          inputs.nur.nixosModules.nur
          inputs.home-manager.nixosModules.home-manager
          inputs.hyprland.nixosModules.hyprland
          inputs.swww.nixosModules.swww
          inputs.alejandra.nixosModules.alejandra
          inputs.apple-fonts.nixosModules.apple-fonts
          ./nixos/hosts/ganymede/configuration.nix
        ];
      };
      io = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          inputs.nur.nixosModules.nur
          inputs.home-manager.nixosModules.home-manager
          inputs.hyprland.nixosModules.hyprland
          inputs.swww.nixosModules.swww
          inputs.alejandra.nixosModules.alejandra
          inputs.apple-fonts.nixosModules.apple-fonts
          ./nixos/hosts/io/configuration.nix
        ];
      };
    };
  };
}
