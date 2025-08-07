# Set to your primary color
color="#89B4FA"

info=$(amixer get Master)

if echo "$info" | grep -q '\[off\]'; then
    icon="ﱝ"
    echo "%{F$color}%{F-} muted"
else
    vol=$(echo "$info" | awk -F'[][]' '/%/ {print $2}' | head -n1 | tr -d '%')
    if [ "$vol" -le 30 ]; then
        icon=""
    elif [ "$vol" -le 70 ]; then
        icon=""
    else
        icon=""
    fi
    echo "%{F$color}$icon%{F-} $vol%"
fi
