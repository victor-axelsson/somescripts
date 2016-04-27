#!/bin/bash

#This script disables auto commit when I import the data into my 
#database

echo "SET autocommit=0;" >> dump_with_commits.sql
cat $1 >> dump_with_commits.sql
echo "COMMIT;" >> dump_with_commits.sql

pv dump_with_commits.sql | mysql -u root -p 
