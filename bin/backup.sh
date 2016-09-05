#!/bin/bash

LOG="/home/scott/backup/backup.log"
CFG="/home/scott/backup/.backup.cfg"
NODE="192.168.3.118"
USER="scott"
PASS="scott"
EMAIL="scott.walkinshaw@datamine.com"
FILE="/home/scott/backup/backup_hermes_$(date +%d%m%Y).tgz"
TARGET="/home/scott"
ERROR=0

exec >| $LOG 2>&1

echo -e "\n\t***** Backup Started @ [$(date)] *****\n"

####
#  Delete yesterday's archive
####
read OLD_FILE < $CFG
\rm -f $OLD_FILE

####
#  Tar the files
####
tar -cvzf $FILE --exclude 'home/scott/backup/*' $TARGET 
echo $?
if [ $? -eq 0 ]; then
  echo "Tar of [/home/scott] . . . [SUCCESS]"
else
  echo "Tar of [/home/scott] . . . [FAILURE]"
  ERROR=1
fi

####
#  Transfer the files to workstation
####
if [ $ERROR -eq 0 ]; then

  {
    echo "open $NODE"
    echo "user $USER $PASS"
    echo "prompt"
    echo "bin"
    echo "del $(basename $OLD_FILE)"
    echo "put $FILE $(basename $FILE)"
  } | ftp -n -v

  if [ $? -eq 0 ]; then
    echo "FTP of [$(basename $FILE)] . . . [SUCCESS]"
  else
    echo "FTP of [$(basename $FILE)] . . . [FAILURE]"
    ERROR=1
  fi
fi

####
#  Email on success/failure
####
if [ $ERROR -eq 0 ]; then
  mailx -s "Hermes Backup [SUCCESS]" $EMAIL < $LOG > /dev/null 2>&1
  
  ####
  #  Save successful filename
  ####
  echo $FILE > $CFG

else
  mailx -s "Hermes Backup [FAILURE]" $EMAIL < $LOG > /dev/null 2>&1
fi

echo -e "\n\t***** Backup Complete @ [$(date)] Status [$ERROR] *****"
exit $ERROR
