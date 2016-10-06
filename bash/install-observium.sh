apt-get install libapache2-mod-php7.0 php7.0-cli php7.0-mysql php7.0-mysqli php7.0-gd php7.0-mcrypt php7.0-json \
php-pear snmp fping mysql-server mysql-client python-mysqldb rrdtool subversion whois mtr-tiny ipmitool \
graphviz imagemagick apache2
mkdir -p /opt/observium && cd /opt

wget http://www.observium.org/observium-community-latest.tar.gz
tar zxvf observium-community-latest.tar.gz
cd observium
cp /opt/Guckmon/bash/observiumconfig.php /opt/observium/config.php
cp /opt/Guckmon/bash/observiumcron /etc/cron.d/observium
chmod 755 /etc/cron.d/observium

