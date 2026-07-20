SOCKET="UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"
socat -u "$SOCKET" - | while read -r event; do
	eventname=$(cut -d'>>' -f1 <<<"$event")
	case "$eventname" in
	activewindow)
		args=$(cut -d'>>' -f2 <<<"$event")
		appname=$(cut -d',' -f1 <<<"$args")
		title=$(cut -d',' -f2 <<<"$args")
		cat <<EOF
{
  "title": "$title",
  "icon": $(xdg-icon-resource getIconName "$appname")
}
EOF
		;;
	esac
done
