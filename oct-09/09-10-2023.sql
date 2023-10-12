#TCL (Transaction Control Language)

show databases;
use dac_sept_23;
select * from voter;

start transaction;

show tables;

select * from employee;
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

grant delete on department to Ram@localhost;

revoke insert on department from Ram@localhost;

#***********************************************************************************************

select * from employee;
select * from department;


update department set deptname= "Developer" where deptid =102;

desc department;

select empname from employee where did = (select deptid from department where deptname = "Developer");

select deptid from department where deptname = "Developer";

update employee set empsalary = empsalary+5000 where
did = (select  deptid from department where deptname = "Developer");

create view viewname as
select max(empsalary) from employee where 
empsalary < (select max(empsalary) from employee where 
			empsalary< (select max(empsalary) from employee));
select * from viewname;

create view namedept as
select e.empname, d.deptname from employee e inner join department d on e.did=d.deptid;

select * from viewname;

select max(empsalary) from employee where 
		empsalary < (select max(empsalary) from employee where
												empsalary<(select max(empsalary) from employee));

select max(empsalary) from employee where 
		empsalary < (select max(empsalary) from employee);