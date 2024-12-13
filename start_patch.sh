#!/bin/bash

(
 export DB_HOST="192.168.12.14"
 export DB_USER="eumuser"
 export DB_PASS="Covi@2020"
 export DATABASES2=("messenger" "messenger_syncdata")
 export DUMP_DIR="./backup-db" 
 export UPDATE_DATABASES=("messenger_starluxe")
 export ROOT_DIR="/devp"

 P_BAK_DB="N"
 P_BAK_SERVER="N"
 P_UPT_DB="Y"
 P_UPT_SERVER="N"

 if [ "$P_BAK_DB" == "Y" ]; then
  echo "###### DB DUMP 작업 시작합니다. ######"
  # 배열로 반복 처리
  for DB_NAME in "${DATABASES2[@]}"; do
    ./script/backup_db.sh $DB_NAME
  done
 fi

 if [ "$P_BAK_SERVER" == "Y" ]; then
  echo "###### 서버 DUMP 작업 시작합니다. ######"
  ./script/backup_server.sh
 fi


 if [ "$P_UPT_DB" == "Y" ]; then
  #1.mainline 2.starluxe  3.iops  4.teso_engineering  5.korea_gold_x  6.mat  7.truebon  8.dongsim  9.vigencell 10.ibsh  11.RN2  12.duoback
  CUSTOMER_NAME="starluxe"
  echo "###### $CUSTOMER_NAME DB UPDATE 작업 시작합니다. ######"
  for DB_NAME in "${UPDATE_DATABASES[@]}"; do
    ./script/update_db.sh $DB_NAME $CUSTOMER_NAME
  done
 fi
)
