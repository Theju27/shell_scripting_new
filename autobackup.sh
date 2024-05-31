#!/bin/bash

#############################################################################
#   NAME: AUTOMATED BACKUP
#   PURPOSE: It backups the file in Source folder to the destination folder"
#############################################################################

N="\e[0m"
G="\e[32m"
R="\e[31m"
SOURCE_DIR="$1"
TIME=$(date +"%Y%m%d%H%M%S")
echo " Time: $TIME"
echo " Source_dir: $SOURCE_DIR"
DESTINATION_DIR="$2/$TIME"
echo " Destination_dir: $DESTINATION_DIR"
mkdir -p $DESTINATION_DIR
cp -r $SOURCE_DIR $DESTINATION_DIR
if [ $? -ne 0 ]; then
	echo -e " ${R} Backup failed ${N}"
	exit 1
else
	echo -e " ${G} Backup successful ${N}" 
	ls -l ${DESTINATION_DIR}
	echo -e " ${G} Backup Completed on:${TIME} ${N}"    
fi
