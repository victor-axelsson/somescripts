#!/bin/bash

#Remove all those crap DS_store files that fudging mac insists on creating

find ../ -name '*.DS_Store' -type f -delete
