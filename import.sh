#!/bin/bash

#Restores an exported mongoDB (see export.sh)

tar -xvzf $1
mongorestore
sudo rm -r dump
