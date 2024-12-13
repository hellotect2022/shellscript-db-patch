create table app_update_manager_log
(
    Number     int auto_increment
        primary key,
    UserID     varchar(50)                          not null comment '사용자',
    Platform   varchar(10)                          null comment 'Platform 종류',
    UpdateDate datetime default current_timestamp() null on update current_timestamp() comment '수정일',
    State      varchar(20)                          null comment '동기화 적용 결과'
)
    comment '앱 자동 업데이트 로그';

create index IDX_AUML_USERID
    on app_update_manager_log (UserID);

alter table app_version
    modify VID int auto_increment comment '버전ID';

alter table app_version
    modify Version varchar(50) null comment '버전';

alter table app_version
    modify Major int null comment 'Major버전';

alter table app_version
    modify Minor int null comment 'Minor버전';

alter table app_version
    modify Build int null comment 'Build버전';

alter table app_version
    modify Platform varchar(10) null comment 'Platform 종류';

alter table app_version
    modify Arch varchar(10) null comment 'Arch';

alter table app_version
    modify ReleaseNote text null comment '릴리즈 Note';

alter table app_version
    modify ForceUpdate char default 'N' null comment '필수 업데이트 여부';

alter table app_version
    modify RegistDate datetime default current_timestamp() null comment '생성일';

alter table app_version
    modify PublishDate datetime null comment '배포일';

alter table app_version
    modify DeleteLocalData char default 'N' null comment '로컬데이터 삭제여부';

alter table app_version
    comment '클라이언트버전';

alter table app_version
    add PossibleDownload char default 'N' null;

create table board_message
(
    NoticeID   int auto_increment comment '게시글 ID'
        primary key,
    UserID     varchar(50)                          not null comment '유저 ID',
    Title      varchar(50)                          not null comment '제목',
    Content    varchar(300)                         not null comment '내용',
    CreateDate datetime default current_timestamp() not null comment '생성 날짜',
    UpdateDate datetime default current_timestamp() null comment '수정 날짜',
    DeleteDate datetime                             null comment '삭제 날짜',
    ViewCount  int      default 0                   null comment '조회수'
)
    comment '게시판';

create index UserID
    on board_message (UserID);

alter table category_code
    comment '카테고리 코드';

alter table channel_info
    modify RoomID int not null comment '채팅방ID';

alter table channel_info
    modify Password varchar(255) null comment '암호';

alter table channel_info
    modify UpdateID varchar(50) null comment '수정자';

alter table channel_info
    comment '채널 정보';

create table chinese_wall
(
    ID          bigint(11) auto_increment
        primary key,
    Block1      varchar(50)                          not null,
    CompanyCode varchar(50)                          not null,
    Block2      varchar(50)                          not null,
    BlockType1  char(2)                              not null comment 'U : 사용자, G : 그룹',
    BlockType2  char(2)                              not null comment 'U : 사용자, G : 그룹',
    IsChat      char     default 'Y'                 null,
    IsFile      char     default 'Y'                 null,
    RegistDate  datetime default current_timestamp() null,
    ModifyDate  datetime default current_timestamp() null on update current_timestamp()
);

create table communication_log
(
    `INDEX`       bigint auto_increment
        primary key,
    ID            varchar(100)                         null,
    URL           varchar(500)                         null,
    AUTHORIZATION varchar(200)                         null,
    CONTENTTYPE   varchar(100)                         null,
    PARAM         text                                 null,
    RESPONSE      text                                 null,
    STATUS        varchar(50)                          null,
    REGISTDATE    datetime default current_timestamp() not null
)
    charset = utf8mb3;

alter table company
    modify CompanyCode varchar(50) not null comment '회사코드';

alter table company
    modify CompanyURL varchar(150) null comment '도메인 주소';

create table company_attendance_mng_mst
(
    CompanyCode      varchar(50)                          not null
        primary key,
    SchName          varchar(100)                         null comment '근무제명',
    MultiDisplayName varchar(2000)                        null comment '다국어정보',
    StartDate        time                                 null comment '시작일시',
    EndDate          time                                 null comment '종료일시',
    RegistDate       datetime default current_timestamp() null,
    UpdateDate       datetime default current_timestamp() null on update current_timestamp()
)
    charset = utf8mb3;

alter table default_group
    modify GroupCode varchar(100) not null comment '그룹코드';

alter table default_group
    modify GroupType varchar(50) null comment '그룹타입';

alter table default_group
    modify GroupPath varchar(200) null comment '그룹경로';

alter table default_group
    modify DisplayName varchar(200) null comment '그룹명';

alter table default_group
    modify MultiDisplayName varchar(1000) null comment '다국어 그룹명';

alter table default_group
    modify SortKey varchar(5) null comment '우선순위';

alter table default_group
    modify IsUse char null comment '사용여부';

alter table default_group
    modify IsHR char null comment '인사연동여부';

alter table default_group
    modify IsDisplay char null comment '표시여부';

alter table default_group
    modify Reserved1 char default 'Y' null comment '예비필드1';

alter table default_group
    modify Reserved2 varchar(50) null comment '예비필드2';

alter table default_group
    comment '기본그룹';

create table e_engineering
(
    engineeringID            varchar(50)                          not null
        primary key,
    engineeringName          varchar(100)                         not null,
    engineeringPhoto         varchar(500)                         not null,
    engineeringPhotoFullPath varchar(500)                         not null,
    createDate               datetime default current_timestamp() null,
    updateDate               datetime default current_timestamp() null on update current_timestamp()
);

create table e_message_block
(
    noMessageBlock bigint auto_increment
        primary key,
    blockCode      varchar(50)                          null,
    blockType      varchar(50)                          null,
    description    varchar(250)                         null comment '설명',
    createDate     datetime default current_timestamp() null,
    updateDate     datetime default current_timestamp() null on update current_timestamp()
);

create table e_questions_log
(
    noQuestionsLog   bigint auto_increment
        primary key,
    noRuleMessage    bigint   default 0                   not null,
    noEntity         bigint   default 0                   not null,
    noClassification bigint   default 0                   not null,
    userID           varchar(100)                         null comment '사용자',
    questions        text                                 null,
    questionsPOS     text                                 null,
    `key`            varchar(100)                         null,
    responseMessage  text                                 null,
    linkUrl          varchar(500)                         null,
    createDate       datetime default current_timestamp() null,
    updateDate       datetime default current_timestamp() null on update current_timestamp()
);

create table e_rule
(
    noRule        bigint auto_increment
        primary key,
    rule          varchar(50)                                                       not null,
    subRule       varchar(50) default ''                                            null,
    ruleCode      varchar(10)                                                       not null,
    createDate    datetime    default current_timestamp()                           null,
    updateDate    datetime    default current_timestamp()                           null on update current_timestamp(),
    engineeringID varchar(50) default 'eumbot-758f37d1-f6a6-4bc2-bb5b-0376da769697' null
);

create index IDX_ER_RULE
    on e_rule (rule);

create index IDX_ER_RULECODE
    on e_rule (ruleCode);

create index IDX_ER_SUBRULE
    on e_rule (rule, subRule);

create table e_rule_classification
(
    noClassification bigint auto_increment
        primary key,
    classification   varchar(50)                          null,
    entity           varchar(50)                          null,
    name             varchar(50)                          null,
    ruleName         varchar(50)                          null,
    blockCode        varchar(50)                          null,
    createDate       datetime default current_timestamp() null,
    updateDate       datetime default current_timestamp() null on update current_timestamp()
);

create index IDX_ERC_CLASSIFICATION
    on e_rule_classification (classification);

create index IDX_ERC_ENTITY
    on e_rule_classification (classification, entity);

create table e_rule_entity
(
    noEntity         bigint auto_increment
        primary key,
    noClassification bigint   default 0                     not null,
    entity           varchar(50)                            null,
    name             varchar(50)                            null,
    ruleName         varchar(100)                           null,
    blockCode        varchar(50)                            null,
    ruleCode         varchar(50) collate utf8mb3_unicode_ci null,
    createDate       datetime default current_timestamp()   null,
    updateDate       datetime default current_timestamp()   null on update current_timestamp()
);

create index IDX_ERE_CLASSIFICATION
    on e_rule_entity (noClassification);

create index IDX_ERE_ENTITY
    on e_rule_entity (noClassification, entity);

create table e_rule_message
(
    noRuleMessage  bigint auto_increment
        primary key,
    ruleCode       varchar(10) collate utf8mb3_unicode_ci null,
    classification varchar(50) collate utf8mb3_unicode_ci null,
    blockCode      varchar(50) collate utf8mb3_unicode_ci null,
    message        text     default ''                    null,
    searchValue    varchar(150)                           null,
    linkUrl        varchar(150)                           null,
    reserved1      varchar(150)                           null,
    reserved2      varchar(150)                           null,
    createDate     datetime default current_timestamp()   null,
    updateDate     datetime default current_timestamp()   null on update current_timestamp()
);

create index IDX_ERM_RULECODE
    on e_rule_message (ruleCode);

create table e_temp_question_classification
(
    tempNoClassification bigint auto_increment
        primary key,
    noTQM                bigint   default 0                   not null,
    noClassification     bigint   default 0                   not null,
    displayName          varchar(100)                         null,
    displayRuleName      varchar(100)                         null,
    entity               varchar(50)                          null,
    createDate           datetime default current_timestamp() null,
    updateDate           datetime default current_timestamp() null on update current_timestamp()
);

create index IDX_ERQC_NAME
    on e_temp_question_classification (displayName, displayRuleName);

create index IDX_ERQC_NOTQM
    on e_temp_question_classification (noTQM);

create table e_temp_question_message
(
    noTQM            bigint auto_increment
        primary key,
    noRuleMessage    bigint                               not null,
    noClassification bigint                               not null,
    noEntity         bigint   default 0                   not null,
    userID           varchar(100)                         null,
    `key`            varchar(100)                         null,
    questions        text                                 null,
    sentence         text                                 null,
    responseMessage  text                                 null,
    jsonMessage      text                                 null,
    createDate       datetime default current_timestamp() null
);

create index IDX_CLASSFICATION
    on e_temp_question_message (noClassification);

create index IDX_RULE_MESSAGE
    on e_temp_question_message (noRuleMessage);

alter table emoticon
    modify EmoticonID int auto_increment comment '이모티콘 ID';

alter table emoticon
    modify GroupID int not null comment '분류 ID';

alter table emoticon
    modify EmoticonName varchar(255) null comment '이모티콘명';

alter table emoticon
    modify PhotoPathStatic varchar(1000) null comment '일반 이모티콘 파일';

alter table emoticon
    modify PhotoPathAnimate varchar(1000) null comment '움직이는 이모티콘 파일';

alter table emoticon
    modify UpdateDate datetime default current_timestamp() null on update current_timestamp();

alter table emoticon
    modify SortKey int default 0 null;

alter table emoticon
    comment '이모티콘';

alter table emoticon
    row_format = DYNAMIC;

alter table emoticon_group
    modify GroupID int auto_increment comment '분류 ID';

alter table emoticon_group
    modify GroupName varchar(255) not null comment '분류 명';

alter table emoticon_group
    modify IsUse char default 'Y' null comment '사용여부';

alter table emoticon_group
    modify PhotoPath varchar(1000) null comment '이모티콘그룹 사진';

alter table emoticon_group
    modify SortKey int default 0 not null;

drop index DeleteDate on emoticon_group;

drop index IsUse on emoticon_group;

alter table emoticon_group
    comment '이모티콘분류';

alter table file
    modify FileID varchar(60) not null comment '파일ID';

alter table file
    modify StorageID int default 0 not null comment '스토리지 ID';

alter table file
    modify ServiceType varchar(10) not null comment '저장서비스타입';

alter table file
    modify Extension varchar(10) not null comment '확장자';

alter table file
    modify FileName varchar(130) not null comment '파일명';

alter table file
    modify ThumbFile varchar(260) null comment '썸네일';

alter table file
    modify FileSize int(50) not null comment '파일사이즈';

alter table file
    modify FilePath varchar(260) not null comment '파일경로';

alter table file
    modify SaveFileName varchar(130) not null comment '저장파일명';

alter table file
    modify RegisterCode varchar(50) not null comment '등록자';

alter table file
    modify RegistDate datetime default current_timestamp() not null comment '등록일';

alter table file
    modify Reserved varchar(50) null comment '예비필드';

alter table file
    modify DeleteDate datetime null comment '삭제한날짜';

alter table file
    modify PhysicalFile char default 'N' null comment '물리파일삭제여부';

alter table file
    modify PhysicalDelDate datetime null comment '물리파일삭제날짜';

alter table file
    modify IsImage char default 'N' null comment '이미지여부';

alter table file
    modify roomID int null comment '채팅방 ID';

alter table file
    comment '파일';

alter table file
    add NoteID bigint null;

create index IDX_NOTEID
    on file (NoteID);

create index IDX_ServiceType
    on file (NoteID, ServiceType);

create table file_download_permission
(
    id         bigint(11) auto_increment
        primary key,
    target     varchar(50)                          not null,
    targetType char(2)                              not null comment 'U : 사용자, G : 그룹',
    permission longtext                             null comment 'Permission json',
    registDate datetime default current_timestamp() null,
    updateDate datetime default current_timestamp() null on update current_timestamp()
);

create table gpt_file
(
    GPTFileID  int auto_increment
        primary key,
    FILE       mediumblob                           not null,
    DataSize   int(50)                              null,
    Extension  varchar(10)                          not null,
    RoomID     bigint                               not null,
    RegistID   varchar(50)                          not null,
    RegistDate datetime default current_timestamp() null,
    Title      varchar(255)                         null,
    MessageID  bigint                               null
);

alter table `group`
    modify GroupCode varchar(100) not null comment '그룹코드';

alter table `group`
    modify CompanyCode varchar(50) not null comment '회사코드';

alter table `group`
    modify GroupType varchar(30) not null comment '그룹타입';

alter table `group`
    modify MemberOf varchar(50) null comment '상위코드';

alter table `group`
    modify GroupPath varchar(500) null comment '그룹경로';

alter table `group`
    modify DisplayName varchar(200) null comment '그룹명';

alter table `group`
    modify MultiDisplayName varchar(2000) null comment '다국어그룹명';

alter table `group`
    modify SortKey int null comment '우선순위';

alter table `group`
    modify SortPath varchar(2000) null comment '우선순위경로';

alter table `group`
    modify IsUse char null comment '사용여부';

alter table `group`
    modify IsHR char null comment '인사연동여부';

alter table `group`
    modify IsDisplay char null comment '표시여부';

alter table `group`
    modify RegistDate datetime default current_timestamp() null comment '등록일시';

alter table `group`
    modify ModifyDate datetime default current_timestamp() null on update current_timestamp() comment '수정일시';

alter table `group`
    modify Reserved2 varchar(50) null comment '예비필드2';

alter table `group`
    modify RetireDept char default 'N' null comment '퇴직부서지정여부';

alter table `group`
    comment '그룹';

alter table group_member
    modify GroupCode varchar(100) not null;

alter table group_member
    modify UserID varchar(50) not null comment '사용자아이디';

alter table group_member
    modify CompanyCode varchar(50) not null comment '회사코드';

alter table group_member
    modify JobType varchar(50) not null comment '본직구분';

alter table group_member
    modify SortKey int default 0 null comment '순번';

alter table group_member
    modify IsUse char null comment '사용여부';

alter table group_member
    modify IsHR char null comment '인사연동여부';

alter table group_member
    modify JoinDate datetime default current_timestamp() null comment '발령일시';

alter table group_member
    modify LeaveDate datetime null comment '퇴사일시';

alter table group_member
    modify BaseGroupSeq int default 0 null comment '사용자그룹시퀀스';

alter table group_member
    comment '그룹원';

create index IDX_GROUP_MEMBER2
    on group_member (UserID, BaseGroupSeq);

alter table invite_external_user
    modify RoomID bigint not null comment '채팅방 ID';

alter table invite_external_user
    modify ExternalEmail varchar(200) not null comment '이메일';

alter table invite_external_user
    modify SecretCode text not null comment '시크릿코드';

alter table invite_external_user
    modify RegisterID varchar(50) not null comment '등록자 ID';

alter table invite_external_user
    modify RegistDate datetime not null comment '등록일';

alter table invite_external_user
    add CompanyCode varchar(50) not null;

alter table licenses_history
    modify `Index` int auto_increment comment '순번';

alter table licenses_history
    modify `Key` text not null comment '라이센스키';

alter table licenses_history
    modify Status text not null comment '상태';

alter table licenses_history
    modify CreateDate datetime default current_timestamp() not null comment '등록일';

alter table licenses_history
    modify LicType text default '' not null comment '라이센스타입';

alter table licenses_history
    modify CreateID varchar(50) default '' not null comment '등록자';

alter table licenses_history
    comment '라이센스 히스토리';

alter table logging_event
    modify timestmp bigint not null comment 'timestmp';

alter table logging_event
    modify formatted_message text not null comment '로그메세지';

alter table logging_event
    modify logger_name varchar(254) not null comment '로그명';

alter table logging_event
    modify level_string varchar(254) not null comment '로그레벨';

alter table logging_event
    modify thread_name varchar(254) null comment '쓰레드 명';

alter table logging_event
    modify caller_filename varchar(254) not null comment '호출한 파일 명';

alter table logging_event
    modify caller_class varchar(254) not null comment '호출한 클래스';

alter table logging_event
    modify caller_method varchar(254) not null comment '호출한 메소드';

alter table logging_event
    modify caller_line char(4) not null comment '호출한 소스 라인번호';

alter table logging_event
    modify event_id bigint auto_increment comment '이벤트 ID';

alter table logging_event
    modify create_date datetime default current_timestamp() null comment '생성일';

drop index create_date on logging_event;

alter table logging_event
    comment '로그이벤트';

alter table logging_event_exception
    modify event_id bigint not null comment '이벤트 ID';

alter table logging_event_exception
    modify trace_line varchar(254) not null comment '호출한 라인 번호';

alter table logging_event_exception
    comment 'Exception 로그 이벤트';

alter table logging_event_property
    modify event_id bigint not null comment '이벤트 ID';

alter table logging_event_property
    modify mapped_key varchar(254) not null comment '매핑 Key';

alter table logging_event_property
    modify mapped_value text null comment '매핑 값';

alter table logging_event_property
    comment '로그 이벤트 설정';

alter table login_history
    modify LogID int auto_increment comment '일련번호';

alter table login_history
    modify UserID varchar(30) not null comment '사용자 아이디';

alter table login_history
    modify IPAddress varchar(60) null comment '접속 IP';

alter table login_history
    modify OS varchar(100) null comment '접속 운영체제';

alter table login_history
    modify Browser varchar(100) null comment '접속 브라우저';

alter table login_history
    modify Token varchar(1000) not null comment '토큰';

alter table login_history
    modify LoginType char null comment '로그인 타입(m :  모바일, d : 데스크톱, b :  브라우저, p :  패드, A :  Admin 페이지)';

alter table login_history
    modify Page varchar(10) null comment '접속Server';

alter table login_history
    modify LoginDate datetime default current_timestamp() not null comment '접속시간';

alter table login_history
    modify LogoutDate datetime null comment '로그아웃시간';

drop index IDX_TOKEN on login_history;

alter table login_history
    comment '접속 정보';

create table menu
(
    MenuID        int auto_increment
        primary key,
    MenuName      varchar(50)      null comment '메뉴 이름',
    DataMenuID    varchar(50)      null comment '메뉴 ID',
    Level         int              null comment '메뉴 레벨',
    Priority      int              null comment 'MenuType에 따른 메뉴 우선순위',
    ParrentMenuID varchar(50)      null comment '하위메뉴가 가지는 상위메뉴ID',
    IsUse         char default 'Y' not null comment '메뉴 사용 여부',
    IsFix         char default 'N' not null comment '고정 메뉴 여부',
    ModifierCode  varchar(50)      null comment '수정자 ID',
    ModifyDate    datetime         null on update current_timestamp() comment '수정일시'
)
    row_format = DYNAMIC;

create table menu_history
(
    MenuHistoryID int auto_increment
        primary key,
    MenuName      varchar(50)                          not null,
    IsUse         char                                 not null,
    ModifierCode  varchar(100)                         not null,
    ModifyDate    datetime default current_timestamp() null on update current_timestamp()
);

alter table message
    modify MessageID bigint auto_increment comment '메시지 ID';

alter table message
    modify RoomID bigint not null comment '채팅방 ID';

alter table message
    modify Sender varchar(50) not null comment '발송인';

alter table message
    modify Context mediumtext not null comment '메시지 내용';

alter table message
    modify SendDate datetime default current_timestamp() not null comment '발송일시';

alter table message
    modify Receiver varchar(300) null comment '수신자 정보';

alter table message
    modify MessageType char default 'N' null comment '메시지 타입 (N : 일반메시지 S : 시스템 메시지 I : 공지사항 A : Alarm 및 공지)';

alter table message
    modify FileInfos mediumtext null comment '파일 정보(ex : {"ext":"pdf","fileName":"eumtalk 소개서_v2.0.pdf","thumbnail":false,"isImage":"N","size":3973227,"token":"20200406173034438_41g9ix4mvr4y6016550y5a"})';

alter table message
    modify LinkInfo mediumtext null comment '링크 정보 (메시지에 Link 가 포함되어 있을 경우, 첫번째 Link 에 대한 썸네일 정보 -  ex : {"isURL":true,"url":"http:// window.onload"})';

alter table message
    modify TagInfo mediumtext null comment '태그 정보( ex : ["#22"])';

create table message_access_history
(
    id         bigint(11) auto_increment
        primary key,
    UserID     varchar(50)                          not null,
    LoginID    varchar(50)                          not null,
    RoomID     bigint                               not null,
    RegistDate datetime default current_timestamp() null
);

create table message_bookmark
(
    BookmarkID   bigint auto_increment comment '책갈피 ID'
        primary key,
    RoomID       bigint                               not null comment '책갈피가 등록 된 방 번호',
    MessageID    bigint                               not null comment '책갈피로 등록 된 메시지 ID',
    RegisterCode varchar(100)                         not null comment '책갈피 등록인',
    CreateDate   datetime default current_timestamp() not null comment '등록일자'
)
    comment '메시지 책갈피';

create index IDX_MESSAGE_B_MessageID
    on message_bookmark (MessageID);

create index IDX_MESSAGE_B_RoomID
    on message_bookmark (RoomID);

alter table message_history
    modify MessageID bigint null comment '메시지 ID';

alter table message_history
    modify RoomID bigint not null comment '채팅방 ID';

alter table message_history
    modify Sender varchar(50) not null comment '발송인';

alter table message_history
    modify Context mediumtext not null comment '메시지 내용';

alter table message_history
    modify SendDate datetime default current_timestamp() not null comment '발송일시';

alter table message_history
    modify Receiver varchar(300) null comment '수신자 정보';

alter table message_history
    modify MessageType char default 'N' null comment '메시지 타입 (N : 일반메시지 S : 시스템 메시지 I : 공지사항 A : Alarm 및 공지)';

alter table message_history
    modify FileInfos mediumtext null comment '파일 정보(ex : {"ext":"pdf","fileName":"eumtalk 소개서_v2.0.pdf","thumbnail":false,"isImage":"N","size":3973227,"token":"20200406173034438_41g9ix4mvr4y6016550y5a"})';

alter table message_history
    modify LinkInfo mediumtext null comment '링크 정보 (메시지에 Link 가 포함되어 있을 경우, 첫번째 Link 에 대한 썸네일 정보 -  ex : {"isURL":true,"url":"http:// window.onload"})';

alter table message_history
    modify TagInfo mediumtext null comment '태그 정보( ex : ["#22"])';

alter table message_history
    modify MentionInfo mediumtext null comment '맨션 정보 (ex : [{targetCode=mjseo, targetType=UR}])';

alter table message_history
    modify Compare char null comment '통계를 위한  메세지 타입(L :  링크가 포함된 메시지, M : 메세지, F :  파일이 포함된 메세지) ';

alter table message_history
    modify NotiFlg char null comment '공지 여부';

alter table message_history
    modify DeleteUser varchar(50) null comment '삭제한 사용자';

alter table message_history
    modify DeleteDate datetime default current_timestamp() null comment '삭제한 날짜';

alter table message_history
    comment '메시지 히스토리';

alter table message_receive
    modify MessageID bigint not null comment '메시지 ID';

alter table message_receive
    modify RoomID bigint not null comment '채팅방 ID';

alter table message_receive
    modify UserID varchar(50) not null comment '사용자 ID';

alter table message_receive
    comment '수신정보';

alter table message_receive
    add ReadFlag char default 'N' null;

alter table message_receive
    add ReadDate datetime null;

alter table messenger_connect
    row_format = DYNAMIC;

alter table messenger_connect_gp
    drop key UNIQUE_MSGGP;

alter table monitor_compare
    modify TYPE varchar(20) null comment '타입';

alter table monitor_compare
    modify VALUE varchar(10) null comment '비교예비값';

alter table monitor_compare
    modify VALUE2 varchar(3) null comment '비교예비값2';

alter table monitor_compare
    comment '모니터링 병합';

alter table monitor_statistics
    modify id bigint auto_increment comment 'Id';

alter table monitor_statistics
    modify `group` varchar(20) not null comment '그룹';

alter table monitor_statistics
    modify year varchar(4) not null comment '년도';

alter table monitor_statistics
    modify month varchar(3) not null comment '월';

alter table monitor_statistics
    modify day varchar(3) not null comment '일';

alter table monitor_statistics
    modify names varchar(5) not null comment '제목';

alter table monitor_statistics
    modify `values` varchar(30) not null comment '결과값';

alter table monitor_statistics
    modify catedate datetime default current_timestamp() not null comment '생성일';

alter table monitor_statistics
    modify updatedate datetime default current_timestamp() not null on update current_timestamp() comment '수정일';

alter table monitor_statistics
    comment '모니터링 통계';

alter table multilingual_history
    add `Index` int auto_increment
        primary key;

create table note_message
(
    NoteID     bigint auto_increment
        primary key,
    Sender     varchar(50)                          not null,
    Subject    varchar(2000)                        not null,
    Emergency  char     default 'N'                 null,
    Context    mediumtext                           not null,
    SendDate   datetime default current_timestamp() not null,
    DeleteID   varchar(50)                          null,
    DeleteDate datetime                             null,
    Compare    char                                 null
)
    comment '쪽지' charset = utf8mb3;

create table note_message_archive
(
    NoteID     bigint                               not null,
    UserID     varchar(50)                          not null,
    CreateDate datetime default current_timestamp() not null,
    primary key (NoteID, UserID)
)
    comment '쪽지 보관함' charset = utf8mb3;

create table note_message_favorites
(
    NoteID     bigint auto_increment,
    UserID     varchar(50)                          not null,
    CreateDate datetime default current_timestamp() not null,
    primary key (NoteID, UserID)
)
    charset = utf8mb3;

create table note_message_receive
(
    ReceiveID           bigint auto_increment
        primary key,
    UserID              varchar(50)                          not null,
    NoteID              bigint                               not null,
    JobType             varchar(20)                          not null,
    JobPositionCode     varchar(50)                          null,
    JobTitleCode        varchar(50)                          null,
    JobLevelCode        varchar(50)                          null,
    ReceiveGroup        varchar(100)                         null,
    ReceiveGroupCompany varchar(50)                          null,
    ReceiveType         char                                 not null comment 'U : User, G : Group',
    ReadFlag            char     default 'N'                 not null,
    ReadDate            datetime                             null,
    CreateDate          datetime default current_timestamp() not null,
    UpdateDate          datetime default current_timestamp() not null on update current_timestamp(),
    DeleteID            varchar(50)                          null,
    DeleteDate          datetime                             null
)
    charset = utf8mb3;

create index NOTE_MESSAGE_RECEIVE_IDX
    on note_message_receive (NoteID, ReceiveType, UserID);

create index USERID_IDX
    on note_message_receive (UserID);

create table note_message_receive_group
(
    NoteID         bigint   default 0                   not null,
    ReceiveGroup   varchar(100)                         null,
    ReceiveCompany varchar(100)                         null,
    CreateDate     datetime default current_timestamp() not null,
    UpdateDate     datetime default current_timestamp() not null on update current_timestamp(),
    `Index`        bigint auto_increment
        primary key
)
    charset = utf8mb3;

create index RECEIVE_GROUP_IDX
    on note_message_receive_group (ReceiveGroup, ReceiveCompany);

create index RECEIVE_GROUP_IDX2
    on note_message_receive_group (NoteID);

alter table notice_subject
    modify SubjectID int auto_increment comment 'Key';

alter table notice_subject
    modify SubjectCode varchar(50) not null comment '시스템알림코드';

alter table notice_subject
    modify RoomID varchar(200) null comment '채팅방 ID';

alter table notice_subject
    modify SubjectName varchar(200) null comment '시스템알림명';

alter table notice_subject
    modify SubjectPhoto varchar(500) not null comment '시스템이미지';

alter table notice_subject
    modify RegisterCode varchar(50) null comment '등록자';

alter table notice_subject
    modify RegistDate datetime default current_timestamp() null comment '등록일';

alter table notice_subject
    modify ModifierCode varchar(50) null comment '수정자';

alter table notice_subject
    modify ModifyDate datetime null comment '수정일';

alter table notice_subject
    modify DeleteDate datetime null comment '삭제일';

alter table notice_subject
    modify CreateType char default 'C' null comment '시스템알림타입(C : 생성 / S : 시스템 알림 (삭제 불가))';

alter table notice_subject
    comment '시스템 알림';

alter table notice_target
    modify SubjectID int null comment 'Key';

alter table notice_target
    modify RoomID int null comment '채팅방ID';

alter table notice_target
    modify TargetID varchar(50) null comment 'TargetID';

alter table notice_target
    modify MessageID bigint null comment '메시지 ID';

alter table notice_target
    modify ReadYN char default 'N' null comment '읽음여부';

alter table notice_target
    comment '시스템 알림 타켓';

alter table qrtz_blob_triggers
    comment '쿼츠 BLOB 트리거';

alter table qrtz_calendars
    comment '쿼츠 캘린더';

create table qrtz_config
(
    TRIGGER_NAME    varchar(190) not null,
    CRON_EXPRESSION varchar(190) not null comment '쿼츠 실행 시간',
    IsUse           char         not null comment '쿼츠 내부 로직의 사용 여부',
    IsChange        char         null comment '실행시간이 바뀌었으면 Y, 바뀐 후 다시 N으로 UPDATE됨'
);

alter table qrtz_cron_triggers
    comment '쿼츠 크론 트리거';

alter table qrtz_job_details
    comment '쿼츠 잡 상세정보';

alter table qrtz_job_details
    row_format = DYNAMIC;

alter table qrtz_locks
    comment '쿼츠 락 테이블 정보';

alter table qrtz_log
    comment '쿼츠 로그';

alter table qrtz_paused_trigger_grps
    comment '쿼츠 PAUSED 트리거 그룹';

alter table qrtz_scheduler_state
    comment '쿼츠 스케줄 상태';

alter table qrtz_simple_triggers
    comment '쿼츠 심플 트리거';

alter table qrtz_simprop_triggers
    comment '쿼트 심플 ROP 트리거';

alter table qrtz_triggers
    comment '쿼츠 트리거';

create table redis
(
    `Key` varchar(50) not null comment '키'
        primary key,
    Value mediumtext  null comment '값'
)
    comment '레디스 데이터 메모이제이션';

alter table room
    modify RoomID bigint auto_increment comment '채팅방 ID';

alter table room
    modify RoomName varchar(50) not null comment '채팅방 명';

alter table room
    modify RoomType char default '' not null comment '채팅방 타입 (M: 1:1 대화방 G: 그룹대화방 C: 채널대화방 A: Alarm 및 공지)';

alter table room
    modify RegistDate datetime default current_timestamp() not null comment '생성일시';

alter table room
    modify UpdateID varchar(50) null comment '수정자';

alter table room
    modify UpdateDate datetime default current_timestamp() not null on update current_timestamp() comment '수정일시';

alter table room
    modify DeleteDate datetime null comment '삭제일시';

alter table room
    modify TargetCode varchar(50) null comment '채팅상대 (RoomType이 M일경우 TargetCode 함께 입력)';

alter table room
    comment '채팅방';

alter table room
    add PinTop char default 'N' null;

alter table room_member
    modify RoomID bigint default 0 not null comment '채팅방 ID';

alter table room_member
    modify UserID varchar(50) not null comment '사용자 ID';

alter table room_member
    modify RegistDate datetime default current_timestamp() not null comment '입장 일시';

alter table room_member
    modify ChannelAuth char default 'N' null comment '채널 관리자 등급';

alter table room_member
    modify UpdateDate datetime default current_timestamp() null on update current_timestamp() comment '변경 일시';

alter table room_member
    modify DeleteDate datetime null comment '퇴장 일시';

alter table room_member
    modify LastViewedAt datetime null comment '마지막으로 읽은 시간';

alter table room_member
    comment '채팅방 가입자';

alter table room_member
    add PinTop datetime default current_timestamp() null on update current_timestamp();

alter table room_name
    modify RoomID bigint default 0 not null comment '채팅방 ID';

alter table room_name
    modify UserID varchar(50) not null comment '사용자 아이디';

alter table room_name
    modify RoomName varchar(100) not null comment '채팅방 명';

alter table room_name
    modify RegistDate datetime default current_timestamp() not null comment '생성일시';

alter table room_name
    modify UpdateDate datetime default current_timestamp() not null on update current_timestamp() comment '변경일';

alter table room_name
    comment '채팅방 명';

alter table room_setting
    modify RoomID int not null;

create table share_doc
(
    DocID       bigint auto_increment
        primary key,
    RoomID      bigint                               not null,
    RoomType    char     default ''                  null,
    DocTitle    varchar(50)                          not null,
    Description varchar(100)                         not null,
    Category    varchar(50)                          null,
    OwnerCode   varchar(50)                          not null,
    RegistDate  datetime default current_timestamp() not null on update current_timestamp(),
    DocURL      varchar(1000)                        null
);

create table share_doc_member
(
    DocID      bigint   default 0                   not null,
    UserID     varchar(50)                          not null,
    RoomID     bigint                               not null,
    RegistDate datetime default current_timestamp() not null,
    primary key (DocID, UserID)
);

create index UserID
    on share_doc_member (UserID);

create table share_doc_setting
(
    DocID       bigint                                  not null,
    UserID      varchar(50) default ''                  not null,
    SettingJSON longtext                                null,
    RegistDate  timestamp   default current_timestamp() not null,
    UpdateDate  timestamp   default current_timestamp() not null on update current_timestamp(),
    primary key (DocID, UserID)
);

alter table storage
    modify StorageID int auto_increment comment '스토리지 ID';

alter table storage
    modify CompanyCode varchar(50) null comment '회사코드';

alter table storage
    modify ServerName varchar(100) not null comment '서버명';

alter table storage
    modify StorageURL varchar(150) not null comment '스토리지 URL';

alter table storage
    modify StoragePath varchar(255) not null comment '스토리지 경로';

alter table storage
    modify IsUSE char not null comment '사용여부';

alter table storage
    comment '스토리지';

create table sys_access_admin_page
(
    AdminID      int auto_increment
        primary key,
    IP           varchar(20)                          not null comment 'IP Pattern 등록',
    IsUse        char     default 'N'                 null comment '사용여부',
    Description  varchar(255)                         not null comment '설명',
    RegistDate   datetime default current_timestamp() not null comment '등록일시',
    RegisterCode varchar(50)                          not null comment '등록자 ID',
    ModifyDate   datetime                             null on update current_timestamp() comment '수정일시',
    ModifierCode varchar(50)                          null comment '수정자 ID',
    DeleteDate   datetime                             null comment '삭제일시'
)
    comment '관리자 페이지 접속제어
- 등록된게 한건이라도 있으면 사용됨';

alter table sys_access_device
    modify ModifyDate datetime default current_timestamp() not null on update current_timestamp() comment '등록, 수정일';

alter table sys_access_ip
    modify RegistDate datetime default current_timestamp() not null comment '등록일시';

alter table sys_access_mac
    modify UserID varchar(50) default '' not null;

alter table sys_access_mac
    modify RegistID varchar(50) not null;

alter table sys_access_mac
    modify UpdateID varchar(50) collate utf8mb4_unicode_ci null;

alter table sys_access_mac
    drop key `UNIQUE KEY`;

alter table sys_access_mac
    add constraint `UNIQUE`
        unique (MAC, UserID);

alter table sys_base_code
    modify Number int auto_increment comment '일련번호';

alter table sys_base_code
    modify JoinCode varchar(100) not null comment '코드';

alter table sys_base_code
    modify CodeGroup varchar(100) not null comment '코드그룹';

alter table sys_base_code
    modify BizSection varchar(50) not null comment '업무 구분';

alter table sys_base_code
    modify CodeName varchar(100) not null comment '코드명';

alter table sys_base_code
    modify CodeValue varchar(100) not null comment '코드값';

alter table sys_base_code
    modify SortKey varchar(50) default '0' null comment '순서';

alter table sys_base_code
    modify IsUse char null comment '사용여부';

alter table sys_base_code
    modify Description varchar(250) null comment '설명';

alter table sys_base_code
    modify CreateDate datetime default current_timestamp() null comment '등록일';

alter table sys_base_code
    modify CreateID varchar(50) default '' null comment '등록자';

alter table sys_base_code
    modify UpdateID varchar(50) default '' null comment '수정자';

alter table sys_base_code
    modify UpdateDate datetime default current_timestamp() null on update current_timestamp() comment '수정일';

alter table sys_base_code
    modify CreateType char default 'C' not null comment '생성위치 (D: Default, C: Custom)';

alter table sys_base_code
    modify Flag char default 'N' null comment '시스템 속성(F: FCM, N : Nomal)';

alter table sys_base_code
    comment '기초코드';

alter table sys_base_config
    modify Number int auto_increment comment '일련번호';

alter table sys_base_config
    modify CompanyCode varchar(50) not null comment '회사코드';

alter table sys_base_config
    modify BizSection varchar(50) not null comment '업무구분';

alter table sys_base_config
    modify CodeGroup varchar(100) not null comment '코드그룹';

alter table sys_base_config
    modify JoinCode varchar(100) not null comment '코드';

alter table sys_base_config
    modify IsUse char null comment '사용여부';

alter table sys_base_config
    modify Description varchar(250) null comment '설명';

alter table sys_base_config
    modify CreateID varchar(50) null comment '생성자';

alter table sys_base_config
    modify UpdateID varchar(50) null comment '수정자';

alter table sys_base_config
    modify CreateDate datetime default current_timestamp() null comment '생성일';

alter table sys_base_config
    modify UpdateDate datetime default current_timestamp() null on update current_timestamp() comment '수정일';

alter table sys_base_config
    modify CreateType char default 'C' not null comment '기본값 여부';

alter table sys_base_config
    comment '기초 설정';

alter table sys_config
    modify Number int auto_increment comment '일련번호';

alter table sys_config
    modify Code varchar(100) null comment '코드';

alter table sys_config
    modify SystemGroup char default 'C' null comment '시스템 그룹(C: Client/Common S: Server, E: ETC)';

alter table sys_config
    modify Comment varchar(500) null comment '코멘트';

alter table sys_config
    modify Value longtext null comment '값';

alter table sys_config
    modify CreateID varchar(50) null comment '생성자';

alter table sys_config
    modify UpdateID varchar(50) null comment '수정자';

alter table sys_config
    modify CreateDate datetime default current_timestamp() not null comment '생성일';

alter table sys_config
    modify UpdateDate datetime default current_timestamp() not null on update current_timestamp() comment '수정일';

alter table sys_config
    comment '시스템 설정';

alter table sys_lang
    modify DicID int auto_increment comment '다국어 ID';

alter table sys_lang
    modify DicCode varchar(100) not null comment '다국어 코드';

alter table sys_lang
    modify Ko varchar(500) null comment '한국어';

alter table sys_lang
    modify En varchar(500) null comment '영어';

alter table sys_lang
    modify Ja varchar(500) null comment '일본어';

alter table sys_lang
    modify Zh varchar(500) null comment '중국어';

alter table sys_lang
    modify Reserved1 varchar(500) null comment '예비필드1';

alter table sys_lang
    modify Reserved2 varchar(500) null comment '예비필드2';

alter table sys_lang
    modify Reserved3 varchar(500) null comment '예비필드3';

alter table sys_lang
    modify Reserved4 varchar(500) null comment '예비필드4';

alter table sys_lang
    modify Reserved5 varchar(500) null comment '예비필드5';

alter table sys_lang
    modify RegistDate datetime default current_timestamp() not null comment '생성일';

alter table sys_lang
    modify UpdateDate datetime null on update current_timestamp() comment '수정일';

alter table sys_lang
    comment '클라이언트 다국어';

create table sys_mime
(
    Number     int auto_increment comment '일련번호'
        primary key,
    Value      longtext                             null comment '값',
    CreateID   varchar(50)                          null comment '생성자',
    UpdateID   varchar(50)                          null comment '수정자',
    CreateDate datetime default current_timestamp() not null comment '생성일',
    UpdateDate datetime default current_timestamp() not null on update current_timestamp() comment '수정일'
)
    comment '시스템 설정' row_format = DYNAMIC;

alter table update_date_sync
    modify UserID varchar(50) not null comment '사용자 ID';

alter table update_date_sync
    comment '사용자 동기화';

create table usage_group
(
    GroupCode     varchar(100)                         not null,
    CompanyCode   varchar(50)                          not null,
    DeptName      varchar(200)                         null,
    JoinRoomCnt   bigint   default 0                   not null,
    MessageCnt    bigint   default 0                   not null,
    OrderFileSize bigint   default 0                   not null,
    CreateDate    datetime default current_timestamp() null,
    primary key (GroupCode, CompanyCode)
);

create table usage_personal
(
    UserID        varchar(50)                          not null
        primary key,
    LogonID       varchar(50)                          not null,
    DeptName      varchar(200)                         null,
    MessageCnt    bigint   default 0                   not null,
    JoinRoomCnt   bigint   default 0                   not null,
    OrderFileSize bigint   default 0                   not null,
    CreateDate    datetime default current_timestamp() null
);

create table usage_room
(
    RoomID          bigint                               not null
        primary key,
    RoomName        varchar(200)                         not null,
    RoomType        char     default ''                  not null,
    UserName        varchar(100)                         not null,
    DeptName        varchar(200)                         null,
    JobPositionName varchar(200)                         null,
    MessageCnt      bigint   default 0                   not null,
    JoinRoomCnt     bigint   default 0                   not null,
    OrderFileSize   bigint   default 0                   not null,
    RegistDate      datetime                             null,
    CreateDate      datetime default current_timestamp() null
);

alter table user
    modify UserID varchar(50) not null comment '사용자';

alter table user
    modify LogonID varchar(50) not null comment '로그인 아이디';

alter table user
    modify Password varchar(100) not null comment '비밀번호';

alter table user
    modify EmpNo varchar(50) not null comment '사번';

alter table user
    modify DisplayName varchar(100) not null comment '이름';

alter table user
    modify MultiDisplayName varchar(2000) not null comment '다국어 이름';

alter table user
    modify SortKey int not null comment '순번';

alter table user
    modify IsUse char not null comment '사용여부';

alter table user
    modify IsHR char not null comment '인사동기화여부';

alter table user
    modify IsDisplay char not null comment '표시여부';

alter table user
    modify IsMobile char not null comment '모바일 사용여부';

alter table user
    modify RegistDate datetime default current_timestamp() null comment '등록일시';

alter table user
    modify ModifyDate datetime default current_timestamp() null on update current_timestamp() comment '수정일시';

alter table user
    modify LoginFailCount int default 0 null comment '로그인실패횟수';

alter table user
    modify AccountLock char default 'N' null comment '잠금 여부';

alter table user_absence
    modify AbsenceID bigint auto_increment comment 'ID 값 Auto Increment';

alter table user_absence
    modify AbsenceCode varchar(30) not null comment '부재 코드 - 부재상태 표시용 ( 해당 부재상태는 SYS_LANG에 Prefix Ab_다국어 타입으로 입력 ex. Ab_UNKNOWN - 부재  형태로 기본값 필요 )';

alter table user_absence
    add State char null;

alter table user_absence
    add RegistDate datetime default current_timestamp() null;

alter table user_absence
    add UpdateDate datetime default current_timestamp() null on update current_timestamp();

create index USER_ABSENCE_IDX
    on user_absence (UserID);

create index USER_ABSENCE_IDX2
    on user_absence (AbsenceCode);

create index UserID_StartDate_EndDate
    on user_absence (UserID, StartDate, EndDate);

create table user_access_fail_log
(
    LogID          bigint(11) auto_increment
        primary key,
    UserID         varchar(50) collate utf8mb4_unicode_ci                      not null,
    IPAddress      varchar(60) collate utf8mb4_unicode_ci                      not null,
    LoginFailCount int                             default 0                   not null,
    AccountLock    char collate utf8mb4_unicode_ci default 'N'                 not null,
    RegistDate     datetime                        default current_timestamp() null,
    ModifyDate     datetime                        default current_timestamp() null on update current_timestamp()
)
    charset = utf8mb3;

create index USER_ACCESS_FAIL_LOG_IDX
    on user_access_fail_log (UserID);

create table user_access_unlock_log
(
    LogID      bigint(11) auto_increment
        primary key,
    UserID     varchar(50) collate utf8mb4_unicode_ci not null,
    IPAddress  varchar(60) collate utf8mb4_unicode_ci not null,
    RegistID   varchar(50)                            not null,
    RegistDate datetime default current_timestamp()   null,
    ModifyDate datetime default current_timestamp()   null on update current_timestamp()
)
    charset = utf8mb3;

create index USER_ACCESS_UNLOCK_LOG_IDX
    on user_access_unlock_log (UserID);

create table user_attendance_mng_schedule
(
    AttSeq     int auto_increment comment 'SEQ'
        primary key,
    UserID     varchar(50) collate utf8mb4_unicode_ci not null,
    StartDate  timestamp                              null comment '시작일시',
    EndDate    timestamp                              null comment '종료일시',
    RegistDate datetime default current_timestamp()   null,
    UpdateDate datetime default current_timestamp()   null on update current_timestamp()
)
    charset = utf8mb3;

create index USER_ATTENDANCE_MNG_SCHEDULE_IDX
    on user_attendance_mng_schedule (UserID);

alter table user_base_group
    modify Seq int auto_increment comment 'Key';

alter table user_base_group
    modify UserID varchar(50) not null comment '사용자 ID';

alter table user_base_group
    modify JobType varchar(20) not null comment '본직 구분';

alter table user_base_group
    modify SortKey int null comment '우선순위';

alter table user_base_group
    modify CompanyCode varchar(50) null comment '회사 코드';

alter table user_base_group
    modify DeptCode varchar(50) not null comment '부서 코드';

alter table user_base_group
    modify DeptName varchar(200) not null comment '부서명';

alter table user_base_group
    modify MultiDeptName varchar(2000) null comment '다국어 부서 명';

alter table user_base_group
    modify JobPositionCode varchar(50) null comment '직위 코드';

alter table user_base_group
    modify JobPositionName varchar(200) null comment '직위 명';

alter table user_base_group
    modify MultiJobPositionName varchar(2000) null comment '다국어 직위 명';

alter table user_base_group
    modify JobTitleCode varchar(50) null comment '직책 코드';

alter table user_base_group
    modify JobTitleName varchar(200) null comment '직책 명';

alter table user_base_group
    modify MultiJobTitleName varchar(2000) null comment '다국어 직책 명';

alter table user_base_group
    modify JobLevelCode varchar(50) null comment '직급 코드';

alter table user_base_group
    modify JobLevelName varchar(200) null comment '직급 명';

alter table user_base_group
    modify MultiJobLevelName varchar(2000) null comment '다국어 직급 명';

alter table user_base_group
    modify IsHR char null comment '인사 동기화 여부';

alter table user_base_group
    drop primary key;

alter table user_base_group
    drop key Seq;

alter table user_base_group
    comment '사용자기본그룹';

alter table user_base_group
    add primary key (UserID, DeptCode, JobType, DeptName);

alter table user_base_group
    add constraint FK_AutoSeq
        unique (Seq);

alter table user_contact
    modify OwnerID varchar(50) not null comment '소유자 ID';

alter table user_contact
    modify FolderID int not null comment '폴더 ID';

alter table user_contact
    modify ContactTarget varchar(50) not null comment '연락처 대상';

alter table user_contact
    drop primary key;

alter table user_contact_fd
    modify FolderID int auto_increment comment '폴더 ID';

alter table user_contact_fd
    modify OwnerID varchar(50) null comment '소유자 ID';

alter table user_contact_fd
    modify DisplayName varchar(200) not null comment '폴더 명';

alter table user_contact_fd
    modify FolderType char not null comment '폴더 타입(F : 즐겨찾기, C : 다른 연락처, G : 그룹)';

alter table user_contact_fd
    modify GroupCode varchar(50) null comment '그룹 코드';

alter table user_contact_fd
    modify SortKey varchar(10) null comment '순번';

alter table user_contact_fd
    modify RegistDate datetime default current_timestamp() not null comment '등록일시';

alter table user_contact_fd
    modify ModifyDate datetime default current_timestamp() not null on update current_timestamp() comment '수정일시';

alter table user_contact_fd
    comment '대화상대(연락처) 폴더';

alter table user_device
    modify DeviceID int auto_increment comment '디바이스 ID';

alter table user_device
    modify UserID varchar(50) not null comment '사용자 Id';

alter table user_device
    modify DeviceType varchar(15) null comment '기기 타입';

alter table user_device
    modify DeviceVersion varchar(20) null comment '기기 버전';

alter table user_device
    modify PushID varchar(250) null comment '푸시 ID';

alter table user_device
    modify DeviceInfo varchar(200) null comment '기기 정보';

alter table user_device
    modify UpdateDate datetime default current_timestamp() null on update current_timestamp() comment '업데이트 일시';

alter table user_device
    modify RegistDate datetime default current_timestamp() not null comment '등록일시';

alter table user_info
    modify UserID varchar(50) not null comment '사용자 ID';

alter table user_info
    modify PhotoPath varchar(1000) null comment '프로필 사진';

alter table user_info
    modify PhotoFullPath varchar(1000) null comment '프로필 사진 풀 경로';

alter table user_info
    modify PhotoChangeDate datetime default current_timestamp() null comment '프로필 변경 일시';

alter table user_info
    modify Address varchar(200) null comment '주소';

alter table user_info
    modify PhoneNumber varchar(50) null comment '전화번호';

alter table user_info
    modify CompanyNumber varchar(50) null comment '회사번호';

alter table user_info
    modify BirthDate varchar(10) null comment '생년월일';

alter table user_info
    modify MailAddress varchar(200) null comment '메일주소';

alter table user_info
    modify EnterDate varchar(10) null comment '입사일자';

alter table user_info
    modify ChargeBusiness varchar(500) null comment '담당업무 ( ExWorkInfo가 Null인 경우 화면에 표시 )';

alter table user_info
    modify UpdateDate datetime null comment '수정일';

alter table user_info
    modify CreateDate datetime default current_timestamp() null comment '생성일';

alter table user_info
    comment '사용자 정보';

alter table user_presence
    modify UserID varchar(50) not null comment '사용자 ID';

alter table user_presence
    modify State varchar(20) not null comment '사용자 상태';

alter table user_presence
    modify BeforeState varchar(20) null comment '이전상태 (로그아웃 하기 전 수동으로 변경한 프레젠스의 값)';

alter table user_presence
    modify StatusMessage varchar(2000) null comment '메시지';

alter table user_presence
    comment '프레젠스';

create table user_remember_me
(
    UserID     varchar(50) collate utf8mb4_unicode_ci not null
        primary key,
    IPAddress  varchar(60) collate utf8mb4_unicode_ci null,
    CreateDate datetime default current_timestamp()   not null,
    UpdateDate datetime default current_timestamp()   not null on update current_timestamp()
)
    charset = utf8mb3;

alter table user_setting
    modify UserID varchar(50) not null comment '사용자 ID';

alter table user_setting
    drop column JoinCode;

alter table user_setting
    drop column CodeGroup;

alter table user_setting
    drop column BizSection;

alter table user_setting
    comment '사용자 설정';

alter table user_setting
    add Desktop longtext null;

alter table user_setting
    add Mobile longtext null;

alter table user_setting
    add RegistDate timestamp default current_timestamp() not null;

alter table user_setting
    add UpdateDate timestamp default current_timestamp() not null on update current_timestamp();

alter table user_token
    modify Number int auto_increment comment '일련번호';

alter table user_token
    modify AccessToken varchar(50) not null comment '토큰 Key';

alter table user_token
    modify LoginID varchar(50) not null comment '사용자 로그인 ID';

alter table user_token
    modify UserID varchar(50) null comment '사용자 ID';

alter table user_token
    modify DeviceType char not null comment '기기타입';

alter table user_token
    modify TimeZone varchar(20) not null comment '타입존';

alter table user_token
    modify CreateDate datetime default current_timestamp() not null comment '생성일';

alter table user_token
    modify isExpire char null comment '만료여부';

alter table user_token
    modify AppVersion char(20) null comment '설치된 앱 버전';

alter table user_token
    comment '토큰';



-- Cyclic dependencies found

alter table user_device
    comment '사용자 모바일 장비';

alter table user_device
    modify NotiInfo longtext collate utf8mb4_bin null comment '모바일 알림 설정' check (json_valid(`NotiInfo`));

-- Cyclic dependencies found

alter table company
    modify CompanyName varchar(200) not null comment '회사명';

alter table company
    modify MultiCompanyName varchar(2000) not null comment '다국어회사명';

alter table company
    modify IsUse char not null comment '사용여부';

alter table company
    modify Description varchar(255) null comment '설명';

alter table company
    modify CompanyPath varchar(200) not null comment '코드 Path';

alter table company
    modify CreateID varchar(50) null comment '생성자';

alter table company
    modify CreateDate datetime default current_timestamp() null comment '생성일';

alter table company
    modify UpdateID varchar(50) null comment '수정자';

alter table company
    modify UpdateDate datetime default current_timestamp() null on update current_timestamp() comment '수정일';

alter table company
    comment '회사';

alter table company
    add MsgURL varchar(150) null comment '메신저 주소' after CompanyURL;

-- Cyclic dependencies found

alter table message
    modify MentionInfo mediumtext null comment '맨션 정보 (ex : [{targetCode=mjseo, targetType=UR}])';

alter table message
    modify Compare char null comment '통계를 위한  메세지 타입(L :  링크가 포함된 메시지, M : 메세지, F :  파일이 포함된 메세지) ';

alter table message
    modify NotiFlg char default 'N' null comment '공지여부';

alter table message
    comment '메시지';

alter table message
    add BotInfo mediumtext null after TagInfo;

alter table message
    add ReplyID bigint null comment '답장하기 원본 ID';

alter table message
    add ReplyInfo mediumtext null comment '답장하기 원본 메시지의 Data';

-- Cyclic dependencies found

alter table user
    modify TimeZone varchar(20) not null comment '타임존';

-- Cyclic dependencies found

alter table user
    modify Reserved1 varchar(50) null comment '외부사용자 여부';

alter table user
    modify Reserved2 varchar(50) null comment '예비필드2';

alter table user
    modify Reserved3 varchar(50) null comment '예비필드3';

alter table user
    modify Reserved4 varchar(50) null comment '예비필드4';

alter table user
    modify Reserved5 varchar(50) null comment '예비필드5';

alter table user
    comment '사용자';

alter table user
    add LoginFailDate datetime null after AccountLock;

alter table user
    add NoticeTalkAuth char default 'N' not null after AdminAuth;

alter table user
    add NotificationBlock char default 'N' not null after TimeZone;

alter table user
    add NotificationBlockDate datetime null after NotificationBlock;

alter table user
    add RetireDate datetime null comment '퇴직일자' after NotificationBlockDate;

-- Cyclic dependencies found

alter table user_contact
    modify ContactType char(2) not null comment '대상 타입 (U : 사용자, G : 그룹)';

alter table user_contact
    modify RegistDate datetime default current_timestamp() not null comment '등록일시';

alter table user_contact
    modify UpdateDate datetime default current_timestamp() not null on update current_timestamp() comment '업데이트 일시';

alter table user_contact
    comment '대화상대(연락처)';

alter table user_contact
    add CompanyCode varchar(50) default '' not null after ContactTarget;

alter table user_contact
    add GlobalFolder char default 'Y' null;

alter table user_contact
    add primary key (OwnerID, FolderID, ContactTarget, CompanyCode);

