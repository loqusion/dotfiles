function __ssh_idle_inhibit_on_login
    systemctl --user start --no-block idleinhibit@$fish_pid.service &
end

function __ssh_idle_inhibit_on_exit --on-event fish_exit
    systemctl --user stop idleinhibit@$fish_pid.service
end

__ssh_idle_inhibit_on_login
