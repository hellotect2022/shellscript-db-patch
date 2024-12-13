#!/bin/bash

# 2. 백업 디렉토리 생성 및 이동
mkdir backup-eum && cd backup-eum
# 3. 서버 설정파일 백업
echo "properties 백업"
sudo cp -r $ROOT_DIR/app/properties .
# 4. 이벤트서버 백업
echo "이벤트서버 백업"
sudo cp -r $ROOT_DIR/app/event .
# 5. .war 파일 백업
echo "war 파일 백업"
sudo cp -r $ROOT_DIR/app/ui/*/*.war .
# 6. htmlsite 백업
echo "htmlsite 파일 백업"
sudo cp -r $ROOT_DIR/stor/htmlsite .
# 7. chatStlye 백업
echo "chatStly 파일 백업"
sudo cp -r $ROOT_DIR/stor/chatStyle .

