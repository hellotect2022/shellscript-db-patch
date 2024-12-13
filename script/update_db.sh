#!/bin/bash


DATABASES=$1
CUSTOMER_NAME=$2

# 데이터베이스별로 테이블 덤프
for DB_NAME in "${DATABASES[@]}"; do
    # 덤프 파일을 저장할 디렉터리 생성
    if [ $DB_NAME == "messenger_starluxe" ]; then
    	echo "messenger DB 업데이트 합니다. "
	
	SQL_PATH1="./dbPatch/$CUSTOMER_NAME/"$CUSTOMER_NAME"_db_update.sql"
	SQL_PATH2="./dbPatch/common_insert_query/insert_sys_base_lang_mime.sql"
	SQL_PATH3="./dbPatch/common_insert_query/insert_messenger_function.sql"
	SQL_PATH4="./dbPatch/common_insert_query/update_channel_info_sys_config.sql"

	MYSQL_COMMAND="mysql -h $DB_HOST -u $DB_USER -p$DB_PASS $DB_NAME --force"

	#echo "$CUSTOMER_NAME 개별 업데이트"
	#echo "USE $DB_NAME;" | cat - $SQL_PATH1 |$MYSQL_COMMAND > error_db_update.sql.log 2>&1

	#echo "$CUSTOMER_NAME << insert_sys_base_lang_mime.sql"
        #echo "USE $DB_NAME;" | cat - $SQL_PATH2 |$MYSQL_COMMAND > error_lang_mime.sql.log 2>&1

	#echo "$CUSTOMER_NAME << insert_messenger_function.sql"
        #echo "USE $DB_NAME;" | cat - $SQL_PATH3 |$MYSQL_COMMAND > error_function.sql.log 2>&1

	echo "$CUSTOMER_NAME << update_channel_info_sys_config.sql"
	echo "USE $DB_NAME;" | cat - $SQL_PATH4 |$MYSQL_COMMAND > error_sys_config.sql.log 2>&1

    fi

    if [ $DB_NAME == "messenger_syncdata" ]; then
    	echo "messenger_syncdata DB 업데이트 합니다. "
	SQL_PATH5="./dbPatch/common_insert_query/messenger_syncdata_total_dump.sql"
	MYSQL_COMMAND="mysql -h $DB_HOST -u $DB_USER -p$DB_PASS $DB_NAME --force"
	"USE $DB_NAME;" | cat - $SQL_PATH5 |$MYSQL_COMMAND > error_db_syncdata.sql.log 2>&1
    fi
    
done

