use dac_sept_23;

select * from employee;

#Ques1
select empname from employee where empname like "S%";

#Ques2
CREATE TABLE employees (
    empid INT PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50),
    salary DECIMAL(10, 2)
);


INSERT INTO employees (empid, fname, lname, salary)
VALUES
    (1, 'John', 'Doe', 50000.00),
    (2, 'Jane', 'Smith', 60000.00),
    (3, 'Bob', 'Johnson', 55000.00),
    (4, 'Alice', 'Williams', 62000.00),
    (5, 'Charlie', 'Brown', 53000.00);
    
alter table employees add column dept varchar(20);
update employees set dept = "Marketing" where empid=1;
update employees set dept = "Marketing" where empid=2;
update employees set dept = "IT" where empid=3;
update employees set dept = "Accounts" where empid=4;
update employees set dept = "Finance" where empid=5;


select concat(fname," ",lname) as FullName from employees;
select fname||' '||lname as fullname from employees; #works only on oracle   
select * from employees;
    
#Ques3   
select concat(fname," ",lname) as FullName, salary from employees where salary between 60000 and 100000;


#Ques 4
select * from employees order by lname desc,dept;