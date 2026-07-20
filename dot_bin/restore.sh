#!/usr/bin/env bash

set -euo pipefail

is_dry_run=1

from_file="$1"
to_file="$(echo "$1" | sed -E s,%,/,g | sed -E s/~$// | sed -E s,^\./,,)"
destination_dir="$(dirname "$to_file")"

if [ ! -d "$destination_dir" ]; then
  mkdir -p "$destination_dir"
fi

echo "Restoring $(basename "$to_file")..."
cp "$from_file" "$to_file"
