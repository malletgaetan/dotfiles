# nix-config

## Common commands

```sh
# Rebuild system + home and switch to it (run from this directory)
sudo nixos-rebuild switch --flake .#boiboite

# Dry-run: build without activating
sudo nixos-rebuild build --flake .#boiboite

# Update all pinned inputs
nix flake update

# Update just one input
nix flake update nixpkgs-unstable

# Roll back to the previous generation
sudo nixos-rebuild switch --rollback

# Check the flake evaluates / find syntax errors
nix flake check

# Free up disk by deleting old generations
sudo nix-collect-garbage -d
```

## Help

NixOS manual
```bash
man configuraiton.nix
```

Home manager manual
```bash
man home-configuration.nix
```

```bash
nix repl
nix-repl> :lf . # load current flake
nixosConfigurations.boiboite.options.services.pipewire.<TAB> # and you'll get all options and their types
```

| where | what |
| ---- | ----- |
| https://search.nixos.org/packages | search for packages |
| https://search.nixos.org/options | search for NixOS options |
| https://nix-community.github.io/home-manager/ | Home Manager options |
| https://wiki.nixos.org/ | wiki |
| https://wiki.nixos.org/wiki/Flakes#Flake_schema | flake schema |
