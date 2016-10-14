#!/usr/bin/python
#loading up modules
from w1thermsensor import W1ThermSensor
import os
import time
from influxdb import InfluxDBClient

while True:

        sensor1 = W1ThermSensor(W1ThermSensor.THERM_SENSOR_DS18B20, "041501a634ff")
        sensor1_val = sensor1.get_temperature(W1ThermSensor.DEGREES_C)

        sensor2 = W1ThermSensor(W1ThermSensor.THERM_SENSOR_DS18B20, "041501aedaff")
        sensor2_val = sensor2.get_temperature(W1ThermSensor.DEGREES_C)

        sensor3 = W1ThermSensor(W1ThermSensor.THERM_SENSOR_DS18B20, "031501c516ff")
        sensor3_val = sensor3.get_temperature(W1ThermSensor.DEGREES_C)

        sensor4 = W1ThermSensor(W1ThermSensor.THERM_SENSOR_DS18B20, "031501c51fff")
        sensor4_val = sensor4.get_temperature(W1ThermSensor.DEGREES_C)

        sensor5 = W1ThermSensor(W1ThermSensor.THERM_SENSOR_DS18B20, "031501c1e1ff")
        sensor5_val = sensor5.get_temperature(W1ThermSensor.DEGREES_C)

print("posting data")

Sensor1Json = [
{
        "measurement": "ShedTemp",
        "tags": {
            "Sensor": "1",
                },
        "fields": {
            "Temperature": sensor1_val
        }
    }
]
Sensor2Json = [
{
        "measurement": "ShedTemp",
        "tags": {
            "Sensor": "2",
                },
        "fields": {
            "Temperature": sensor2_val
        }
    }
]

Sensor3Json = [
{
        "measurement": "ShedTemp",
        "tags": {
            "Sensor": "3",
                },
        "fields": {
            "Temperature": sensor3_val
        }
    }
]
Sensor4Json = [
{
        "measurement": "ShedTemp",
        "tags": {
            "Sensor": "4",
                },
        "fields": {
            "Temperature": sensor4_val
        }
    }
]

Sensor5Json = [
{
        "measurement": "ShedTemp",
        "tags": {
            "Sensor": "5",
                },
        "fields": {
            "Temperature": sensor5_val
        }
    }
]

client = InfluxDBClient('10.1.1.52', 8086, 'guckmon', 'guckmon', 'guckmon1')
client.write_points(Sensor1Json)
client.write_points(Sensor2Json)
client.write_points(Sensor3Json)
client.write_points(Sensor4Json)
client.write_points(Sensor5Json)
print(sensor1_val)
print(sensor2_val)
print(sensor3_val)
print(sensor4_val)
print(sensor5_val)
time.sleep(2)


