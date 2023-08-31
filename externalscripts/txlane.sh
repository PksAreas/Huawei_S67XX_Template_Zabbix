#!/bin/bash
#Verificar Potecia Optica de recepsão do transceiver
#Autor Patrick Areas

COMMUNITY=$1
IP=$2
INDEX=$3

lanes=$(snmpwalk -On -v2c -c $COMMUNITY $IP 1.3.6.1.4.1.2011.5.25.31.1.1.3.1.33.$INDEX |cut -c 58- |tr '"' ' ')

IFS=","

read -ra arr <<< "$lanes"

case $4 in
1) printf " ${arr[0]}";;
2) printf " ${arr[1]}";;
3) printf " ${arr[2]}";;
4) printf " ${arr[3]}";;
esac