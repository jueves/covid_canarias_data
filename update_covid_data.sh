#!/bin/bash
path="/home/pi/covid_canarias_data/"
log_file="/home/pi/covid_canarias_data/covid_data.log"
script="/home/pi/covid_canarias_data/get_covid_daily_data.py"
date_time="$(date)"
echo $date_time >>  $log_file

# Get data
#python3 $script >> $log_file
python3 /home/pi/covid_canarias_data/get_covid_daily_data.py >> $log_file

# Upload data
cd $path
git add data/cv19_asignacion.csv >> $log_file
git add data/cv19_asignacion_agrupados.csv >> $log_file
git add data/cv19_residencia.csv >> $log_file

git commit -m "Data update" >> $log_file

git push >> $log_file

echo "" >> $log_file
echo "---------" >> $log_file
echo "" >> $log_file
