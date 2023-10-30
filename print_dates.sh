#! /bin/bash

set -e

echo
echo "Printing reverse chronological dates for Notepad to-do list..."
echo

f="./tmp_dates.txt"
touch $f

n=14
while [ ${n} -ge 0 ]
do
	date -v+$((n))d '+%A, %B %eXX, %Y' \
	| grep -v -e "Saturday" -e "Sunday" \
	| sed -e 's/11XX/11th/' -e 's/12XX/12th/' -e 's/13XX/13th/' -e 's/1XX/1st/' -e 's/2XX/2nd/' -e 's/3XX/3rd/' -e 's/XX/th/' \
	>> $f
	n=$((n-1))
done

IFS=$'\n'
for d in $(cat $f)
do
	echo $d
	if [[ $d == "Monday"* ]]
	then echo
	fi
done

rm $f

