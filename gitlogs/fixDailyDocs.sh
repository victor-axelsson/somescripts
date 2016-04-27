#!/bin/bash

#This script collects all my git repositories from the repos.lst 
#file and put it in a csv file. This way I can track all work I 
#have been doing lately 

myPath=$(pwd)
path="$myPath/log.csv"
myName="Victor Axelsson"

while IFS='' read -r line || [[ -n "$line" ]]; do
	cd $line
	git log --since='last month' --pretty=format:'%h, %an, %ci, %s'  | grep "$myName" | sed "s|$|, ${line}|" >> $path

done < "repos.lst"

cd $myPath
echo $(pwd)
sort --field-separator=',' -r -k3 -o  log.csv log.csv
