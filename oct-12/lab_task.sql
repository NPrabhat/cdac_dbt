#Ques1  Odd Even
Delimiter //
create procedure checkOddEven(in x int, out str varchar(20))
begin 
	if (x mod 2) then # iski condition 0 hone pe false ho jaegi
		set str = "Odd";
        select str into str;
	else 
		set str = "Even";
        select str into str;
	end if;
end //
Delimiter ;

call checkOddEven(4,@m);
select @m as result;

drop procedure checkOddEven;

#****************************************************************************************************************************************
#Question2  Factorial 

Delimiter //
create procedure Factorial(in x int,out y int)
begin
	declare fact int default 1;
    
    while x>0 do
		set fact = fact*x;
        set x = x-1;
    end while;
    select fact into y;
end //
Delimiter ;


call Factorial(5,@m);
select @m as result;

drop procedure Facotrial;

#****************************************************************************************************************************************
#Fibonacci

Delimiter //
create procedure Fibonacci(in x int)
begin 
	declare i int default 0;
    declare startin int default 0;
    declare fibo int default 1;
    declare sum int default 0;
    declare result varchar(1000) default '';
    
--     while i<x do
--      if x <1 then
-- 		set sum = i;
--         select sum;
--         set i=i+1;
-- 	else
-- 		set sum = startin + fibo;
--         select sum;
--         set i=i+1;
--      end if;
--     end while;

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



call Fibonacci(10);

drop procedure Fibonacci;