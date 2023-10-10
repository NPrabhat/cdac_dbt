use dac_sept_23;

create table Department(
	deptId int primary key,
    deptName varchar(50) not null
);

desc department;
desc employee;

#copy structure of existing table to new table
create table Deprt like department;

desc deprt;

insert into Department(deptId,deptName) values (101,"Account"),
	(102,"Devloper"),
    (103,"Admin");
    
select * from department;
    
    
create table Employee(
	empId int,
    empName varchar(50) not null,
    empSalary decimal(15,2),
    did int,
    foreign key(did) references department(deptId)
);    

insert into employee(empId,empName,empSalary,did) 
values (3,"Kailash",55789,101),(4,"Bhavesh",5789,102);

insert into employee(empId,empName,empSalary,did) 
values (5,"Dinesh",55789,101),(6,"Ganesh",35000,103);

select employee.did, employee.empName, department.deptName from employee, department where employee.did = department.deptId;
       