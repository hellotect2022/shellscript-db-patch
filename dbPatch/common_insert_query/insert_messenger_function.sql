DROP FUNCTION IF EXISTS `getGroupFullPath`;
DELIMITER $$
CREATE FUNCTION `getGroupFullPath`(`v_strID` VARCHAR(100)
) RETURNS varchar(500) CHARSET utf8mb3 COLLATE utf8mb3_general_ci
BEGIN
	DECLARE v_strReturn VARCHAR(1000);
   DECLARE v_strParentID VARCHAR(100);
   DECLARE v_strTemp VARCHAR(100);
		
   set v_strParentID = '';
   set v_strReturn = '';
   SWL_Label:
   while v_strID <> v_strParentID DO
      SELECT DisplayName, MemberOf INTO v_strTemp,v_strParentID FROM `GROUP` WHERE GroupCode = v_strID  ORDER BY GroupCode DESC LIMIT 1;
      if v_strID = v_strParentID then
		
         set v_strReturn = CONCAT(v_strTemp,'@',v_strReturn);
         LEAVE SWL_Label;
      else
         set v_strID = v_strParentID;
         set v_strParentID = '';
      end if;
      if (v_strReturn = '') then
         set v_strReturn = v_strTemp;
      else
         set v_strReturn = CONCAT(v_strTemp,'@',v_strReturn);
      end if;
   END WHILE;
   return v_strReturn;
END$$
DELIMITER ;

DROP FUNCTION IF EXISTS `getGroupPath`;
DELIMITER $$
CREATE FUNCTION `getGroupPath`(`v_ObjectID` VARCHAR(50),
	`v_ObjectCode` VARCHAR(50),
	`v_ObjectType` VARCHAR(30),
	`v_ObjectCompany` VARCHAR(50)
) RETURNS varchar(1000) CHARSET utf8mb3 COLLATE utf8mb3_general_ci
BEGIN
	DECLARE	v_RetValue		VARCHAR(1000);	
	DECLARE	v_ParentID		INT;				
	DECLARE	v_ParentCode	VARCHAR(500);	
	DECLARE	v_SelfID			INT;				
	DECLARE	v_GroupCode		VARCHAR(50);	
	DECLARE	v_PadChar		VARCHAR(50);	
	DECLARE	v_SortKeyMax	VARCHAR(50);	
	DECLARE	v_ParentNum		INT;				

	IF ( v_ObjectType='GR') THEN
	
		
   	
		SELECT GroupPath INTO v_ParentCode FROM `GROUP` WHERE GroupCode = v_ObjectCode AND CompanyCode = v_ObjectCompany ;
	
		SET v_RetValue = CONCAT(v_ParentCode,CONCAT(v_ObjectID , ';'));

	ELSEIF (v_ObjectType='COMPARE') THEN
			SET v_ParentCode = ''; 		
			SET v_RetValue = CONCAT(v_ObjectCode , ';');
			
			SELECT MemberOf INTO v_ParentCode FROM `GROUP`  WHERE GroupCode = v_ObjectCode  AND CompanyCode = v_ObjectCompany;		
		
			IF (v_ParentCode IS NOT NULL AND v_ParentCode <> '' AND v_ParentCode <> v_ObjectCode) THEN
			SET  v_RetValue = CONCAT(v_ParentCode ,';' , v_RetValue);		
			END IF;	
			
			WHILE (v_ParentCode IS NOT NULL AND v_ParentCode <> '' AND v_ParentCode <> v_ObjectCode) DO
				SET v_ParentCode = (SELECT MemberOf FROM `GROUP`  WHERE GroupCode = v_ParentCode  AND CompanyCode = v_ObjectCompany);
				IF (v_ParentCode IS NOT NULL AND v_ParentCode <> '') THEN
					SET  v_RetValue = CONCAT(v_ParentCode , ';', v_RetValue);
				END IF;
			END WHILE;

	END IF;   
	RETURN v_RetValue;
END$$
DELIMITER ;

DROP FUNCTION IF EXISTS `getSortPath`;
DELIMITER $$
CREATE FUNCTION `getSortPath`(`v_ObjectID` INT,
	`v_ObjectCode` VARCHAR(50),
	`v_ObjectType` VARCHAR(30),
	`v_ObjectCompany` VARCHAR(50)
) RETURNS varchar(1000) CHARSET utf8mb3 COLLATE utf8mb3_general_ci
BEGIN

	DECLARE	v_RetValue		VARCHAR(1000);	
	DECLARE	v_ParentID		INT;				
	DECLARE	v_ParentCode	VARCHAR(50);	
	DECLARE	v_SelfID			INT;				
	DECLARE	v_SortKey		VARCHAR(50);	
	DECLARE  v_SortPath     VARCHAR(2000); 
	DECLARE	v_PadChar		VARCHAR(50);	
	DECLARE	v_SortKeyMax	VARCHAR(50);	
	DECLARE	v_ParentNum		INT;				

	IF ( v_ObjectType='UGR') THEN
	
		
		SET v_PadChar = '000000000000000';
   	
		SELECT MemberOf, SortKey INTO v_ParentCode, v_SortKey FROM `GROUP` WHERE GroupCode = v_ObjectCode AND CompanyCode = v_ObjectCompany;
	
		SET v_RetValue = CONCAT(LEFT(v_PadChar, 15 - LENGTH(v_ObjectID)) ,v_ObjectID , ';');
	
		WHILE (v_ParentCode IS NOT NULL AND v_ParentCode <> '' AND v_ParentCode <> v_ObjectCode) DO				
			SET v_SortKey = (SELECT IFNULL(SortKey,'') FROM `GROUP`  WHERE GroupCode = v_ParentCode AND CompanyCode = v_ObjectCompany);		
			SET v_ParentCode = (SELECT IFNULL(MemberOf,'') FROM `GROUP`  WHERE GroupCode = v_ParentCode AND CompanyCode = v_ObjectCompany);	
			SET v_RetValue = CONCAT(LEFT(v_PadChar, 15 - LENGTH(v_SortKey)) , v_SortKey , ';' , v_RetValue);					
		END WHILE;

	ELSEIF (v_ObjectType='CGR') THEN
		SET v_PadChar = '000000000000000';
	   SELECT SortPath INTO v_SortPath FROM `GROUP` WHERE GroupCode = v_ObjectCode AND CompanyCode = v_ObjectCompany;
		SET v_RetValue = CONCAT(IFNULL(v_SortPath,''), CONCAT(LEFT(v_PadChar, 15 - LENGTH(v_ObjectID)) ,v_ObjectID , ';'));

	ELSEIF (v_ObjectType='CCGR') THEN
		SET v_PadChar = '000000000000000';
	 
		SET v_RetValue = CONCAT(LEFT(v_PadChar, 15 - LENGTH(v_ObjectID)),v_ObjectID , ';');
		
	ELSEIF ( v_ObjectType='COMPARE') THEN
	
		
		SET v_PadChar = '000000000000000';
   	
		SELECT MemberOf, SortKey INTO v_ParentCode, v_SortKey FROM `GROUP` WHERE GroupCode = v_ObjectCode AND CompanyCode = v_ObjectCompany;

		SET v_RetValue = CONCAT(LEFT(v_PadChar, 15 - LENGTH(v_SortKey)) ,v_SortKey , ';');
		
		WHILE (v_ParentCode IS NOT NULL AND v_ParentCode <> '' AND v_ParentCode <> v_ObjectCode) DO				
			SET v_SortKey = (SELECT IFNULL(SortKey,'') FROM `GROUP`  WHERE GroupCode = v_ParentCode AND CompanyCode = v_ObjectCompany);		
			SET v_ParentCode = (SELECT IFNULL(MemberOf,'') FROM `GROUP`  WHERE GroupCode = v_ParentCode AND CompanyCode = v_ObjectCompany);	
			SET v_RetValue = CONCAT(LEFT(v_PadChar, 15 - LENGTH(v_SortKey)) , v_SortKey , ';' , v_RetValue);					
		END WHILE;	
		
ELSEIF ( v_ObjectType='GROUPSYNC') THEN
	
		
		SET v_PadChar = '000000000000000';
   	
		SELECT MemberOf, SortKey INTO v_ParentCode, v_SortKey FROM `GROUP` WHERE GroupCode = v_ObjectCode AND CompanyCode = v_ObjectCompany;

		SET v_RetValue = CONCAT(LEFT(v_PadChar, 15 - LENGTH(v_SortKey)) ,v_SortKey , ';');
		
		WHILE (v_ParentCode IS NOT NULL AND v_ParentCode <> '' AND v_ParentCode != 'ORGROOT') DO				
			SET v_SortKey = (SELECT IFNULL(SortKey,'') FROM `GROUP`  WHERE GroupCode = v_ParentCode AND CompanyCode = v_ObjectCompany);		
			SET v_ParentCode = (SELECT IFNULL(MemberOf,'') FROM `GROUP`  WHERE GroupCode = v_ParentCode AND CompanyCode = v_ObjectCompany);	
			SET v_RetValue = CONCAT(LEFT(v_PadChar, 15 - LENGTH(v_SortKey)) , v_SortKey , ';' , v_RetValue);							
		END WHILE;	
		
		
	END IF;   
	RETURN v_RetValue;
END$$
DELIMITER ;