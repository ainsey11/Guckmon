import os
import time
import subprocess
from influxdb.influxdb08 import InfluxDBClient

while True:
	routertemp = subprocess.check_output(['php', '/#####/ObservertoGrafana/RouterTemp.php'])
	ups1temp = subprocess.check_output(['php', '/#####/ObservertoGrafana/PowerTempUPS1.php'])
	ups2temp = subprocess.check_output(['php', '/#####/ObservertoGrafana/PowerTempUPS2.php'])
	ups1consump = subprocess.check_output(['php', '/#####/ObservertoGrafana/PowerUsageUPS1.php'])
	ups2consump = subprocess.check_output(['php', '/#####/ObservertoGrafana/PowerUsageUPS2.php'])
	print("Posting Data")

	routertempjson = [
			  {
	   "name" : "routertemp_c",
	   "columns" : ["value", "sensor"],
	   "points" : [
	       [routertemp, "Mikrotik"]
	   ]
	}
	]

	ups1tempjson = [
                          {
           "name" : "ups1temp_c",
           "columns" : ["value", "sensor"],
           "points" : [
               [ups1temp, "UPS1"]
           ]
        }
        ]

	ups2tempjson = [
                          {
           "name" : "ups2temp_c",
           "columns" : ["value", "sensor"],
           "points" : [
               [ups2temp, "UPS2"]
           ]
        }
        ]
	ups1consumpjson = [
                          {
           "name" : "ups1consump_w",
           "columns" : ["value", "sensor"],
           "points" : [
               [ups1consump, "UPS1PSU"]
           ]
        }
        ]
	ups2consumpjson = [
                          {
           "name" : "ups2consump_w",
           "columns" : ["value", "sensor"],
           "points" : [
               [ups2consump, "UPS2PSU"]
           ]
        }
        ]


	
	client = InfluxDBClient('10.1.2.141', 8086, '#####', '#####', 'DB02')
	client.write_points(routertempjson)
	client.write_points(ups1tempjson)
	client.write_points(ups2tempjson)
	client.write_points(ups1consumpjson)
	client.write_points(ups2consumpjson)
	print(routertemp)
	print(ups1temp)
	print(ups2temp)
	print(ups1consump)
	print(ups2consump)
	print("Data Posted to InfluxDB")
	time.sleep(5)
