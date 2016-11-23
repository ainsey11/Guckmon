# Guckmon

Guckmon is a custom built monitoring solution that uses grafana as a backend engine, mysql and influxdb for a database engine and grafana for a front end.

#### Languages Used
  - php
  - python
  - bash
  - powershell

#### Installation Instructions
> note, this is still in development, I will populate this over time

Create 6 servers
- 2 database servers, one running mysql and the other influxdb

you may cluster the mysql and influxdb if you wish , I reccomend using Haproxy as a load balancer to present a single IP for communications. 
- 2 front end servers, one with observium installed, the other with grafana installed

when building these, use the 2 database servers for your database connections.

- 2 back end servers, one on windows for powershell scripts and the other on ubuntu for the other code, clone this git repo to both servers.

#### Observium Server
cd into /opt/Guckmon after running the chef cookbook
configure the observiumconfig.php file to suit
configure any other php files to a custom config if you require additional configuration from default.
once configured, run all of the scripts within the installation directory.

To make my life easy, I made a sync script to sync observium to librenms, and then enabled the librenms influxdb configuration
this saves me having to do hacky config to get data from mysql into influxdb. 

run the Pi-GetTemps on the Pi with the temp sensors installed, this will pull from sensors and send to influx on the PI direct,
run the other data shipping python files on the backend servers. It'll be obvious which ones go where.

#### Notes

This is still in development, running it in production is probably a bad idea, but heh - go for it if you really want.

make sure you have plenty of servers reporting into observium, this code will require a lot of manual editing to tailer to your environment.

I'm primarily making this deployable via chef, as automatic as I possibly can, but as it's such a niche system it'll take a lot of editing to make it work for you,
I've found librenms + influxdb causes a few headaches, trying to work round those so it's taking some time. 

any questions - just ask! 
