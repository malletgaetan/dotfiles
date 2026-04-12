{ ... }:
{
	programs.git = {
		enable = true;
		settings = {
			core.editor = "nvim";
			init.defaultBranch = "main";
			user = {
				name = "gmallet";
				email = "malletgaetan@protonmail.com";
			};
		};
	};
}
