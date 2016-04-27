#!/bin/bash

FILES=./../api/public/loggos/*
for f in $FILES
do
  #echo "Processing $f file..."
  new=$(echo $f | sed -e 's/-/_/g')
  mv -v "$f" "$new" 
done