#!/bin/bash
#Crea backup de la BD de MongoDB a las 5 y 20 UTC
DATE=$(date "+%Y%m%d_%H%M%S")
PATH_BACKUP=/mediastream
echo "Ejecutando backup de MongoDB para la fecha ${DATE}" >> /var/log/mongo_backup.log
/usr/bin/mongodump --gzip --archive=${PATH_BACKUP}/${DATE}_mongodbbkp.gz 2>&1 | tee -a /var/log/mongo_backup.log
