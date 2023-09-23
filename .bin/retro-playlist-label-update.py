#!/usr/bin/python3

from __future__ import annotations

import json
import sys
from argparse import ArgumentParser
from os import path
from typing import TYPE_CHECKING, Any, Final

if TYPE_CHECKING:
    from _typeshed import FileDescriptorOrPath


DUMP_JSON_KWARGS: Final = {
    "indent": 2,
    "ensure_ascii": False,
}


def json_load(file: FileDescriptorOrPath) -> dict:
    with open(file, "r", encoding="utf-8") as f:
        return json.load(f)


def json_dump(obj: Any, file: FileDescriptorOrPath) -> None:
    with open(file, "w", encoding="utf-8") as f:
        json.dump(obj, f, **DUMP_JSON_KWARGS)


def json_dumps(obj: Any) -> str:
    return json.dumps(obj, **DUMP_JSON_KWARGS)


def path_to_label(path_: str) -> str:
    basename = path.basename(path_)
    return path.splitext(basename)[0]


def do_run(playlist: str, dry_run: bool) -> int:
    try:
        playlist_obj = json_load(playlist)

        for item in playlist_obj["items"]:
            item["label"] = path_to_label(item["path"])

        if not dry_run:
            json_dump(playlist_obj, playlist)
        else:
            print(f"Would have written to {playlist}:")
            print(json_dumps(playlist_obj))
            print()

        return 0

    except Exception as e:
        print(f"Failed to update playlist {playlist}: {e}", file=sys.stderr)
        return 1


def arg_parser() -> ArgumentParser:
    parser = ArgumentParser(
        prog="retro-playlist-label-update",
        description="Updates playlist item labels with the file name",
    )
    parser.add_argument("playlist", help="Path to the playlist to update", nargs="+")
    parser.add_argument(
        "-n",
        "--dry-run",
        action="store_true",
        help="Do not write any changes to the playlist file",
    )
    return parser


def main() -> int:
    args = arg_parser().parse_args()

    ret = 0
    for playlist in args.playlist:
        ret += do_run(playlist, args.dry_run)

    return ret


if __name__ == "__main__":
    sys.exit(main())
