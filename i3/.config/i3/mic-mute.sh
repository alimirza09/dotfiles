if pamixer --default-source --get-mute | grep -q true; then
    pamixer --default-source --unmute
else
    pamixer --default-source --mute
fi
