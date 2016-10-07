apt-get install libapache2-mod-php7.0 php7.0-cli php7.0-mysql php7.0-mysqli php7.0-gd php7.0-mcrypt php7.0-json \
php-pear snmp fping mysql-server mysql-client python-mysqldb rrdtool subversion whois mtr-tiny ipmitool \
graphviz imagemagick apache2
mkdir -p /opt/observium && cd /opt

wget http://www.observium.org/observium-community-latest.tar.gz
tar zxvf observium-community-latest.tar.gz
cd observium
cp /opt/Guckmon/observium/observiumconfig.php /opt/observium/config.php
cp /opt/Guckmon/observium/observiumcron /etc/cron.d/observium
cp /opt/Guckmon/observium/000-default.conf /etc/apache2/sites-available/000-default.conf

phpenmod mcrypt
a2enmod rewrite
apache2ctl restart
./adduser.php ainsey11 carsrule 10



chmod 755 /etc/cron.d/observium

