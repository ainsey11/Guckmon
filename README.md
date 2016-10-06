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

#### Notes

This is still in development, running it in production is probably a bad idea, but heh - go for it if you really want.

make sure you have plenty of servers reporting into observium, this code will require a lot of manual editing to tailer to your environment.

any questions - just ask! 
