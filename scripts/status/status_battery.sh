if [[ "$HOSTNAME" == "pc" ]]; then
    echo ""
else
    icon=""
    battery_life=`acpi -b | cut -d',' -f2`
    
    echo -n "$(dwmblocks_echo $icon $battery_life)"
fi

