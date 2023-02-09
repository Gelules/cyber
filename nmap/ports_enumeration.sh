#!/bin/sh

if [ $# -eq 0 ]
then
    echo "Usage: $0 target" >&2
    exit 1
fi

mkdir nmap

for target in $@
do
    echo "Target: $target"

    ports=$(sudo nmap -p- -sS $target | grep '^[0-9]' | cut -d '/' -f1 | tr '\n' ',' | sed s/,$//)
    echo ports: $ports
    echo

    if [ -n "$ports" ]
    then
        sudo nmap -sC -sV -p$ports -oA nmap/$target $target
    else
        echo "No opened port found" >&2
    fi
done
