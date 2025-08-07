
if pamixer --get-mute | grep -q true; then
    pamixer --unmute

else
    pamixer --mute
fi
