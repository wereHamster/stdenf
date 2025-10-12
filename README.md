The purpose of this repository is to provide a `flake.lock` file which pins
widely-used inputs to specific versions. Downstream projects use this lock
file to update their local pins in lock-step with this repository.

This avoids having multiple slightly different versions of nixpkgs and other
inputs in the Nix store when people work on multiple downstream projects
in parallel. This saves both time (needed to download the inputs) and storage
space (in the Nix store). Furthermore, it saves resources when the Nix store
is shared between multiple users (eg. multiple GitHub Action runners on the
same host).

The lock file in this repository is updated at regular intervals (currently
every ~2 months). In exceptional cases (eg. when a bump is necessary to pull
an important bug fix) an update may be done outside of this regular schedule.

> Last updated on: 2025-10-12

Versions of applications and tools which are most relevant in downstream
projects are published below.

| Package | Version | Attribute |
| ---- | ---- | ---- |
| [Node.js](https://nodejs.org/) | 22.19.0 |
| [PNPm](https://pnpm.io/) | 10.15.1 |
| [Biome](https://biomejs.dev/) | 2.2.3 |
---

```sh
nix flake --refresh metadata github:wereHamster/stdenf
nix flake update \
  --override-input nixpkgs \
    github:nixos/nixpkgs/$(nix flake metadata --json github:wereHamster/stdenf | jq -r '.locks.nodes.nixpkgs.locked.rev') \
  --override-input flake-utils \
    github:numtide/flake-utils/$(nix flake metadata --json github:wereHamster/stdenf | jq -r '.locks.nodes."flake-utils".locked.rev') \
  --override-input nix-develop \
    github:nicknovitski/nix-develop/$(nix flake metadata --json github:wereHamster/stdenf | jq -r '.locks.nodes."nix-develop".locked.rev')
```
