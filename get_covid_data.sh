#!/bin/bash
log_file="/home/pi/covid_data/covid_data.log"
script="/home/pi/covid_data/get_covid_daily_data.py"
date_time="$(date)"
echo $date_time >>  $log_file

python3 $script >> $log_file

echo "" >> $log_file
echo "---------" >> $log_file
echo "" >> $log_file
