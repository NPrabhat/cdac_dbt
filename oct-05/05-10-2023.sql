create database dac_sept_23;
use dac_sept_23;

create table voter(
	voterId int,
    voterName varchar(50) not null,
    age int check(age>=18),
    aadhar varchar(12) unique,
    income decimal(10,2) default 0.00,
    primary key(voterId)
);

drop table voter;
desc voter;

insert into voter(voterId,voterName,age,aadhar,income) 
values(101,"Ramesh Singh",21,"123456879010",25000);


insert into voter(voterId,voterName,age,aadhar,income) 
values(102,"Ramesh Singh",21,"123456879077",25000);


insert into voter(voterId,voterName,age,aadhar) 
values(103,"Suraj Singh",21,"123456879023");

insert into voter(voterId,voterName,age,aadhar,income) 
values(101,null,21,"123456879010",25000);

insert into voter(voterId,voterName,age) 
values(104,"Rahul Moite",21);

insert into voter(voterId,voterName,age,aadhar,income) 
values(105,"Yash Yadav",24,"123425879010",26000);

select * from voter;

#Aggregate Functions 
select max(income) as "Highest Salary" from voter;
select min(income) as "Lowest Salary" from voter;
select sum(income) as "Summation Salary" from voter;
select avg(income) as "Average Salary" from voter;
select count(income) as "Count Salary" from voter;


#clauses
select voterName as Name ,age as Age from voter;
select voterName as Name ,age as Age, income as Income from voter where income=25000;
select voterName as Name ,age as Age, income as Income from voter where income in(25000,23000);
select voterName as Name ,age as Age, income as Income from voter where income between 25000 and 30000;
select voterName as Name ,age as Age, income as Income from voter where age>22 and income between 25000 and 30000;
select voterName as Name ,age as Age, income as Income from voter where age>22 and income between 25000 and 30000 order by age;
select * from voter where voterName like "Ram%";
select * from voter where voterName like "%ngh";
select * from voter where voterName like "%esh%";
select voterName, income from voter order by income;
select voterName, income from voter order by income desc;

select age,sum(income) from voter group by(age);
select age,sum(income) from voter group by(age) having age>21;

select * from voter where aadhar is not null;

select distinct(voterName) from voter;
select distinct(age) from voter;