use dac_sept_23;

#INDEXING
select * from employee where empsalary>40000;

create index salIndex on employee(empsalary);

drop index salIndex on employee;

#*****************************************************************************************
#TEMPORARY TABLE

#1. Without using existing table 
create temporary table table1(
	did int,
    tName varchar(20)
);
desc table1;
select * from table1;

#2. Temporary table with structure of existing table 
create temporary table table2 like department;
desc table2;
select * from table2;

#3. Temporary table with structure and data of existing table
create temporary table table3
select * from department;

select * from table3;
create temporary table table4 select deptName from department;
select * from table4;


desc employee;