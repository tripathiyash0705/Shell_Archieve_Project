#!/bin/bash

#Date of creation : 01 Aug 2026

#Variables
BASE="/home/cent/shscripts"
DAYS="2"
DEPTH=1
RUN=0


#Check if the directory is present or not.

if [[ ! -d $BASE ]]
then 
	echo "Directory does not exists : $BASE"
	exit 1
fi

# If archieve folder is not present then create 

if [[ ! -d "$BASE/archieve" ]]
then 
	mkdir $BASE/archieve

fi

# Find the list of files larger than 20 MB.

for i in `find $BASE -maxdepth $DEPTH -type f -size +20M`
do 
	if [[ $RUN -eq 0 ]]
	then
		gzip -f  "$i" || exit 1
		mv "$i.gz" "$BASE/archieve" || exit 1 
	fi
done
