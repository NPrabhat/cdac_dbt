#########################Cursor##################################

use dac_sept_23;

select * from employee;

delimiter //
create procedure Cursor_Demo1()
begin 
declare name varchar(50);
declare salary decimal(15,2);

declare cursor1 cursor for select empName, empSalary from employee;
open cursor1;
fetch cursor1 into name,salary;
close cursor1;

select name,salary ;
end//
delimiter ;

call Cursor_Demo1();

drop procedure Cursor_Demo1;

##************************************************************************

delimiter //
create procedure Cursor_Demo2()
begin 
declare counter int default 1;
declare finished int default 0;
declare name varchar(50);
declare salary decimal(15,2);

declare cursor2 cursor for select empName, empSalary from employee;
declare continue handler for not found set finished=1;
open cursor2;
loop1:loop
	if finished or counter>2 then 
	leave loop1;
    end if;
fetch cursor2 into name,salary;
select name,salary ;
set counter = counter +1;
end loop;
close cursor2;
end//
delimiter ;

call Cursor_Demo2();
drop procedure Cursor_Demo2;