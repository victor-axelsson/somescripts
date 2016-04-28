#!/bin/bash

### Wordpress Server ###
## Run a development PHP server with Wordpress on your local machine ##
## Put this file in your Wordpress root directory ##
## This plugin downloads router.php to enable permalinks and rewrite urls in Wordpress with php -S ##

if [ ! -f index.php ]; then
	echo "Please run this script from your Wordpress root directory"
	exit
fi

if [ ! -f router.php ]; then
	echo "Downloading router.php"
	curl -O https://gist.githubusercontent.com/tamagokun/3801087/raw/36d8f0270a5b2d7fd22437faeb581952f9706c23/router.php
fi

echo "Opening web browser.."
open http://localhost:8000

echo "Starting PHP server"
php -S localhost:8000 router.php
