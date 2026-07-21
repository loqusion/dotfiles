#!/usr/bin/env python3

from __future__ import annotations

import json
import logging
import os
import subprocess
from socket import AF_UNIX, SOCK_STREAM, socket
from typing import TYPE_CHECKING, Any, Final, cast

from boltons.iterutils import flatten
from boltons.socketutils import BufferedSocket

if TYPE_CHECKING:
    from collections.abc import Iterable, Iterator


HYPRLAND_INSTANCE_SIGNATURE: Final = os.getenv("HYPRLAND_INSTANCE_SIGNATURE")
HYPRLAND_SOCKET: Final = f"/tmp/hypr/{HYPRLAND_INSTANCE_SIGNATURE}/.socket2.sock"
LISTENED_EVENTS: Final = [
    "focusedmon",
    "workspace",
    "moveworkspace",
    "createworkspace",
    "destroyworkspace",
]


WorkspaceDict = dict[int, bool]


def try_parse_id(id_: str, ctx: Any) -> int | None:
    try:
        return int(id_)
    except ValueError:
        if id_ != "special":
            logging.error(f"Could not parse id {id_}")
            logging.error(f"Full event: {ctx}")
        return None


class Hyprctl:
    @staticmethod
    def cmd(subcommand: str):
        return subprocess.run(
            ["hyprctl", subcommand, "-j"], capture_output=True, encoding="utf-8"
        )

    @staticmethod
    def getobj(obj: str):
        pipe = Hyprctl.cmd(obj)
        return json.loads(pipe.stdout)

    @staticmethod
    def all_workspaces() -> list[int]:
        workspaces: list[dict] = Hyprctl.getobj("workspaces")
        return list(
            map(
                lambda w: w["id"],
                filter(lambda w: w["id"] >= 0, workspaces),
            )
        )

    @staticmethod
    def focused_workspace() -> int:
        monitors: list[dict] = Hyprctl.getobj("monitors")
        try:
            focused_monitor = next(filter(lambda x: x["focused"], monitors))
        except StopIteration:
            logging.warning(f"Failed to get focused monitor from {monitors}")
            return 1
        return focused_monitor["activeWorkspace"]["id"]

    @staticmethod
    def focused_monitor() -> str:
        monitors: list[dict] = Hyprctl.getobj("monitors")
        try:
            focused_monitor = next(filter(lambda m: m["focused"], monitors))
        except StopIteration:
            logging.warning(f"Failed to get focused monitor from {monitors}")
            return ""
        return focused_monitor["name"]


class Workspaces:
    workspace_set: set[int]
    focused_id: int
    monitor: str

    def __init__(self, workspaces: Iterable[int] | None = None):
        if workspaces is None:
            workspaces = Hyprctl.all_workspaces()
        self.workspace_set = {id_ for id_ in workspaces}
        self.focused_id = Hyprctl.focused_workspace()
        self.monitor = Hyprctl.focused_monitor()

    def __repr__(self) -> str:
        return f"Workspaces({self.workspace_set})"

    def json(self) -> str:
        obj = {
            "workspaces": sorted([w for w in self.workspace_set]),
            "focused": self.focused_id,
        }
        return json.dumps(obj)

    def focus(self, id_: int) -> None:
        self.focused_id = id_

    def create(self, id_: int) -> None:
        self.workspace_set.add(id_)

    def remove(self, id_: int) -> None:
        self.workspace_set.remove(id_)

    def handle_event(self, event: str, args: list[str]) -> None:
        match event:
            case "focusedmon":
                monitor, id_ = args[0], try_parse_id(args[1], (event, args))
                self.monitor = monitor
                if id_ is not None:
                    self.focus(id_)
            case "workspace":
                id_ = try_parse_id(args[0], (event, args))
                if id_ is not None:
                    self.focus(id_)
            case "moveworkspace":
                id_, monitor = try_parse_id(args[0], (event, args)), args[1]
                if self.monitor == monitor:
                    if id_ is not None:
                        self.focus(id_)
                    else:
                        logging.error(
                            f"Unknown state: {event} to monitor {monitor} with id parsing error"  # noqa: E501
                        )
            case "createworkspace":
                id_ = try_parse_id(args[0], (event, args))
                if id_ is not None:
                    self.create(id_)
            case "destroyworkspace":
                id_ = try_parse_id(args[0], (event, args))
                if id_ is not None:
                    self.remove(id_)


def hyprland_events() -> Iterator[tuple[str, list[str]]]:
    with socket(AF_UNIX, SOCK_STREAM) as sock:
        sock.connect(HYPRLAND_SOCKET)
        buffered_sock = BufferedSocket(sock, timeout=None)
        while data := buffered_sock.recv_until(b"\n"):
            event, *args = data.decode("utf-8").split(">>")
            args = cast(list[str], flatten((arg.split(",") for arg in args)))
            yield event, args


def main():
    workspaces = Workspaces()
    print(workspaces.json(), flush=True)
    for event, args in hyprland_events():
        workspaces.handle_event(event, args)
        if event in LISTENED_EVENTS:
            print(workspaces.json(), flush=True)


if __name__ == "__main__":
    LOG_FILE = "/tmp/user/workspaces.log"
    os.makedirs(os.path.dirname(LOG_FILE), exist_ok=True)
    logging.basicConfig(level=logging.DEBUG, filename=LOG_FILE)
    try:
        main()
    except KeyboardInterrupt:
        pass
    except Exception as e:
        logging.critical(e, exc_info=True)
