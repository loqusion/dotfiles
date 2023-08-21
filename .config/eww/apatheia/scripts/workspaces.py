#!/usr/bin/env python3

from __future__ import annotations

import json
import logging
import os
import subprocess
from socket import AF_UNIX, SOCK_STREAM, socket
from typing import TYPE_CHECKING, Final, cast

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


def get_focused_workspace_id() -> int:
    hyprctl_pipe = subprocess.run(
        ["hyprctl", "monitors", "-j"], capture_output=True, encoding="utf-8"
    )
    monitors_json: list[dict] = json.loads(hyprctl_pipe.stdout)
    return next(filter(lambda x: x["focused"], monitors_json))["activeWorkspace"]["id"]


def get_workspaces_thing():
    hyprctl_pipe = subprocess.run(
        ["hyprctl", "workspaces", "-j"], capture_output=True, encoding="utf-8"
    )
    workspaces_json: list[dict] = json.loads(hyprctl_pipe.stdout)
    focused_id = get_focused_workspace_id()

    return list(
        map(
            lambda x: (x["id"], x["id"] == focused_id),
            filter(lambda x: x["id"] >= 0, workspaces_json),
        )
    )


def get_focused_monitor() -> str:
    hyprctl_pipe = subprocess.run(
        ["hyprctl", "monitors", "-j"], capture_output=True, encoding="utf-8"
    )
    monitors_json: list[dict] = json.loads(hyprctl_pipe.stdout)
    return next(filter(lambda x: x["focused"], monitors_json))["name"]


class Workspaces:
    workspace_dict: WorkspaceDict = {}
    monitor: str

    def __init__(self, workspaces: Iterable[int] | None = None):
        self.monitor = get_focused_monitor()
        if workspaces is None:
            self.workspace_dict = Workspaces.get_workspaces()
        else:
            self.workspace_dict = {id_: False for id_ in workspaces}

    @staticmethod
    def get_workspaces() -> WorkspaceDict:
        return {x: y for x, y in get_workspaces_thing()}

    def to_json(self) -> str:
        return json.dumps(
            {
                "workspaces": sorted([w for w in self.workspace_dict]),
                "focused": next(
                    filter(lambda x: self.workspace_dict[x], self.workspace_dict.keys())
                ),
            }
        )

    def __repr__(self) -> str:
        return f"Workspaces({self.workspace_dict})"

    def focus(self, id_: int) -> None:
        for x in self.workspace_dict:
            self.workspace_dict[x] = False
        self.workspace_dict[id_] = True

    def create(self, id_: int) -> None:
        self.workspace_dict[id_] = False

    def remove(self, id_: int) -> None:
        self.workspace_dict.pop(id_, None)

    def handle_event(self, event: str, args: list[str]) -> None:
        match event:
            case "focusedmon":
                monitor, id_ = args[0], int(args[1])
                self.monitor = monitor
                self.focus(id_)
            case "workspace":
                id_ = int(args[0])
                self.focus(id_)
            case "moveworkspace":
                id_, monitor = int(args[0]), args[1]
                if self.monitor == monitor:
                    self.focus(id_)
            case "createworkspace":
                try:
                    id_ = int(args[0])
                except ValueError:
                    if args[0] != "special":
                        logging.error(f"Could not parse id {args[0]}")
                        logging.error(f"Full event: {event} {args}")
                    return
                self.create(id_)
            case "destroyworkspace":
                id_ = int(args[0])
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
    print(workspaces.to_json(), flush=True)
    for event, args in hyprland_events():
        workspaces.handle_event(event, args)
        if event in LISTENED_EVENTS:
            print(workspaces.to_json(), flush=True)


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
