#/bin/sh

RESEAU_ACCEDE=$(ifconfig wlan0 | grep ssid | awk '{print $2}')
{ [ "$RESEAU_ACCEDE" = "\"\"" ] && echo "Déconnecté  "; } ||
    { echo -e "$RESEAU_ACCEDE  "; }

