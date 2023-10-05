create table orders(
	ord_no int,
    purch_amt decimal(10,2),
    ord_date date,
    customer_id int,
    salesman_id int
);

use dac_sept_23;


insert into orders(ord_no,purch_amt,ord_date,customer_id,
salesman_id)
values (70001,150.5,'2012-10-05',3005,5002);

insert into orders(ord_no,purch_amt,ord_date,customer_id,
salesman_id)
values (70009,270.65,'2012-09-10',3001,5005);

insert into orders(ord_no,purch_amt,ord_date,customer_id,
salesman_id)
values (70002,65.26,'2012-10-05',3002,5001);

insert into orders(ord_no,purch_amt,ord_date,customer_id,
salesman_id)
values (70005,2400.6,'2012-07-27',3007,5001);

insert into orders(ord_no,purch_amt,ord_date,customer_id,
salesman_id)
values (70008,5760,'2012-09-10',3002,5001);
		
        
#Question 1
select avg(purch_amt) from orders;

#Question 2
select count(distinct(salesman_id)) as salespeople from orders;


#Question 3
select avg(purch_amt) from orders;


#Question 4
select sum(purch_amt) from orders;

#Question 5
alter table orders add column (Salesman varchar(20), cust_name varchar(20), city varchar(20));

SET SQL_SAFE_UPDATES = 0;

update orders set Salesman = "Andrew"
where salesman_id = 5001;

update orders set Salesman = "Scott"
where salesman_id = 5005;

update orders set Salesman = "David"
where salesman_id = 5002;

update orders set cust_name = "Saurabh"
where customer_id = 3001;

update orders set cust_name = "Ritik"
where customer_id = 3002;

update orders set cust_name = "Yash"
where customer_id = 3007;

update orders set cust_name = "Akash"
where customer_id = 3005;

update orders set city = "Delhi"
where 

select * from orders;

