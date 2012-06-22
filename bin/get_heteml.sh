#!/bin/sh

BK_PATH="/home/kazuki/backup_heteml"
TARGET_HOST="heteml"
TARGET_PATH="~/backup"
DATE=`date '+%Y%m%d'`

scp ${TARGET_HOST}:${TARGET_PATH}/mysql_chimaru_${DATE}.sql.gz ${BK_PATH}/
scp ${TARGET_HOST}:${TARGET_PATH}/mysql_woodf_${DATE}.sql.gz ${BK_PATH}/
scp ${TARGET_HOST}:${TARGET_PATH}/${DATE}_wp_cm.tar.gz ${BK_PATH}/
scp ${TARGET_HOST}:${TARGET_PATH}/${DATE}_wp_wf.tar.gz ${BK_PATH}/

exit 0
