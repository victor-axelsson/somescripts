#!/bin/bash

### SETUP SCRIPT ###
## Put this in the home directory ##
## This setup is for mean stack on ubuntu 14.04. Replace myproject with you project name ##

#sudo apt-get install figlet
#clear
#figlet Myproject setup
#echo "About to execute setup script. This may take some time. You have 5 sek to Ctrl+C to exit "
#sleep 1
#echo "."
#sleep 1
#echo "."
#sleep 1
#echo "."
#sleep 1
#echo "."
#sleep 1
#echo "."
#clear

#figlet setting locales
#export LC_ALL=C
#echo "export LC_ALL=C" >> /etc/profile
#sleep 1
#clear

#figlet MongoDB
#sleep 1
#sudo apt-get update
#sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
#echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
#sudo apt-get update
#sudo apt-get install -y mongodb-org
#sudo mkdir /data
#sudo mkdir /data/db
#sudo chmod 775 /data
#sudo chown -R `id -u` /data/db
#sudo apt-get install --reinstall mongodb
#sudo service mongodb start
#sleep 3

#clear
#figlet npm and nodejs
#sleep 1
#sudo apt-get update
#sudo apt-get -y install nodejs
#sudo apt-get -y install npm
#sudo ln -s `which nodejs` /usr/bin/node
#sudo npm install -g npm
#sudo npm install -g npm
#sleep 3

#clear
#figlet installing global npm modules 
#sleep 1
#sudo npm install forever -g
#sleep 3


#clear
#figlet git
#sudo apt-get install git
#sleep 3

clear 
figlet setting up the project
sleep 1


#git init --bare myproject.git
echo "#!/bin/sh" >> /root/myproject.git/hooks/post-receive
echo "git --work-tree=/root/myproject --git-dir=/root/myproject.git checkout -f" >> /root/myproject.git/hooks/post-receive
echo "cd /root/myproject/api/" >> /root/myproject.git/hooks/post-receive
echo "npm install" >> /root/myproject.git/hooks/post-receive
echo "forever restart server.js" >> /root/myproject.git/hooks/post-receive
sudo chmod 775 /root/myproject.git/hooks/post-receive
git init myproject

#clear
figlet "Server setup done"
echo "use the following command to add server to remotes: git remote add live ssh://root@<ip>/root/myproject.git"
echo "Next: "
echo "1, git push live master"
echo "2, set credentials for project"
