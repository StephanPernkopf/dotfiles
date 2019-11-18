#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar
# polybar -c ~/.config/polybar/config custom &

# Launch all instances (each monitor)
for m in $(polybar --list-monitors | cut -d":" -f1); do
	MONITOR=$m polybar --reload custom-bar &
done
