import pandas as pd
import requests

# For cv19_municipio-asignacion_casos_municipios.csv each new version of the file
# contains data for the actual day. So collecting and merging daily data.
# On the other side, new versions of cv19_municipio-residencia_casos.csv and
# cv19_municipio-asignacion_casos.csv include older data and also update missing values on
# atributes "fecha_curado" and "fecha_fallecido" whenever it's available. Therefore
# it doesn't make sense to merge with older versions.

# Set URLs
names_list = [
  {
    "url":"https://opendata.sitcan.es/upload/sanidad/cv19_municipio-asignacion_casos_municipios.csv",
    "file_name":"data/cv19_asignacion_agrupados.csv"},
  {
    "url":"https://opendata.sitcan.es/upload/sanidad/cv19_municipio-residencia_casos.csv",
    "file_name":"data/cv19_residencia.csv"
  },
  {
    "url":"https://opendata.sitcan.es/upload/sanidad/cv19_municipio-asignacion_casos.csv",
    "file_name":"data/cv19_asignacion.csv"
  }
]

# Update function
def update_data(names):
  url = names["url"]
  file_name = names["file_name"]
  
  # Get data
  data_old = pd.read_csv(file_name)
  data_new = pd.read_csv(url)
  
  # Merge data
  data = pd.concat([data_old, data_new])
  data = data.drop_duplicates()
  
  # Save data
  data.to_csv(file_name, index=False)
  
def download_data(names):
  url = names["url"]
  file_name = names["file_name"]
  
  req = requests.get(url)
    
  with open(file_name, 'wb') as f:
    f.write(req.content)


update_data(names_list[0])
download_data(names_list[1])
download_data(names_list[2])
