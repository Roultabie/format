#!/bin/bash
MOUNTPOINT=/dev/sdx1
PARTTYPE=vfat

if [ ! -z $1 ]
    PARTTYPE=$1
fi

if [[ ! -x mkfs.$PARTTYPE ]]
then
    echo "Impossible de trouver le binaire 'mkfs.$PARTTYPE'. Veuillez vérifier le système de fichier choisi"
    exit;
fi

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
