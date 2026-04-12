{ config, pkgs, pkgs-unstable, ... }:
{
	imports = [ ./hardware-configuration.nix ];

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	# https://wiki.nixos.org/wiki/Dual_Booting_NixOS_and_Windows
	boot.loader = {
	efi.canTouchEfiVariables = true;
		systemd-boot = {
			enable = true;

			windows = {
				"windows" =
				let
						boot-drive = "HD1b";
					in
					{
						title = "Windows";
						efiDeviceHandle = boot-drive;
						sortKey = "y_windows";
					};
			};

			edk2-uefi-shell.enable = true;
			edk2-uefi-shell.sortKey = "z_edk2";
		};
	};

	boot.kernelPackages = pkgs.linuxPackages_latest;

	networking.networkmanager.enable = true;
	networking.hostName = "blackbox";

	time.timeZone = "Europe/Paris";
	i18n.defaultLocale = "en_US.UTF-8";
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

	services.xserver.enable = true;
	services.desktopManager.gnome.enable = true;
	services.displayManager.gdm.enable = true;

	services.xserver.xkb = {
		layout = "us";
		variant = "";
	};

	services.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};

	users.users.gmallet = {
		isNormalUser = true;
		description = "gmallet";
		extraGroups = [ "networkmanager" "wheel" ];
	};

	nixpkgs.config.allowUnfree = true;

	environment.systemPackages = with pkgs; [
		vim # TODO: nvim should be system wide?
	];

	programs.steam = {
		enable = true; # Master switch, already covered in installation
		remotePlay.openFirewall = true;  # Open ports in the firewall for Steam Remote Play
		dedicatedServer.openFirewall = true; # Open ports for Source Dedicated Server hosting
	};

	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "25.11"; # Did you read the comment?

}
