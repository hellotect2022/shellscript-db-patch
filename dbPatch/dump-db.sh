#!/bin/bash

DB_HOST="192.168.11.202"
DB_USER="eumtalk"
DB_PASS="CHx8NiXGjkw9aWv2"
DATABASES=("messenger" "messenger_syncdata")
#DATABASES=("messenger_syncdata")
DUMP_DIR="./dbDumps"


# 데이터베이스별로 테이블 덤프
for DB_NAME in "${DATABASES[@]}"; do
    # 덤프 파일을 저장할 디렉터리 생성
    mkdir -p $DUMP_DIR/${DB_NAME}/total
    mkdir -p $DUMP_DIR/${DB_NAME}/individual


    echo "Processing database: $DB_NAME"

    mysqldump -h $DB_HOST -u $DB_USER -p$DB_PASS \
            --single-transaction \
            --default-character-set=utf8mb4 \
            $DB_NAME > "$DUMP_DIR/${DB_NAME}/total/${DB_NAME}_total_dump.sql"

    # 데이터베이스의 테이블 목록 가져오기
    tables=$(mysql -h $DB_HOST -u $DB_USER -p$DB_PASS -e "SHOW TABLES IN $DB_NAME;" | awk '{if (NR>1) print $1}')

    # 각 테이블 덤프
    for table in $tables; do
        echo "  Dumping table: $table from $DB_NAME"
        mysqldump -h $DB_HOST -u $DB_USER -p$DB_PASS \
            --single-transaction \
            --default-character-set=utf8mb4 \
            $DB_NAME $table > "$DUMP_DIR/${DB_NAME}/individual/${table}.sql"
    done
done

echo "All tables from all databases have been dumped to $DUMP_DIR"

