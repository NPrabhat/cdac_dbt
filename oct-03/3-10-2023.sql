# For creation of database
create database dac23;

# For selecting the database
use dac23;

#for checking available databases
show databases;

#create a table 
Create table Employee(
empId int,
empName varchar(25)
);

#Check for table availability
show tables;

#Check schema of table structure
desc employee;

#Add new column to existing table 
alter table employee
add  column dept  varchar(50);

#Add new column to existing table at particular position
alter table employee
add column salary decimal(10,2) after empName;

#Modifying existing column in the table 
alter table employee 
   modify column empName varchar(50) not null;

#Change name of the column 
alter table employee
     change column salary empSalary decimal(10,2);

#Change table name
alter table employee 
 rename dacEmployee;
 
 desc dacemployee;
 
 #delete particular column 
 alter table dacemployee
 drop column dept;
 
 #delete complete table structure 
 drop table dacemployee;
 
 
 #Delete database 
 drop database dac23;