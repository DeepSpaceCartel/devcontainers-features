#!/usr/bin/env bash

# Enable strict mode
set -euxo pipefail

# Define install parameters as an array
# Add default parameters
params=("--verbose" "--yes")

# Add parameters conditionally
if [ -n "$PLATFORM" ]; then
  params+=("--platform=$PLATFORM")
fi

if [ -n "$BIN_DIR" ]; then
  params+=("--bin-dir=$BIN_DIR")
fi

if [ -n "$ARCH" ]; then
  params+=("--arch=$ARCH")
fi

if [ -n "$BASE_URL" ]; then
  params+=("--base-url=$BASE_URL")
fi

if [ -n "$VERSION" ]; then
  params+=("--version=$VERSION")
fi

# Install starship
curl -sS https://starship.rs/install.sh | sh -s -- "${params[@]}"
