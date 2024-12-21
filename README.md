The purpose of this repository is to provide a `flake.lock` file which pins
widely-used inputs to specific versions. Downstream projects use this lock
file to update their local pins in lock-step with this repository.

This avoids having multiple slightly different versions of nixpkgs and other
inputs in the Nix store when people work on multiple downstream projects
in parallel.

The lock file in this repository is updated at regular intervals (currently
every ~2 months). Versions of applications and tools which are most relevant
in downstream projects are published in this readme.

Last updated on: 2024-12-21

 - `nodejs`: 20.18.1
 - `pnpm`: 9.15.0

---

```sh
nix flake --refresh metadata github:wereHamster/stdenf
nix flake update \
  --override-input nixpkgs \
    github:nixos/nixpkgs/$(nix flake metadata --json github:wereHamster/stdenf | jq -r '.locks.nodes.nixpkgs.locked.rev') \
  --override-input flake-utils \
    github:numtide/flake-utils/$(nix flake metadata --json github:wereHamster/stdenf | jq -r '.locks.nodes."flake-utils".locked.rev')
```
