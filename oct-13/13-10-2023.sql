select char(65);

select concat("Anup"," Pardhi") as Result;

select lower("Soft Polynomias") as result;

select upper("Soft Polynomias") as result;

select trim("   Gello    Hello    ");
select ltrim("   Gello    Hello    ");
select rtrim("   Gello    Hello    ");

select substring("String",3,2);

select instr("rwer","r");

select length("Hello there");

#Numeric Function
select mod(10,3);
select power(10,3);
select round(193.25,1);
select truncate(193.238,2);
select sqrt(81);

#Date Function
select curDate();
select now();
select month(curdate());
select day(curdate());
select year(curdate());
select second(curdate());

select month("2023-10-13 3:45:00");

select sysdate();

#***********************************************************************************************************************************************
#Strored Functions

use dac_sept_23;

Delimiter //
create function hello_Sir()
returns varchar(50)
deterministic
begin 
	Return "Hello sir";
end //
Delimiter ;
select hello_Sir();

#**************************************************

Delimiter //
create function addition( x int, y int)
returns int
deterministic
begin 
	return (x+y);
end //
Delimiter ;

select addition(10,2333333333);