if [[ "$HOSTNAME" == "pc" ]]; then
    echo ""
else
    icon=""
    battery_life=`acpi -b | cut -d',' -f2`
    source /home/jonathan/scripts/colors.sh
    echo -n "$(echo_color $icon $battery_life)"
fi

