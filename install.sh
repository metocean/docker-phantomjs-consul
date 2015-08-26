#!/bin/sh
set -e

# install needed packages
apt-get update
apt-get upgrade -y
# nodejs
apt-get install -y nodejs
# phantomjs
apt-get install -y libfreetype6 libfontconfig libjpeg-turbo8
# installing stuff
apt-get install -y bzip2 unzip

# install runit
cp -R /install/runit/* /

# install consul
cd /bin
unzip /tmp/consul.zip
chmod +x /bin/consul
rm /tmp/consul.zip
rm -rf /var/lib/apt/lists/*
mv /install/consul /etc/service/consul
mkdir /consul
mkdir /consul-data

# install phantomjs
tar -xjf /tmp/phantomjs.tar.bz2 -C /tmp
mv /tmp/phantomjs /usr/bin/phantomjs

# install init.sh
mv /install/init.sh /sbin/initsh

# remove everything
apt-get remove -y unzip bzip2
apt-get autoremove -y
apt-get clean all
rm -rf /install /var/lib/apt/lists/* /tmp/* /var/tmp/*