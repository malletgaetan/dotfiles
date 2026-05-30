{
	description = "NixOS yay !";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
		nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager/release-26.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }:
		let
			system = "x86_64-linux";

			pkgs-unstable = import nixpkgs-unstable {
				inherit system;
				config.allowUnfree = true;
			};
		in {
			nixosConfigurations.blackbox = nixpkgs.lib.nixosSystem {
				inherit system;
				specialArgs = {
					inherit pkgs-unstable;
				};

				modules = [
					./hosts/blackbox/configuration.nix
					home-manager.nixosModules.home-manager
					{
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.backupFileExtension = "backup";
						home-manager.extraSpecialArgs = {
							inherit pkgs-unstable;
						};

						home-manager.users.gmallet = import ./home/gmallet.nix;
					}
				];
			};
		};
}
