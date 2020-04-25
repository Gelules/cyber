#!/bin/sh

echo -n "Target: "
read target

ports=$(nmap -p- -sS $target | grep '^[0-9]' | cut -d '/' -f1 | tr '\n' ',' | sed s/,$//)
echo ports: $ports

if [ ! -z "$ports" ]
then
    nmap -sC -sV -p$ports $target
fi
