#!/bin/sh

echo "Installazione di Cockpit!"

var=''
pvar=''
plugins_arr=("cockpit-machines", "cockpit-podman", "podman", "cockpit-sensors", "lm-sensors", "cockpit-packagekit", "cockpit-networkmanager", "cockpit-storaged", "cockpit-certificates")

echo "Il modulo base di cockpit sta per essere installato"
apt install cockpit -y

until [ $var == S || $var == N ]
do
read -p "Vuoi visualizzare i plugin aggiuntivi?" var

if [ $var == S ]
then
  for str in ${plugins_arr[@]}; do
    echo ${plugins_arr[@} 
    read -p "Installare? " pvar
    if [ $pvar == S ]
      then 
        apt install ${plugins_arr[@]}
    elif [$pvar == N ]
      then
        echo "Il modulo ${plugins_arr[@]} non verrà installato"
    fi
else
  then
    echo "I plugin aggiuntivi non verranno installati"
fi
done
