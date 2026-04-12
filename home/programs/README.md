# Programs

Short notes for program-specific config in this folder.

## Firefox

Extension installs via `policies.ExtensionSettings` use two different identifiers:

- Add-on slug: from the AMO URL, used in `install_url`.
- Add-on ID: from the extension manifest, used as the `ExtensionSettings` key.

Example:

```nix
"uBlock0@raymondhill.net" = {
	install_url       = moz "ublock-origin";
	installation_mode = "force_installed";
	updates_disabled  = true;
};
```

To add another Firefox extension:

1. Find the AMO slug: `https://addons.mozilla.org/firefox/addon/<slug>/`
2. Download the `.xpi` and read `manifest.json`
3. Use `browser_specific_settings.gecko.id` as the key

`updates_disabled = true` keeps the extension pinned and avoids changes outside rebuilds.
