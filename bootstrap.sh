#!/usr/bin/env bash

apt-get update
apt-get install -y apache2
if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi

add-apt-repository ppa:webupd8team/java
apt-get update
apt-get install -y oracle-java7-installer
apt-get install oracle-java7-set-default

wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sh -c 'echo deb <http://pkg.jenkins-ci.org/debian binary/> > /etc/apt/sources.list.d/jenkins.list'
apt-get update
apt-get install -y jenkins

mkdir /git
cd /git
wget https://git-core.googlecode.com/files/git-1.8.1.2.tar.gz
tar -zxf git-1.8.1.2.tar.gz
apt-get install git
