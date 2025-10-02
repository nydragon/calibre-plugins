# Calibre Plugins packaged for NixOS

## Available packages

- [acsm-calibre-plugin]
- [dedrm-plugin]

## Installation

To install a plugin, you will need to run Calibre's plugin install command:

```sh
nix build .#dedrm-plugin
calibre-customize -a result
```

## Todo

- [ ] Add modules for Hjem

[dedrm-plugin]: https://github.com/noDRM/DeDRM_tools
[acsm-calibre-plugin]: https://github.com/Leseratte10/acsm-calibre-plugin
[Hjem]: https://github.com/feel-co/hjem
