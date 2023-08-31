#!/bin/bash
#Scrip de Teste 

COMMUNITY=$1
IP=$2
INDEX=$3

INT1=$(snmpwalk -On -v2c -c $COMMUNITY $IP 1.3.6.1.2.1.47.1.1.1.1.7.$INDEX | cut -c 46-)
INT2=$(snmpwalk -On -v2c -c $COMMUNITY $IP 1.3.6.1.2.1.2.2.1.2 | grep $INT1 | cut -c 22-23) 
RESULT=$(snmpwalk -On -v2c -c $COMMUNITY $IP 1.3.6.1.2.1.2.2.1.7.$INT2 |cut -c 35-36 |sed 's/ //g')


echo $RESULT
