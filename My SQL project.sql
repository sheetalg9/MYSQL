create database Project; # creating database
use project;

Create table worker(
WORKER_ID INT PRIMARY KEY,
FIRST_NAME VARCHAR(100),
LAST_NAME VARCHAR(100),
SALARY BIGINT,
JOINING_DATE DATETIME,
DEPARTMENT VARCHAR(100)
);

INSERT INTO WORKER(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
(001, 'Monika', 'Arora', 100000, '2014-02-020 09:00:00', 'HR'),
(002, 'Niharika', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin'),
(003, 'Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '2014-02-20 09:00:00', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '2014-06-11 09:00:00', 'Account'),
(007, 'Satish', 'Kumar', 75000, '2014-01-20 09:00:00 ', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin');

select * from worker;

CREATE TABLE BONUS(
WORKER_REF_ID INT NOT NULL,
BONUS_DATE DATETIME,
BONUS_AMOUNT BIGINT
);

INSERT INTO BONUS(WORKER_REF_ID, BONUS_DATE, BONUS_AMOUNT) VALUES
(1, '2016-02-20 00:00:00', 5000),
(2, '2016-06-11 00:00:00', 3000),
(3, '2016-02-20 00:00:00', 4000),
(1, '2016-02-20 00:00:00', 4500),
(2, '2016-06-11 00:00:00', 3500);

SELECT * FROM BONUS;

CREATE TABLE TITLE(
WORKER_REF_ID INT NOT NULL,
WORKER_TITLE VARCHAR(100),
AFFECTED_FROM DATETIME
);

INSERT INTO TITLE(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
(1, 'Manager', '2016-02-20 00:00:00'),
(2, 'Executive', '2016-06-11 00:00:00'),
(8, 'Executive', '2016-06-11 00:00:00'),
(5, 'Manager', '2016-06-11 00:00:00'),
(4, 'Asst. Manager', '2016-06-11 00:00:00'),
(7, 'Executive', '2016-06-11 00:00:00'),
(6, 'Lead', '2016-06-11 00:00:00'),
(3, 'lead', '2016-06-11 00:00:00');

SELECT * FROM title;

# Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
SELECT FIRST_NAME AS WORKER_NAME FROM WORKER;

# Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
select upper(first_name) from worker;

 # Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
 SELECT DISTINCT DEPARTMENT FROM WORKER;
 
 # Q-4. Write an SQL query to print the first three characters of FIRST_NAME from Worker tab
 SELECT SUBSTRING(FIRST_NAME,1,3) FROM WORKER;
 
 # Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.
 SELECT instr(FIRST_NAME, 'a') FROM WORKER
 WHERE FIRST_NAME = 'Amitabh';
 
 # Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
 SELECT RTRIM(FIRST_NAME) FROM WORKER;
 
 # Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
 SELECT LTRIM(FIRST_NAME) FROM WORKER;
 
 # Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
SELECT distinct LENGTH(DEPARTMENT) FROM WORKER;

# Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
SELECT REPLACE(FIRST_NAME, 'a', 'A') FROM WORKER; 

# Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS COMPLETE_NAME FROM WORKER;

# Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
SELECT * FROM WORKER 
ORDER BY FIRST_NAME ASC;

# Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
SELECT * FROM WORKER
ORDER BY FIRST_NAME ASC,
DEPARTMENT DESC;

# Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
SELECT * FROM WORKER
WHERE FIRST_NAME IN ('Vipul', 'Satish');

# Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
SELECT * FROM WORKER
WHERE FIRST_NAME NOT IN ('Vipul', 'Satish');

# Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
SELECT * FROM WORKER
WHERE DEPARTMENT in ('Admin');

# Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
SELECT * FROM WORKER
WHERE FIRST_NAME LIKE ('%a%');

# Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
SELECT * FROM WORKER
WHERE FIRST_NAME LIKE ('%a');

# Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
SELECT * FROM WORKER
WHERE FIRST_NAME LIKE ('_____h');

# Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
SELECT * FROM WORKER
WHERE SALARY BETWEEN 100000 AND 500000;

# Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
SELECT * FROM WORKER
WHERE YEAR(JOINING_DATE) = 2014 AND MONTH(JOINING_DATE) = 2;

# Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
SELECT COUNT(*) FROM WORKER
WHERE DEPARTMENT = ('Admin');

# Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
SELECT CONCAT(FIRST_NAME,' ', LAST_NAME), SALARY FROM WORKER
WHERE SALARY BETWEEN 50000 AND 100000;

# Q-24. Write an SQL query to print details of the Workers who are also Managers.
SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE
FROM Worker W
INNER JOIN Title T
ON W.WORKER_ID = T.WORKER_REF_ID
AND T.WORKER_TITLE in ('Manager');


# Q-26. Write an SQL query to show only odd rows from a table.
select * from WORKER 
where mod(WORKER_ID, 2) > 0; 

# Q-27. Write an SQL query to show only even rows from a table.
select * from WORKER
where mod(WORKER_ID,2) = 0;

# Q-28. Write an SQL query to clone a new table from another table.
create table worker2 as select * from worker;

# Q-29. Write an SQL query to fetch intersecting records of two tables.
select * from worker
inner join worker2 ON
worker.worker_id = worker2.worker_id;

# Q-30. Write an SQL query to show records from one table that another table does not have.
select * from worker
left join title on
worker.worker_id = title.worker_ref_id;

# Q-31. Write an SQL query to show the current date and time.
select current_timestamp();

# Q-32. Write an SQL query to show the top n (say 10) records of a table.
select * from worker
order by salary desc
limit 10;

# Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
SELECT * from WORKER
order by SALARY desc
LIMIT 4,1;

# Q-36. Write an SQL query to show the second highest salary from a table.
SELECT concat(FIRST_NAME, ' ', LAST_NAME), max(SALARY) from WORKER
where SALARY not in (SELECT max(SALARY) from WORKER);

# Q-37. Write an SQL query to show one row twice in results from a table.
select * from worker
union all
select * from worker;

# Q-38. Write an SQL query to fetch intersecting records of two tables.
select * from WORKER W
inner join TITLE T
on W.WORKER_ID = T.WORKER_REF_ID;

# Q-39. Write an SQL query to fetch the first 50% records from a table.
SELECT * from WORKER
where WORKER_ID <= 
(select count(WORKER_ID)/2 from WORKER);

# Q-40. Write an SQL query to fetch the departments that have less than five people in it.
SELECT DEPARTMENT, count(DEPARTMENT) as NUMBER_OF_PEOPLE FROM WORKER
group by DEPARTMENT
having count(WORKER_ID) < 5;

# Q-41. Write an SQL query to show all departments along with the number of people in there.
SELECT DEPARTMENT, count(DEPARTMENT) AS NUMBER_OF_PEOPLE from WORKER
group by DEPARTMENT;

# Q-42. Write an SQL query to show the last record from a table.
SELECT * from WORKER
where WORKER_ID = (SELECT max(WORKER_ID) from WORKER);

# Q-43. Write an SQL query to fetch the first row of a table.
SELECT * from WORKER
where WORKER_ID = (SELECT min(WORKER_ID) from WORKER);

# Q-44. Write an SQL query to fetch the last five records from a table.
(SELECT * from WORKER
order by WORKER_ID desc limit 5)
order by WORKER_ID ASC;

# Q-45. Write an SQL query to print the name of employees having the highest salary in each department.

SELECT FIRST_NAME, DEPARTMENT, SALARY FROM WORKER
WHERE SALARY in (SELECT max(SALARY) 
				FROM WORKER 
                group by DEPARTMENT);

# Q-46. Write an SQL query to fetch three max salaries from a table.
SELECT distinct Salary from worker W1
WHERE 3 >= (SELECT count(distinct Salary) from worker W2
WHERE W1.Salary <= W2.Salary) 
order by W1.Salary desc;

# Q-47. Write an SQL query to fetch three min salaries from a table.
SELECT distinct Salary from worker W1
WHERE 3 >= (SELECT count(distinct Salary) from worker W2 
WHERE W1.Salary >= W2.Salary) 
order by W1.Salary desc;


# Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
SELECT DEPARTMENT, sum(SALARY) as TOTAL_SALARY from WORKER
group by department;

# Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
SELECT concat(FIRST_NAME, ' ', LAST_NAME) AS NAMES, SALARY from Worker 
WHERE SALARY=(SELECT max(SALARY) from Worker);