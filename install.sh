#!/bin/sh
echo "Installazione di Cockpit"

apt update -y 
apt install cockpit
echo "Vuoi installare anche i moduli per container, macchine virtuali e management aggiuntivi?"
read -p "S/N: " var
if  [$var == S]
then
  apt install cockpit-machines cockpit-podman podman cockpit-sensors lm-sensors cockpit-packagekit cockpit-networkmanager cockpit-storaged cockpit-certificates -y
elif [$var == N]
then
  echo "Installazione terminata senza plugin aggiuntivi"
else
  echo "Comando errato, inserie S per accettare o N per rifiutare"
fi

echo "Installazione terminata"
