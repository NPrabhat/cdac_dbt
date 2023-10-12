use dac_sept_23;


select distinct * from employee;
select * from department;
Delimiter //
create procedure getAllEmployee()
begin
	select empname from employee;
end //
Delimiter ;

call getAllEmployee();

Delimiter //
create procedure getAllEmployeeAndNos()
begin
	select empname from employee;
    select count(*) from employee;
end //
Delimiter ;

call getAllEMployee();
call getAllEmployeeAndNos();
#******************IN/OUT/INOUT************************************

drop procedure getAllEmployeeAndNos;

Delimiter //
create procedure getSingleEmployee(in id int)
begin
	select empName from employee where empid=id;
end //
Delimiter ;

call getSingleEmployee(4);

drop procedure getSingleEmployee;

#****************************************************************************************

Delimiter //
create procedure findMaxSalary(out highestSalary decimal(10,2))
begin
	select Max(empSalary) into highestSalary from employee;
end //
Delimiter ;

call findMaxSalary(@m);
select @m as highest;

#*******************************************************************************************

Delimiter //
create procedure findSalary(in id int,out Salary decimal(10,2))
begin
	select empsalary into Salary from employee where empid=id;
 
end//
Delimiter ;

call findSalary(3,@m);
select @m as highest;

#*********************************************

Delimiter //
create procedure updateSalary(inout sal decimal(10,2),in id int)
begin
		select empsalary into sal from employee where empid=id;
        
        set sal =sal*1.10;
        update employee set empsalary = sal where empid = id;
end //
Delimiter ;

set SQL_SAFE_UPDATES =0;

call updateSalary(@s,6);
SELECT @s as highet;

drop procedure updatesalary;
#************************************************************************


Delimiter //
create procedure findDid(in id int)
begin
	select did from employee where empid =id;
end//
Delimiter ;

call findDid(3);

drop procedure findDid;

#************************************************************************


Delimiter //
create procedure findAvgSal(out sal decimal(10,2))
begin
	select avg(empsalary) into sal from employee;
end //
Delimiter ;

call findAvgSal(@m);
select @m as avg;

drop procedure findAvgSal;

#*****************************************************************

