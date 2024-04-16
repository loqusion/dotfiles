function __ssh_idle_inhibit_on_login
    set -g SSH_IDLE_INHIBIT_SERVICE "idleinhibit@$fish_pid.service"
    systemctl --user start --no-block $SSH_IDLE_INHIBIT_SERVICE &
end

function __ssh_idle_inhibit_on_exit --on-event fish_exit
    systemctl --user stop $SSH_IDLE_INHIBIT_SERVICE
end

__ssh_idle_inhibit_on_login
