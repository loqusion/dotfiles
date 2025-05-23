if status --is-interactive
    abbr sys "sudo systemctl"
    abbr syss "sudo systemctl status"
    abbr sysl "sudo systemctl list-units"
    abbr sysr "sudo systemctl restart"
    abbr syst "sudo systemctl stop"
    abbr syse "sudo systemctl enable --now"
    abbr sysd "sudo systemctl disable --now"

    abbr sysu "systemctl --user"
    abbr sysus "systemctl --user status"
    abbr sysul "systemctl --user list-units"
    abbr sysur "systemctl --user restart"
    abbr sysut "systemctl --user stop"
    abbr sysue "systemctl --user enable --now"
    abbr sysud "systemctl --user disable --now"

    abbr jn "sudo journalctl"
end
