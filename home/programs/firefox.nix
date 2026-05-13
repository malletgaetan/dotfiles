{ pkgs, config, lib, ... }:
{
		programs.firefox = {
			enable = true;

			languagePacks = [ "en-US" ];

			policies = {
				# Updates & Background Services
				AppAutoUpdate                 = false;
				BackgroundAppUpdate           = false;

				# Feature Disabling
				DisableBuiltinPDFViewer       = true;
				DisableFirefoxStudies         = true;
				DisableFirefoxAccounts        = true;
				DisableFirefoxScreenshots     = true;
				DisableForgetButton           = true;
				DisableMasterPasswordCreation = true;
				DisableProfileImport          = true;
				DisableProfileRefresh         = true;
				DisableSetDesktopBackground   = true;
				DisablePocket                 = true;
				DisableTelemetry              = true;
				DisableFormHistory            = true;
				DisablePasswordReveal         = true;

				# Access Restrictions
				BlockAboutConfig              = false;
				BlockAboutProfiles            = true;
				BlockAboutSupport             = true;

				# UI and Behavior
				DisplayMenuBar                = "never";
				DontCheckDefaultBrowser       = true;
				HardwareAcceleration          = false;
				OfferToSaveLogins             = false;
				DefaultDownloadDirectory      = "${config.home.homeDirectory}/Downloads";

				# Extensions
				# To install an extension:
				# - get the extension URL, example: https://addons.mozilla.org/en-US/firefox/addon/proton-vpn-firefox-extension/
				# now we now slug=proton-vpn-firefox-extension, we need the extension id
				# - wget https://addons.mozilla.org/firefox/downloads/latest/proton-vpn-firefox-extension/latest.xpi
				# - unzip latest.xpi manifest.json
				# - cat manifest.json | jq '.browser_specific_settings.gecko.id'
				# now we have the id, use it as the attribute set key for the plugin, for example here its 'vpn@proton.ch'
				ExtensionSettings = let
					moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
				in {
					"*".installation_mode = "blocked";

					"uBlock0@raymondhill.net" = {
						install_url       = moz "ublock-origin";
						installation_mode = "force_installed";
						updates_disabled  = true;
					};

					"78272b6fa58f4a1abaac99321d503a20@proton.me" = {
						install_url       = moz "proton-pass";
						installation_mode = "force_installed";
						updates_disabled  = true;
					};

					"vpn@proton.ch" = {
						install_url       = moz "proton-vpn-firefox-extension";
						installation_mode = "force_installed";
						updates_disabled  = true;
					};
				};

				# Extension configuration 
				"3rdparty".Extensions = {
					"uBlock0@raymondhill.net".adminSettings = {
						userSettings = rec {
							uiTheme            = "dark";
							uiAccentCustom     = true;
							uiAccentCustom0    = "#8300ff";
							cloudStorageEnabled = lib.mkForce false;

							importedLists = [
								"https:#filters.adtidy.org/extension/ublock/filters/3.txt"
								"https:#github.com/DandelionSprout/adfilt/raw/master/LegitimateURLShortener.txt"
							];

							externalLists = lib.concatStringsSep "\n" importedLists;
						};

						selectedFilterLists = [
							"CZE-0"
							"adguard-generic"
							"adguard-annoyance"
							"adguard-social"
							"adguard-spyware-url"
							"easylist"
							"easyprivacy"
							"https:#github.com/DandelionSprout/adfilt/raw/master/LegitimateURLShortener.txt"
							"plowe-0"
							"ublock-abuse"
							"ublock-badware"
							"ublock-filters"
							"ublock-privacy"
							"ublock-quick-fixes"
							"ublock-unbreak"
							"urlhaus-1"
						];
					};
				};
			};

			profiles.default.search = {
				force           = true;
				default         = "ddg";
				privateDefault  = "ddg";

				engines = {
					"Nix Packages" = {
						urls = [
							{
								template = "https://search.nixos.org/packages";
								params = [
									{ name = "channel"; value = "unstable"; }
									{ name = "query";   value = "{searchTerms}"; }
								];
							}
						];
						icon           = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
						definedAliases = [ "@np" ];
					};

					"Nix Options" = {
						urls = [
							{
								template = "https://search.nixos.org/options";
								params = [
									{ name = "channel"; value = "unstable"; }
									{ name = "query";   value = "{searchTerms}"; }
								];
							}
						];
						icon           = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
						definedAliases = [ "@no" ];
					};

					"NixOS Wiki" = {
						urls = [
							{
								template = "https://wiki.nixos.org/w/index.php";
								params = [
									{ name = "search"; value = "{searchTerms}"; }
								];
							}
						];
						icon           = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
						definedAliases = [ "@nw" ];
					};
				};
			};
		};
}
