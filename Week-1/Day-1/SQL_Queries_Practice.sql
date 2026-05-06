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
where department_id = (select department_id from Department where name = 'IT');


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
-- Q11) employees hired in the year 2020
select * from Employee where year(hire_date) = 2020;
-- Q12) employees hired in January of any year
select * from Employee where month(hire_date) = 1;
-- Q13) employees hired before 2019
select * from Employee where hire_date < '2019-01-01';
-- Q14) employees hired on or after March 1, 2021
select * from Employee where hire_date >= '2021-03-01';
-- Q15) employees hired in the last 2 years
select * from Employee where hire_date >= date_sub(curdate(), interval 2 year);


-- Aggregate Queries

-- Q16) total salary of all employees
select sum(salary) as total_salary from Employee;
-- Q17) average salary of employees
select avg(salary) as average_salary from Employee;
-- Q18) minimum salary in employee table
select min(salary) as minimum_salary from Employee;
-- Q19) number of employees in each department
select department_id, count(*) as employee_count from Employee group by department_id;
-- Q20) average salary of employees in each department
select department_id, avg(salary) as average_salary from Employee group by department_id;


-- Group By Queries

-- Q21) total salary for each department
select department_id, sum(salary) as total_salary from Employee group by department_id;
-- Q22) average age of employees in each department
select department_id, avg(age) as average_age from Employee group by department_id;
-- Q23) number of employees hired in each year
select year(hire_date) as hire_year, count(*) as employee_count from Employee group by year(hire_date);
-- Q24) highest salary in each department
select department_id, max(salary) as highest_salary from Employee group by department_id;
-- Q25) department with the highest average salary
select department_id, avg(salary) as average_salary from Employee group by department_id order by average_salary desc limit 1;


-- Having Queries

-- Q26) departments with more than 2 employees
select department_id, count(*) as employee_count from Employee group by department_id having count(*) > 2;
-- Q27) departments with an average salary greater than 55000
select department_id, avg(salary) as average_salary from Employee group by department_id having avg(salary) > 55000;
-- Q28) years with more than 1 employee hired
select year(hire_date) as hire_year, count(*) as employee_count from Employee group by year(hire_date) having count(*) > 1;
-- Q29) departments with a total salary expense less than 100000
select department_id, sum(salary) as total_salary from Employee group by department_id having sum(salary) < 100000;
-- Q30) departments with the maximum salary above 75000
select department_id, max(salary) as highest_salary from Employee group by department_id having max(salary) > 75000;
























