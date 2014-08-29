#!/bin/bash
MOUNTPOINT=/dev/sdx1
PARTTYPE=vfat
while true
do
    if [[ -a MOUNTPOINT ]]
    then
        echo "Formatage en cours !"
        umount $MOUNTPOINT
        mkfs.$PARTTYPE $MOUNTPOINT
        umount $MOUNTPOINT 2>/dev/null
        eject $MOUNTPOINT
        clear
        echo "Retire la clé, Serge nous a quitté."
    else
        echo "Vas y Frankie, envoie Serge !"
        sleep 1
        clear
    fi
done
