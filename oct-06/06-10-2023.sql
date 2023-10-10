use dac_sept_23;

create table customer(
	customerid int,
    first_name varchar(20),
    last_name varchar(20)
);

insert into customer(customerid,first_name,last_name)
values  (101,"Ramesh","Solanki"),
	    (102,"Suresh","Sharma"),
		(103,"Bhavesh","Roy"),
        (104,"Kailash","Gupta"),
        (105,"Mahesh","Sharma");


create table orders1(
	orderid int,
    customerid int,
    prodname varchar(20)
); 

insert into orders1(orderid,customerid,prodname)
values  (1,103,"Laptop"),
	    (2,104,"Mobile"),
		(3,103,"Camera"),
        (4,106,"Bike"),
        (5,108,"Chair");

select customer.first_name, orders1.prodname from 
customer inner join orders1 
on customer.customerid=orders1.customerid;

#when we apply this join on two tables then common tuple is produced as relation.

select customer.first_name, orders1.prodname from 
customer left join orders1 
on customer.customerid=orders1.customerid;

select customer.first_name, orders1.prodname from 
customer right join orders1 
on customer.customerid=orders1.customerid;

select first_name from customer  
union
select prodname from orders1;