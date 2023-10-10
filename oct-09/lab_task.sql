create table Products(
	id int,
	category varchar(20),
    product varchar(20),
    value1 int
);

insert into Products(id,category, product,value) values 
	(1,"Non-veg","Chicken",150),
	(2,"Non-veg","Mutton",200),
	(3,"Non-veg","Fish",220),
	(4,"Non-veg","Prawns",250),
	(5,"Veg",    "Gobi",100),
	(6,"Veg",	 "Parota",45),
	(7,"Veg",	 "Vegbiryani",150);
    
select * from products;

create table OrderDetails(
	ordernumber int,
    orderline int,
    part varchar(2)
);

insert into OrderDetails(ordernumber,orderline,part)
values (10001,1,"A"),
	   (10001,2,"B"),
	   (10001,3,"C"),
	   (10002,1,"A"),
	   (10002,2,"B"),
	   (10002,3,"C"),
	   (10003,1,"A");

alter table products add constraint primary key(id);

alter table orderdetails 
add constraint foreign key(orderline) references products(id);

select product, value from products order by value asc;

