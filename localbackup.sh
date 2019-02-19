#!/usr/bin/env bash

#This script perform a system backup

#Establishes variable for current date and time for labeling purposes
TodaysDate=`date +%Y%m%d-%H%M`
#Establishes the location (folder is unique based on current date/time)
BackupLocation=/home/$(whoami)/backup-$TodaysDate

#Makes a directory based on current time, date, and user running the script.
mkdir -p $BackupLocation 

#copies the home directory - users personal files
rsync -aqih --progress /home/ $BackupLocation 

#copies the users configuration files
rsync -aqih --progress /etc/ $BackupLocation 

####Failed attempt to copy with a progress bar. Silenced output for now until I can fix it.
#FileCount=`find /etc/ | wc -l`
#echo "FileCount is $FileCount"
#rsync -aqih --progress /etc/ $BackupLocation | pv -lpes $FileCount

###### These are optional. Remove # to add them to the backup list. ########
#copies the users "miscellaneous/variable" files - may or may not be valuable.
#rsync -Phqi /var/ $BackupLocation 

#copies users applications installed
#rsync -Phqi /usr/local/ $BackupLocation 
