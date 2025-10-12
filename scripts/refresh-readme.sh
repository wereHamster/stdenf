#!/usr/bin/env bash

set -euo pipefail

# Get the current date
current_date=$(date +%Y-%m-%d)

# Get versions from nix develop
node_version=$(nix develop -c -- sh -c 'node --version' | sed 's/v//')
pnpm_version=$(nix develop -c -- sh -c 'pnpm --version')
biome_version=$(nix develop -c -- sh -c 'biome --version' | sed 's/Version: //')

# Update the README.md
sed -i '' "s/^> Last updated on: .*/> Last updated on: $current_date/" README.md

# Update the versions table
sed -i '' "s/| \[Node.js\](.*) | .* |/| [Node.js](https:\/\/nodejs.org\/) | $node_version |/" README.md
sed -i '' "s/| \[PNPm\](.*) | .* |/| [PNPm](https:\/\/pnpm.io\/) | $pnpm_version |/" README.md
sed -i '' "s/| \[Biome\](.*) | .* |/| [Biome](https:\/\/biomejs.dev\/) | $biome_version |/" README.md
