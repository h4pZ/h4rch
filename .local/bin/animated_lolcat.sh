#!/bin/sh

counter=0

while :
do
    counter=$((counter+1))
    tput cup 0 0
    lolcat $1 -S $counter -f
done
