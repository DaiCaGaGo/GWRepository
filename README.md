# GWDatabase
Lưu trữ document, scripts, note, backup dự án Gateway

## Document
 - Kill session:  
 SELECT 'ALTER SYSTEM KILL SESSION '''||sid||','||serial#||''' IMMEDIATE;'  
 FROM v$session where username='SMSGATEWAY';
 - Backup database:  
 exp SMSGATEWAY/SMSGATEWAY@ORCL file=bk_gw.dmp owner=SMSGATEWAY
 - Import:  
 Cách 1: imp spa/spa123@ORCL full=y file=spabk.dmp <br />
 Cách 2: impdp NEW_BOC/NEW_BOC@ORCL_204 dumpfile=bk.dmp full=Y 	(D:\app\admin\admin\orcl\dpdump)
 - Create database:  
 ALTER SESSION SET "_ORACLE_SCRIPT"=true;  
 CREATE USER spa IDENTIFIED BY spa123;  
 GRANT DBA TO spa;  					
 - Drop user:   
 ALTER SESSION SET "_ORACLE_SCRIPT"=true;   
 DROP USER onedu_test cascade;  
 - Create Index: 
 CREATE INDEX "MNP_MOBILE" ON "MNP" ("MOBILE") ONLINE;
 - Check Enviroment:  
 SELECT * FROM V$NLS_PARAMETERS 

## Unlimit Password
  - Check profile: SELECT profile FROM DBA_USERS WHERE username = 'SMSGATEWAY';
  - Set unlimit password: ALTER profile DEFAULT LIMIT password_life_time UNLIMITED;
  - Check limit password: SELECT resource_name, limit FROM dba_profiles WHERE profile='DEFAULT';

## Lock & Unlock User
 - Lock: ALTER USER SMSGATEWAY ACCOUNT LOCK;
 - Unlock: ALTER USER SMSGATEWAY ACCOUNT UNLOCK;
 
## Install log4plsql
	1. Login user SYS
	2. Run script: sql\install_sys\create_user.sql
	3. Run script: sql\install_sys\grant_before_installation.sql
	4. Login user LOG (tạo từ bước 2)
	5. Run script: sql\install_log_user\install.sql
	6. Login user SYS
	7. Run script: sql\install_sys\grant_after_installation.sql
	8. Test fail >> run scripts:
		GRANT EXECUTE ON PLOG TO PUBLIC;
		DROP PUBLIC SYNONYM PLOG;
		CREATE  PUBLIC SYNONYM PLOG FOR PLOG;

		GRANT select on tlog to public;
		DROP PUBLIC SYNONYM tlog;
		CREATE  PUBLIC SYNONYM tlog FOR tlog;

		GRANT select on vlog to public;
		DROP PUBLIC SYNONYM vlog;
		CREATE  PUBLIC SYNONYM vlog FOR vlog;

		GRANT EXECUTE ON PLOGPARAM TO PUBLIC;
		DROP PUBLIC SYNONYM PLOGPARAM;
		CREATE  PUBLIC SYNONYM PLOGPARAM FOR PLOGPARAM;
