#!/bin/bash
#Script que recolecta:
# ○ Ultimas 3 lineas del archivo /var/log/syslog
# ○ Espacio de disco utilizado en el raid0 /dev/md/mediastream
# ○ Hash del archivo /var/log/auth.log
# Se ejecuta cada 5 minutos y escribe en ${LOG_OUT}
LOG_OUT=/mediastream/recolecta_info.log
SYSLOG=/var/log/syslog
FILE_2_HASH=/var/log/auth.log
RAID=/mediastream
NOW=$(date "+%b %d %H:%M:%S")
#Script Start
echo "Revision de estadisticas a las ${NOW}" >> ${LOG_OUT}
/usr/bin/tail -n3 ${SYSLOG} >> ${LOG_OUT}
/bin/df -h ${RAID} >> ${LOG_OUT}
/usr/bin/sha1sum /var/log/auth.log  >> ${LOG_OUT}
echo "\r" >> ${LOG_OUT}
return 0
