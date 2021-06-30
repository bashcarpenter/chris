#!/bin/bash 

NOCOLOR='\033[0m';
RED='\033[0;31m';
GREEN='\033[0;32m';
ORANGE='\033[0;33m';
BLUE='\033[0;34m';
PURPLE='\033[0;35m';
CYAN='\033[0;36m';
LIGHTGRAY='\033[0;37m';
DARKGRAY='\033[1;30m';
LIGHTRED='\033[1;31m';
LIGHTGREEN='\033[1;32m';
YELLOW='\033[1;33m';
LIGHTBLUE='\033[1;34m';
LIGHTPURPLE='\033[1;35m';
LIGHTCYAN='\033[1;36m';
WHITE='\033[1;37m'; 

pingvalue=1

internet_down_file=/tmp/internet_down;

while [ $pingvalue -eq 1 ]
do

google_status=$(timeout 3 ping -c 1 google.com | egrep -v "icmp_seq|ping statistics|PING|rtt min" | sed 's/1 packets transmitted, 1 received, //g' | sed 's/, time 0ms//g');

google_check=$(echo $google_status | grep '0% packet loss' | wc -l );

if [ $google_check -eq 1 ]
then
	rm -f $internet_down_file;
	echo -e ${GREEN}"$(date +%r) - Internet is fine" ${NOCOLOR}; 
else
	if [ ! -f $internet_down_file ]
	then
		date +%s > $internet_down_file
		down_time=0;
	else
		current_time=$(date +%s);
		down_time_start=$(cat $internet_down_file);
		down_time=$(( $current_time - $down_time_start ));
	fi
	echo -e ${RED}"$(date +%r) - Internet is down for $down_time seconds" ${NOCOLOR}; 
fi

sleep 1;

done
