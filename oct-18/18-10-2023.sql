use dac_sept_23;
delimiter //
create procedure 'insertRecord'(in id int, in name varchar(50))
Begin 
	declare exit handler for 1062
    begin 
		select 'Please avoid duplicate entry in primary key' as message;
	end;
    
    insert into userinfo (userId,userName) values (id,name);
    
    select * from userinfo;
END
delimiter ;

call insertRecord(1,"Harish");

set sql_safe_updates = 0; 