#/bin/sh

RESEAU_ACCEDE=$(ifconfig wlan0 | grep ssid | sed -E "s/.*ssid (.*) channel.*/\1/" | sed -E "s/^\"?([^\"]*)\"?$/\1/")

if [ ${#RESEAU_ACCEDE} -gt 12 ]; then
    RESEAU_ACCEDE=$(echo "$RESEAU_ACCEDE" | cut -c1-12)…
elif [ -z "$RESEAU_ACCEDE" ]; then
    RESEAU_ACCEDE="Déconnecté"
fi

echo -e "$RESEAU_ACCEDE  "

