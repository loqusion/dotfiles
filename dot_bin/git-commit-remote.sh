#!/usr/bin/env bash

set -euo pipefail

wip() {
    echo 'WORK IN PROGRESS' >&2
    exit 1
}

tmpdir=$(mktemp -d 2>/dev/null || mktemp -d -t 'mytmpdir')
cleanup() {
    rm -r "$tmpdir"
}
trap cleanup EXIT

source="$1"
remote_target="$2"

echo "$source"
echo "$remote_target"
wip

tmp_archive="$tmpdir/archive.zip"

{
    zip -r "$tmp_archive" "$source"
    scp "$tmp_archive" "${remote_target}:some/path"
    ssh "$remote_target" "cd some/path && git push"
} || true

cleanup
