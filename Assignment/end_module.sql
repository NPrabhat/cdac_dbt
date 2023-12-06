#Question 1
create database library;

use library;

create table books(
	book_id int primary key,
    title varchar(50),
    author varchar(50),
    publication_year int,
    price decimal(10,2)
);

drop table books;

insert into books(book_id,title,author,publication_year, price)
values (101,"Harry Potter","Rowling",1997,899.99);

insert into books(book_id,title,author,publication_year, price)
values (102,"Art of war","Sun tzu",1956,459.99);

select title from books where book_id = 101;

update books 
set title = "Rich dad Poor dad", author = "Kiosaki", 
	publication_year = 1996, price = 799.99
where book_id = 101;

delete from books where book_id = 102;


#Question 2
create table employees (
	emp_id int primary key,
    emp_name varchar(50),
    emp_salary decimal(10,2),
    emp_department varchar(50),
    emp_join_date date
);

insert into employees (emp_id,emp_name,emp_salary,emp_department)
values (101,"Ramesh",35000,"accounts"),
	   (102,"Suresh",25000,"sales"),
       (103,"Rajesh",45000,"marketing"),
       (104,"Ramesh",50000,"research"),
       (105,"Ramesh",24000,"support");


delimiter //
create trigger insert_employee_trigger
before insert on employees 
for each row
begin
 set new.emp_join_date = CURDATE();
END //
delimiter ;

delimiter //
create trigger update_employee_trigger
before update on employees
for each row
begin
    if new.emp_salary <= old.emp_salary then
        set new.emp_join_date = CURDATE();
    end if;
end //
delimiter ;


drop table employees;


delete trigger delete_employee_trigger
before delete on employees
for each row
begin
delimiter //
create trigger delete_employee_trigger
before delete on employees 
for each row
begin
    insert into deleted_employees_log (emp_id, emp_name, emp_salary, emp_department, emp_join_date)
    values (old.emp_id, old.emp_name, old.emp_salary, old.emp_department, old.emp_join_date);
end;
//
delimiter ;