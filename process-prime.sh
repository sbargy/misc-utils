#!/bin/bash

TMPFILE="/Users/scott/tmp/prime.tmp"
touch $TMPFILE

find /Volumes/VIDS/\[\ Media\ \] -type d  | sort | \
    sed -e 's/\/Volumes\/VIDS\/\[\ Media\ \]\///' | \
    grep -v '/Volumes/VIDS' | \
    grep -v "English Subs" | \
    grep -v "Samples \& Screenshots" | \
    grep -v "/Screens$" | \
    grep -v "/Subtitles Eng \[SubRip - MicroDVD\]$" | \
    grep -v "/Subtitles$" | \
    grep -v "/Samples$" | \
    grep -v "/Sample$" | \
    grep -v "/Subs$" | \
    grep -v "/Images$" | \
    grep -v "/Other$" | \
    grep -v "/Covers$" | \
    grep -vi "/SCREENSHOTS$" > $TMPFILE

scp $TMPFILE sbargy@bargabus.com:~/bargabus.com/BargabusPrimeList.txt
rm $TMPFILE
