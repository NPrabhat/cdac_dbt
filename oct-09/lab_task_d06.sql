use dac_sept_23;
#ques 1
create table salespeople(
	salesman_id int,
    name varchar(20),
    city varchar(20),
    commission decimal(3,2)
);

insert into salespeople(salesman_id,name,city,commission) values
			(5001, "James Hoog", "California", 0.15),
            (5002,"Nail Knite" ,"Paris", 0.13),
            (5005, "Pit Alex","London", 0.11),
            (5006, "Mc Lyon", "Paris", 0.14),
            (5007, "Paul Adam ","Rome", 0.13),
            (5008, "Lauson San", "Jose" ,0.12)
;
	
create view california as
select salesman_id, name from  salespeople where city = "California";  

#ques 2
create table customers (
		cust_id int,
        cust_name varchar(20),
        city varchar(20),
        grade int,
        salesman_id int
);

insert into customers(cust_id,cust_name,city,grade,salesman_id) 
values (3002, "Nick Rimando", "California" ,100, 5001),
		(3007, "Brad Davis", "California" ,200 ,5001),
        (3005, "Graham Zusi", "New York", 200, 5002),
        (3008, "Julian Green", "London", 300, 5002),
        (3004, "Fabian Johnson", "Paris", 300 ,5006);


create view cust_count as
select count(cust_id), grade from customers group by grade;

select * from cust_count;