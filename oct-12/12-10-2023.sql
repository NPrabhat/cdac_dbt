use dac_sept_23;

#select if(10<20,"10 is smaller","20 is smaller");

select * from employee;

select empname,empsalary,if(empsalary>50000, "Higher salary", "Lower salary") as result from employee;


Delimiter //
create procedure salaryStatus(in id int)
begin 
	#this is where we declare variable; below two lines.
	declare salary decimal(15,2);
    declare status varchar(50);
    
    select empsalary into salary from employee where empid = id;
    
    if salary > 50000 then
    #below two lines for initializing
		set status = "Good salary";
	else set status = "Less salary";
    end if;
    
    select status as result;
end //
Delimiter ;

call salaryStatus(4);

#****************************************************************************************************************************************************************
delimiter //
create procedure salaryStatus1(in id int)
begin 
	declare salary decimal(15,2);
    declare status varchar(50);

	select empSalary into salary from employee where empid=id;
    
    set status =
    case 
    when salary > 70000 then "Excellent"
    when salary >60000 then "Very Good"
    when salary > 50000 then "Good"
    else "Keep Growing"
    end;
    
    select status as result;
    
end //
delimiter ;

call salaryStatus1(1);

#****************************************************************************************************************************************************************
delimiter //
create procedure salaryStatus2(in id int)
begin 
	declare salary decimal(15,2);
    declare status varchar(50);

	select empSalary into salary from employee where empid=id;
    
    if salary>50000 then 
		set status = "Good Salary";
	elseif salary>40000 and salary <50000 then
		set status = "Nice Salary";
    else 
		set status = "Less Salary";
	end if;
    
    select status as result;
    
end //
delimiter ;

call salaryStatus2(5);

#*******************************************************************************************************************************************

set sql_safe_updates =0;

delete from employee where empid =5;
select * from employee;

insert into employee(empid,empName,empsalary,did) values (5,"Rakesh",70000,103);

#*******************************************************************************************************************************************
#*******************************************************************************************************************************************
#*******************************************************************************************************************************************
#*******************************************************************************************************************************************


#While loop

delimiter //
create procedure While_Loop()
begin 
	declare num int default 1;
    declare result varchar(100) default '';
    
    while num <10 do
		set result = concat(result,num,',');
		set num = num+1;
    end while;
    
    select result as Result;
end //
delimiter ;

drop procedure while_loop;

call While_loop();


#*************************************************************************************************************************************
#Loop
delimiter //
create procedure LoopDemo()
begin 
	declare x int;
    declare str varchar(200) ;
    
    set x=1;
    set str = '';
     
	loop_label:loop
		if x>10 then 
			leave loop_label; #atleast 1 leave is required to break or end the loop otherwise the loop will iterate infinitely 
        end if;
        
        set x=x+1;
        if  (x mod 2) then 
			iterate loop_label;
		else 
			set str = concat(str,x,',');
		end if;
	end loop;
    
    select str as Result;
end //
delimiter ;

call LoopDemo();

drop procedure LoopDemo;

#****************************************************************************************************************************
#Repeat

delimiter //
create procedure TestRepeat()
begin 
	declare num int default 1;
    declare result varchar(100) default '';
    
    repeat 
		set result = concat(result,num,',');
        set num=num*5;
	until num>1000
    end repeat;
	select result;
end //
delimiter ;

call TestRepeat();

#***************************************************************************************************************************

