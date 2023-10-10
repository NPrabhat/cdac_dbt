#TCL (Transaction Control Language)

show databases;
use dac_sept_23;
select * from voter;

start transaction;

show tables;

select * from department;

insert into department values(105,"Finance");

update department set deptName="Marketing" where deptId = 105;
commit;
rollback;
#************************************************************************************
#DCL
select user from mysql.user; #it provides list of created users

select user(); 			#Current working user

show schemas;
