#!/bin/sh

if [ -z "$1" ]
then
    interface=eth0
else
    interface=$1
fi

network=$(ip a | grep 'inet ' | grep $interface | cut -d ' ' -f6)

echo Using $interface on $network

fping -ag $network > fping.txt 2>/dev/null
while read ip
do
    echo -n "$ip ("
    h=$(host $ip | cut -d ' ' -f5)
    echo "$h)"
done < fping.txt

rm fping.txt

./ports_enumeration.sh
