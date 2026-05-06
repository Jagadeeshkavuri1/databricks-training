-- Basic Queries
-- Q1) Select all columns from the Employee table
select * from Employee; 
-- Q2) Select only the name and salary columns from the Employee table
select name, salary from Employee; 
-- Q3)  Select employees who are older than 30
select * from Employee where age > 30; 
-- Q4) Select the names of all departments
select name from Department; 
-- Q5) Select employees who work in the IT department.
select * from Employee
where department_id = (
    select department_id 
    from Department 
    where name = 'IT'
);


-- String Matching
-- Q6) employees whose names start with 'J' 
select * from Employee where name like 'J%'; 
-- Q7) employees whose names end with 'e'
select * from Employee where name like '%e'; 
-- Q8) employees whose names contain 'a'
select * from Employee where name like '%a%';
-- Q9) employees whose names are exactly 9 characters long 
select * from Employee where name like '_________';
--Q10) employees whose names have 'o' as the second character
select * from Employee where name like '_o%';


-- Date Queries
