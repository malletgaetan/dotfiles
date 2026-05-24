{ pkgs-unstable, lib, ... }:
{
	programs.chromium = {
		enable = true;
		package = pkgs-unstable.ungoogled-chromium;

		commandLineArgs = [
			"--enable-features=UseOzonePlatform"
			"--ozone-platform=wayland"
			"--disable-features=PreloadMediaEngagementData,MediaEngagementBypassAutoplayPolicies"
		];

		extensions = 
			let
				# stolen from https://github.com/nix-community/home-manager/issues/2216#issuecomment-917507881
				createChromiumExtensionFor = browserVersion: { id, sha256, version }:
					{
						id = id;
						crxPath = builtins.fetchurl {
							url = "https://clients2.google.com/service/update2/crx?response=redirect&acceptformat=crx2,crx3&prodversion=${browserVersion}&x=id%3D${id}%26installsource%3Dondemand%26uc";
							name = "${id}.crx";
							sha256 = sha256;
						};
						version = version;
					};
				createChromiumExtension = createChromiumExtensionFor (lib.versions.major pkgs-unstable.ungoogled-chromium.version);
			in
				[
					(createChromiumExtension { # ublock origin lite
						id = "ddkjiahejlhfcafbddmgiahcphecmpfh";
						version = "2026.507.2008";
						sha256 = "sha256:0xnpghvwf3w2h0gi0a5paqdqivczhl4whks1aign2viwfvj2fpbh";
					})
					(createChromiumExtension { # proton pass
						id = "ghmbeldphafepmbegfdlkpapadhbakde";
						version = "1.36.1";
						sha256 = "sha256:0p854mr2d12ymdwpisjh2sc6xmnnrnpyyxspq5chkz76lrk2qwi3";
					})
					(createChromiumExtension { # proton vpn
						id = "jplgfhpmjnbigmhklmmbgecoobifkmpa";
						version = "1.3.1";
						sha256 = "sha256:0v2jkp17ypkzcbmrkxwifwbmpw3l45y2zns04j4vpd3qjcrwdlmj";
					})
				];
	};
}
