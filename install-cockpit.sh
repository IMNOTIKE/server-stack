#!/bin/bash

echo "Installazione di Cockpit!"
var=''
pvar=''
ORANGE='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'
plugins_arr=(cockpit-machines cockpit-podman podman cockpit-sensors lm-sensors cockpit-packagekit cockpit-networkmanager cockpit-storaged cockpit-certificates)

echo -e "Il modulo base di ${ORANGE}cockpit${NC} sta per essere installato"
apt install cockpit -y
systemctl enable --now cockpit.socket
sudo usermod -aG sudo "$USER"
clear

until [ "$var" == S ] || [ "$var" == N ] || [ "$var" == s ] || [ "$var" == n ]
do
  read -r -p "$(echo -e "${ORANGE}Vuoi visualizzare i plugin aggiuntivi?") " var

  if [ "$var" == S ] || [ "$var" == s ]
    then
      for str in "${plugins_arr[@]}"
      do
        sleap 0.5s
        clear 
        read -r -p "Installare $(echo -e "${ORANGE}$str${NC}")? " pvar
        if [ "$pvar" == S ] || [ "$pvar" == s ] 
          then 
            apt install "$str" -y
            clear
        elif [ "$pvar" == N ] || [ "$pvar" == n ]
          then
            clear
            echo  -e "Il modulo ${ORANGE}$str${NC} ${RED}non verrà installato"
        fi
      done
  else
       clear
       echo -e "I plugin aggiuntivi ${RED}non verranno installati"
    fi
done
