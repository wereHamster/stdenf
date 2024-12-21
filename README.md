# 2024-12-21

 - `nodejs`: 20.18.1
 - `pnpm`: 9.15.0

```sh
nix flake update \
  --override-input nixpkgs \
    github:nixos/nixpkgs/$(nix flake metadata --json github:wereHamster/stdenf | jq -r '.locks.nodes.nixpkgs.locked.rev')
```
