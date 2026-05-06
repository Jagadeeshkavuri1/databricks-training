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
