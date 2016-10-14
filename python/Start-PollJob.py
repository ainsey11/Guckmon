import os
import time
import subprocess
from influxdb import InfluxDBClient

PDU1Usage = subprocess.check_output(['php', '/home/robert/Documents/github/Guckmon/php/PDU1_Usage.php'])
PDU2Usage = subprocess.check_output(['php', '/home/robert/Documents/github/Guckmon/php/PDU2_Usage.php'])

PDU1Usagejson = [
{
        "measurement": "PDU1Usage",
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
        "measurement": "PDU2Usage",
        "tags": {
            "PDU": "2",
                },
        "fields": {
            "value": PDU2Usage
        }
    }
]

client = InfluxDBClient('10.1.1.52', 8086, 'guckmon', 'guckmon', 'guckmon1')
client.write_points(PDU1Usagejson)
client.write_points(PDU2Usagejson)

print(PDU1Usage)
print("Data Posted to InfluxDB")
time.sleep(5)
