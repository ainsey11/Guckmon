#!/bin/bash
 
# observium-upgrade.sh
# Script to update Observium to Latest
 
cd /opt
 
if [ -d "observium_old" ]; then
    rm -Rf observium_old
fi
 
if [ -f "observium-community-latest.tar.gz" ]; then
    rm -Rf observium-community-latest.tar.gz
fi
 
mv observium observium_old
wget http://www.observium.org/observium-community-latest.tar.gz
tar zxvf observium-community-latest.tar.gz
mv /opt/observium_old/rrd observium/
mv /opt/observium_old/*log* observium/
mv /opt/observium_old/config.php observium/
 
/opt/observium/discovery.php -h all
