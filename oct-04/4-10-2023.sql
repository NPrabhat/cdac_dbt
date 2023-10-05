show tables;

desc employee;

select * from employee;

insert into employee (empid,empname)
values(1,"Ramesh");

insert into employee (empid,empname)
values(2,"Suresh");

update employee
set empname = "Shashank"
where empid = 2;

SET SQL_SAFE_UPDATES =0;

delete from employee where empid =2;

alter table employee 
add column empCity varchar(25);


update employee 
set empcity = "Nagpur"
where empid=2;

update employee 
set empcity = "Nagpur"
where empid=1;

select * from employee;


delete from employee where empid = 1 and name = "Ramesh";

truncate table employee;