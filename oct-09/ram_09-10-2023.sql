select user();
use dac_sept_23;

select * from department;

insert into department values (106,"Pantry");

delete from department where deptId =106;

grant delete on department to Ram@localhost;

#revoke insert on department from Ram@localhost;
#grant delete on department to Ram@localhost;