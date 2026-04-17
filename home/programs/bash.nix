{ ... }:
{
	programs.bash = {
		enable = true;

		historySize = 100000;
		historyFileSize = 200000;
		historyControl = [ "ignoredups" "ignorespace" ];
		historyIgnore = [
			"ls"
			"cd"
			"pwd"
			"exit"
		];

		initExtra = ''
			export HISTFILE="$HOME/.bash_history"
			export HISTSIZE=100000
			export HISTFILESIZE=200000
			export HISTTIMEFORMAT="%F %T "

			__hm_history_sync() {
				history -a
				history -n
			}

			if [[ -n "''${PROMPT_COMMAND:-}" ]]; then
				PROMPT_COMMAND="__hm_history_sync; $PROMPT_COMMAND"
			else
				PROMPT_COMMAND="__hm_history_sync"
			fi
		'';

		shellAliases = {
				open = "xdg-open";
				# rg = "rg --hyperlink-format=kitty"; # this needs to be fixed is kitty config to default to nvim
		};
	};
}
