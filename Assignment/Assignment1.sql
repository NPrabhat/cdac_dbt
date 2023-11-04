#Question 1
#(a)
use dac_sept_23;
create table Post_Office(
	po_id bigint primary key,
    po_name varchar(35) not null,
    po_address varchar(35) not null,
    po_city varchar(35) not null,
    po_state varchar(2),
    po_pincode int(5)    
);

drop table Post_Office;

truncate table Post_Office;

#(b)
insert into Post_Office(po_id,po_name,po_address,po_city,po_state,po_pincode) 
values   (101, 'Nagpur Central Post Office', '123 Main Street', 'Nagpur', 'MH', 75081),
    (102, 'Pune City Post Office', '456 Park Road', 'Pune', 'MH', 75080),
    (103, 'Nagpur Main Post Office', '789 MG Road', 'Nagpur', 'MH', 75082),
    (104, 'Indore GPO', '101 MG Road', 'Indore', 'MP', 75079),
    (105, 'Bhopal Head Post Office', '210 New Market', 'Bhopal', 'MP', 75078);
    
#(c)
select * from Post_Office;
select p1.po_id, p1.po_name, p2.po_address, p1.po_city, p1.po_state, p1.po_pincode 
from Post_Office p1 join Post_Office p2 on p1.po_id = p2.po_id
where p1.po_state = "MH" or p2.po_address = "Nagpur";


#(d)
select po_pincode, po_city from Post_Office where po_city = (select max(distinct po_city) from Post_Office);

#=============================================================================================================================================
#Question 2

delimiter //
create procedure Name(in fname varchar(20),out lname varchar(20))
begin
	declare last_name varchar(20);
    set last_name = "Nagdeve";
	select last_name into lname;
end //
delimiter ;

drop procedure Name;

call Name('Prabhat',@m);
select @m;

#=============================================================================================================================================
#Question 3
create table customer3(
	customer_id int,
    account_number int,
    customer_name varchar(20),
    sales_order int
);

insert into customer3(customer_id,account_number,customer_name,sales_order) 
values (101,20001,"Ramesh",1001);
insert into customer3(customer_id,account_number,customer_name) 
values (102,20002,"Suresh");
insert into customer3(customer_id,account_number,customer_name,sales_order) 
values (103,20003,"Ganesh",1003);
insert into customer3(customer_id,account_number,customer_name) 
values (104,20004,"Sailesh");

select account_number, customer_id,sales_order from customer3 where sales_order is null ;

#=============================================================================================================================================
#Question 4
create table orders2(
	orderId int primary key,
    customerId int
);
insert  into orders2(orderId, customerId) values
    (1, 1),
    (2, 1),
    (3, 2),
    (4, 2),
    (5, 2),
    (6, 3),
    (7, 3),
    (8, 3),
    (9, 4),
    (10, 4),
    (11, 5),
    (12, 5),
    (13, 6),
    (14, 6),
    (15, 6);
select customerId, count(orderId) as orderCount
from orders2
group by customerId
order by orderCount desc
limit 10;

#=============================================================================================================================================
#Question 5

delimiter //
create procedure AddTwoNos()
begin
	declare a int default 10;
    declare b int default 20;
    declare c int default 0;
    
    set c = a+b;
    select c as result;    
end //
delimiter ;

call AddTwoNos();

#=============================================================================================================================================
#Question 6


delimiter //
create procedure getpostofficeinfo(in cityname varchar(35), in statecode varchar(2), out postofficecount int, inout citystatedetails varchar(255) )
begin
    declare cityinfo varchar(255);

    select count(*) into postofficecount
    from post_office
    where po_city = cityname and po_state = statecode;

    set cityinfo = concat('city: ', cityname, ', state: ', statecode);

    set citystatedetails = cityinfo;
end//
delimiter ;

#=============================================================================================================================================
#Question 7

delimiter //
create procedure checkMarks(in marks int)
begin
	if marks>=90 and marks<100 then
		select "A";
	elseif marks>=80 then
		select "B";
	elseif marks>=70 then
		select "C";
	elseif marks>=60 then 
		select "D";
	else 
		select "Fail";
    end if;
end //
delimiter ;

call checkMarks(90);

#=============================================================================================================================================
#Question 8

delimiter //
create procedure printNumber()
begin
	declare x int default 1;
    declare result varchar(200) default '';
	while x<=20 do
		set result = concat(result,x,',');
        set x=x+1;
    end while;
    select result;
end //
delimiter ;
call printNumber();

#=============================================================================================================================================
#Question 9

Delimiter //
create procedure Factorial1(in x int)
begin
	declare fact int default 1;
    
    while x>0 do
		set fact = fact*x;
        set x = x-1;
    end while;
    select fact;
end //
Delimiter ;
call Factorial1(5);

#=============================================================================================================================================
#Question 10

Delimiter //
create procedure GenerateFibonacciSequence(in x int)
begin 
	declare i int default 0;
    declare startin int default 0;
    declare fibo int default 1;
    declare sum int default 0;
    declare result varchar(1000) default '';
		repeat 
			if i<1 then
				set sum=i;
				set result = concat(result,sum,',');
				set i=i+1;
            else
				set sum = startin + fibo;
                set startin = fibo;
                set fibo = sum;
                set result = concat(result,sum,',');
                set i=i+1;
			end if;
		until x<i
        end repeat;	
        select result;
end //
Delimiter ;

call GenerateFibonacciSequence(10);
