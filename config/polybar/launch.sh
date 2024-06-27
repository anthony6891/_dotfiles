#!/bin/sh

# Terminate already running bar instances
#killall -q polybar

# Wait until the processes have been shut down
#while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
#polybar mybar &

#echo "Polybar launched..."
#----------------------------------------------

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/example.log 
polybar example 2>&1 | tee -a /tmp/example.log & disown

echo "Bars launched..."