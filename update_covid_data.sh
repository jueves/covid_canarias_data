#!/bin/bash
path="/home/pi/covid_canarias_data/"
log_file="/home/pi/covid_canarias_data/covid_data.log"
date_time="$(date)"
echo $date_time >>  $log_file

# Get data
cd $path
python3 get_covid_daily_data.py >> $log_file

# Upload data
git add data/cv19_asignacion.csv >> $log_file
git add data/cv19_asignacion_agrupados.csv >> $log_file
git add data/cv19_residencia.csv >> $log_file

git commit -m "Data update" >> $log_file

git push >> $log_file

echo "" >> $log_file
echo "---------" >> $log_file
echo "" >> $log_file
