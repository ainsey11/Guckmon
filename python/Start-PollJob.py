import os
import time
import subprocess
from influxdb import InfluxDBClient
from  unifi.controller import Controller
c = Controller('10.1.1.134', 'guckmon', 'Guckmon')

while True:
	PDU1Usage = subprocess.check_output(['php', '/home/robert/Documents/github/Guckmon/php/PDU1_Usage.php'])
	PDU2Usage = subprocess.check_output(['php', '/home/robert/Documents/github/Guckmon/php/PDU2_Usage.php'])
	RouterTemp = subprocess.check_output(['php', '/home/robert/Documents/github/Guckmon/php/Router-Temp.php'])

	PDU1Usage = PDU1Usage.replace("\n","")
	PDU2Usage = PDU2Usage.replace("\n","")
	RouterTemp = RouterTemp.replace("\n","")


	PDU1Usagejson = [
	{
			"measurement": "PDUUsage",
			"tags": {
				"PDU": "1",
					},
			"fields": {
				"value": PDU1Usage
			}
		}
	]

	PDU2Usagejson = [
	{
			"measurement": "PDUUsage",
			"tags": {
				"PDU": "2",
					},
			"fields": {
				"value": PDU2Usage
			}
		}
	]
	RouterTempjson = [
	{
			"measurement": "RouterTemperature",
			"tags": {
				"Router": "1",
					},
			"fields": {
				"value": RouterTemp
			}
		}
	]
	client = InfluxDBClient('10.1.1.52', 8086, 'guckmon', 'guckmon', 'guckmon1')

	client.write_points(PDU1Usagejson)
	client.write_points(PDU2Usagejson)
	client.write_points(RouterTempjson)

	print(PDU1Usage)
	print(PDU2Usage)
	print(RouterTemp)
	print("Data Posted to InfluxDB")
	time.sleep(30)

