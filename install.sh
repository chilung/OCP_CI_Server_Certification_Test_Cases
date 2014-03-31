#!/bin/bash

if [ -n "$USER" -a "$UID" -ne 0 ]; then
    echo "You need super user privilege to run this script."
    exit 1
fi

dis_release=`cat /etc/lsb-release|grep DISTRIB_RELEASE|awk -F'=' '{print $2}'`

if [ "$dis_release" = "12.04" ]; then
    apt-get install -y python-software-properties
else
    apt-get install -y software-properties-common
fi

add-apt-repository -y ppa:opencompute-developers/ocp-certification-tools-ppa
apt-get update
apt-get install -y checkbox checkbox-ocp-cli

cp -rf data /usr/share/checkbox/
cp -rf jobs /usr/share/checkbox/
cp -rf scripts/* /usr/share/checkbox/scripts/
cp -rf checkbox.d /etc/

exit 0
