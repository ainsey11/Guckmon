#/bin/bash
while true
do
	Routertempsensor=$(php ~/ObservertoGrafana/RouterTemp.php)
	#PowerUsageUPS1=$(php ~/ObservertoGrafana/PowerUsageUPS1.php)
	#PowerUsageUPS2=$(php ~/ObservertoGrafana/PowerUsageUPS2.php)
	#PowerTempUPS1=$(php ~/ObservertoGrafana/PowerTempUPS1.php)
	#PowerTempUPS1=$(php ~/ObservertoGrafana/PowerTempUPS2.php)
	#CurrentAlerts=$(php ~/ObservertoGrafana/CurrentAlerts.php)
	echo $Routertempsensor
	#echo $PowerUsageUPS1
	#echo $PowerUsageUPS2
	#echo $PowerTempUPS1
	#echo $PowerTempUPS2
	#echo $CurrentAlerts

#	echo "Writing Temp Data"
#curl -X POST 'http://10.1.2.141:8086/db/DB02/series?u=grafana&p=grafana&time_precision=s' \
#  -d '[
#  {
#    "name": "Tempsv2",
#    "columns": ["value", "sensor"],
#    "points": [
#      [$RouterTempSensor, RouterTempSensor],
#      [$PowerTempUPS1, PowerTempUPS1],
#      [$PowerTempUPS2, PowerTempUPS2]
#    ]
#  }
#]' \
# -w "%{http_code}\n"

       echo "Writing Temp Data"
curl -X POST 'http://10.1.2.141:8086/db/DB02/series?u=grafana&p=grafana&time_precision=s' \
  -d '[
  {
    "name": "Tempsv2",
    "columns": ["value", "sensor"],
    "points": [
      [$RouterTempSensor, RouterTempSensor]
    ]
  }
]' \
 -w "%{http_code}\n"



#        echo "Writing Power Data"
#curl -X POST 'http://10.1.2.141:8086/db/DB03/series?u=grafana&p=grafana&time_precision=s' \
#  -d '[
#  {
#    "name": "PowerV2",
#    "columns": ["value", "sensor"],
#    "points": [
#      [$PowerUsageUps1, PowerUsageUPS1],
#      [$PowerUsageUps2, PowerUsageUPS2],
#      ]
#  }
#]' \
# -w "%{http_code}\n"



done
