#!/bin/bash 

#Dumps the mongodb, gz it with a timestamp

mongodump -d $1
tar cvzf db_dump_$(date +%s).tar.gz dump/
sudo rm -r dump
