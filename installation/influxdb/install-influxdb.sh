curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -
source /etc/lsb-release
echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
apt-get update
apt-get install influxdb
service influxdb start
influxd config > /etc/influxdb/influxdb.generated.conf
influxd -config /etc/influxdb/influxdb.generated.conf

