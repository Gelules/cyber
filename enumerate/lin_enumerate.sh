#!/bin/sh

LOGFILE=enumerate.log

rm $LOGFILE 2>/dev/null
touch $LOGFILE
exec 3>&1 1>$LOGFILE

echo "##########"
echo "#  USER  #"
echo "##########"
echo "id:"
id
echo

echo "groups:"
groups
echo

echo "##########"
echo "#  SUDO  #"
echo "##########"
echo "sudo:"
sudo -n -l 2>/dev/null
if [ $? -eq 1 ]
then
    echo "Password required to execute sudo -l"
fi
echo

echo "##########"
echo "# SET ID #"
echo "##########"
echo "SUID:"
find / -type f -perm -4000 2>/dev/null
echo

echo "SGID:"
find / -type f -perm -2000 2>/dev/null

exec 1>&3 3>&-
cat $LOGFILE
