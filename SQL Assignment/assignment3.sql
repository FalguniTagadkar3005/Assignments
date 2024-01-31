--select * from department
--select * from employee

--Assignment 3
SELECT e.emp_name,A.dept_name,A.MAX_SALARY FROM
Employee e
JOIN 
(SELECT d.dept_id,d.dept_name,MAX(e.salary) as MAX_SALARY
FROM Department d
JOIN Employee e ON d.dept_id=e.dept_id
Group By d.dept_id,d.dept_name) as A
ON e.dept_id = A.dept_id
Where e.salary=A.MAX_SALARY;


--SELECT d.dept_id, d.dept_name,MAX(e.salary) as MAX_SALARY
--FROM Department d
--JOIN Employee e ON d.dept_id=e.dept_id
--Group By d.dept_id,d.dept_name

 --write a SQL query to find Departments that have less than 3 people in it
 SELECT d.dept_id,d.dept_name,count(e.emp_id) as 'Count of Employees'
 FROM Department d
 JOIN Employee e ON d.dept_id = e.dept_id
 GROUP BY d.dept_id,d.dept_name
 HAVING count(e.emp_id)<3;

--write a SQL query to find All Department along with the number of people there
SELECT d.dept_id , d.dept_name , count(e.emp_id) as 'Count of Employees'
FROM Department d
JOIN Employee e ON d.dept_id = e.dept_id
GROUP BY d.dept_id,d.dept_name;



 --write a SQL query to find All Department along with the total salary there
 SELECT d.dept_id,d.dept_name,sum(e.salary) 
 FROM Department d
 JOIN Employee e ON d.dept_id = e.dept_id
 GROUP BY d.dept_id , d.dept_name;