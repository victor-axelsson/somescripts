#!/bin/bash

#Some script I use to build ionic apps

echo "You need to run this in an elevated terminal: sudo -s"
echo "Paramters: $1: path to the keystore, $2: name of the built application"
sleep 1
echo "."
sleep 1
echo "."
sleep 3

export ANDROID_HOME=$HOME/android-sdk-linux
ionic resources
cordova build --release android
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore $1 HelloWorld-release-unsigned.apk alias_name
zipalign -v 4 $(pwd)/platforms/android/build/outputs/apk/android-release-unsigned.apk $2
