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


-- Order By Queries

-- Q31) all employees ordered by salary in ascending order
select * from Employee order by salary asc;
-- Q32) all employees ordered by age in descending order
select * from Employee order by age desc;
-- Q33) all employees ordered by hire date in ascending order
select * from Employee order by hire_date asc;
-- Q34) employees ordered by department and then by salary
select * from Employee order by department_id asc, salary asc;
-- Q35) departments ordered by total salary of their employees
select department_id, sum(salary) as total_salary from Employee group by department_id order by total_salary desc;


-- Join Queries
-- Q36) employee names along with their department names
select e.name as employee_name, d.name as department_name from Employee e join Department d on e.department_id = d.department_id;
-- Q37) project names along with the department names they belong to
select p.name as project_name, d.name as department_name from Project p join Department d on p.department_id = d.department_id;
-- Q38) employee names and their corresponding project names
select e.name as employee_name, p.name as project_name from Employee e join Project p on e.department_id = p.department_id;
-- Q39) all employees and their departments, including those without a department
select e.name as employee_name, d.name as department_name from Employee e left join Department d on e.department_id = d.department_id;
-- Q40) all departments and their employees, including departments without employees
select d.name as department_name, e.name as employee_name from Department d left join Employee e on d.department_id = e.department_id;
-- Q41) employees who are not assigned to any project
select e.name from Employee e left join Project p on e.department_id = p.department_id where p.project_id is null;
-- Q42) employees and the number of projects their department is working on
select e.name, count(p.project_id) as project_count from Employee e left join Project p on e.department_id = p.department_id group by e.emp_id, e.name;
-- Q43) departments that have no employees
select d.name from Department d left join Employee e on d.department_id = e.department_id where e.emp_id is null;
-- Q44) employee names who share the same department with 'John Doe'
select name from Employee where department_id = (select department_id from Employee where name = 'John Doe') and name <> 'John Doe';
-- Q45) department name with the highest average salary
select d.name, avg(e.salary) as average_salary from Employee e join Department d on e.department_id = d.department_id group by d.department_id, d.name order by average_salary desc limit 1;


-- Nested and Correlated Queries

-- Q46) employee with the highest salary
select * from Employee where salary = (select max(salary) from Employee);
-- Q47) employees whose salary is above the average salary
select * from Employee where salary > (select avg(salary) from Employee);
-- Q48) second highest salary from employee table
select max(salary) as second_highest_salary from Employee where salary < (select max(salary) from Employee);
-- Q49) department with the most employees
select department_id, count(*) as employee_count from Employee group by department_id order by employee_count desc limit 1;
-- Q50) employees who earn more than the average salary of their department
select * from Employee e where salary > (select avg(salary) from Employee where department_id = e.department_id);


















