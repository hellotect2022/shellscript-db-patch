UPDATE messenger.channel_Info AS CI
SET CI.Password = CAST(HEX(aes_encrypt(CI.Password,'DH')) AS CHAR);

INSERT INTO `sys_config` (`Code`, `SystemGroup`, `Value`) VALUES ('UseClassicTheme', 'E', '\"Y\"');

UPDATE `sys_config` SET `Value` = '[{\"name\": \"blue\", \"value\": \"#0095EB\", \"subValue\": \"#CCEAFB\", \"classicValue\": \"#12CFEE\"}, {\"name\": \"red\", \"value\": \"#F04040\", \"subValue\": \"#FEDBDB\", \"classicValue\": \"#ff786d\"}, {\"name\": \"green\", \"value\": \"#6FB128\", \"subValue\": \"#E2EFD4\", \"classicValue\": \"#59d85c\"}, {\"name\": \"black\", \"value\": \"#333\", \"subValue\": \"#CBCBCB\", \"classicValue\": \"#333\"}, {\"name\": \"yellow\", \"value\": \"#ffbb00\", \"subValue\": \"#FFF1CC\", \"classicValue\": \"#ffbb00\"}]' WHERE (`Code` = 'ClientThemeList');

INSERT INTO `sys_config` (`Code`, `SystemGroup`, `Comment`, `Value`) VALUES ('UseUserSettingSync', 'C', '[환경설정]유저설정값 변경시 서버db 동기화기능', '\"N\"');


INSERT INTO `sys_config` (`Code`, `SystemGroup`, `Comment`, `Value`) VALUES ('physicalChannelFile', 'S', '채널 물리 파일 삭제여부', 'N');
INSERT INTO `sys_config` (`Code`, `SystemGroup`, `Comment`, `Value`) VALUES ('physicalNoteFile', 'S', '쪽지 물리 파일 삭제여부', 'N');
INSERT INTO `sys_config` (`Code`, `SystemGroup`, `Comment`, `Value`) VALUES ('physicalChattingFile', 'S', '채팅 물리 파일 삭제여부', 'Y');

INSERT INTO `sys_config` (`Code`, `SystemGroup`, `Comment`, `Value`) VALUES ('roomPeriod', 'S', 'Room 유지 기간', 'NONE');
INSERT INTO `sys_config` (`Code`, `SystemGroup`, `Comment`, `Value`) VALUES ('channelMessagePeriod', 'S', '채널 메세지 보관기간', 'NONE');

INSERT INTO `sys_config` (`Code`, `SystemGroup`, `Comment`, `Value`) VALUES ('noticeMessageManage', 'S', '알림메시지 관리 기능', '{\"use\":\"N\",\"period\":\"1\"}');
INSERT INTO `sys_config` (`Code`, `SystemGroup`, `Comment`, `Value`) VALUES ('noticeStorageUsage', 'S', 'storage 경고알림 사용량', '90');
