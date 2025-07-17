# Calibre Plugins packaged for NixOS

## Available packages

- [acsm-calibre-plugin]
- [dedrm-plugin]

## Installation

To install a plugin, you will either need to symlink the derivation's zip file
to Calibre's plugin folder or run Calibre's plugin install command.

### The Nix Way

#### [Hjem]

```nix
hjem.users.<username>.files = {
    ".config/calibre/plugins/ACSM Input.zip".source = inputs.calibre-plugins.packages.${pkgs.system}.acsm-calibre-plugin;
    ".config/calibre/plugins/DeDRM.zip".source = inputs.calibre-plugins.packages.${pkgs.system}.dedrm-plugin;
}
```

#### Home-manager

```nix
xdg.configFile = {
    "calibre/plugins/ACSM Input.zip".source = inputs.calibre-plugins.packages.${pkgs.system}.acsm-calibre-plugin;
    "calibre/plugins/DeDRM.zip".source = inputs.calibre-plugins.packages.${pkgs.system}.dedrm-plugin;
}
```

### Manually

Run the following commands, changing which plugin you would like to install:

```sh
nix build .#dedrm-plugin
calibre-customize -a result
```

## Todo

- [ ] Add modules for Hjem

[dedrm-plugin]: https://github.com/noDRM/DeDRM_tools
[acsm-calibre-plugin]: https://github.com/Leseratte10/acsm-calibre-plugin
[Hjem]: https://github.com/feel-co/hjem
