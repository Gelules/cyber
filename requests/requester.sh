#!/bin/sh

# set -x

api=""
method=""
header=""
data=""
dataflag=ok

rm -f headers.txt

read -p "API: " api
read -p "Method: " method

# Header
while true
do
    read -p "Header: " head
    if [ -z "$head" ]
    then
        break
    fi
    # header="$header -H '$head' "
    echo "$head" >> headers.txt
done

# Data
read -p "Variable: " variable
if [ -z "$variable" ]
then
    dataflag=ko
else
    data="\"$variable\":"
fi

read -p "Value: " value
if [ -z "$value" -a $dataflag = ok ]
then
    exit 1
elif [ $dataflag = ok ]
then
    data="$data\"$value\""
fi

# Data loop
while [ $dataflag = ok ]

do
    read -p "Variable: " variable
    if [ -z "$variable" ]
    then
        break
    fi
    data="$data,\"$variable\":"

    read -p "Value: " value
    if [ -z "$value" ]
    then
        exit 1
    fi
    data="$data\"$value\""
done

if [ $dataflag = ok ]
then
    data="'{$data}'"
fi

# echo curl "$api" -X "$method" -H @headers.txt -d "$data"
curl "$api" -X "$method" -H @headers.txt -d "$data"

rm -f headers.txt
