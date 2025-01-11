
-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.

SELECT FIRST_NAME AS WORKER_NAME FROM worker ;

-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.

SELECT UPPER(FIRST_NAME) FROM worker;

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.

SELECT DISTINCT DEPARTMENT FROM WORKER;

--  APPLY IT USING GROUP BY STATEMENT , CAUSE IF WE DON'T APPLY AGGREGATE METHODS IN GROUP BY, THEN IT WORKS AS DISTINCT;

SELECT DEPARTMENT FROM worker GROUP BY DEPARTMENT;

-- Q-4. Write an SQL query to print the first three characters of FIRST_NAME from Worker table.

SELECT SUBSTRING(FIRST_NAME,1 ,3) FROM worker;

-- Q-5. Write an SQL query to find the position of the alphabet (‘b’) in the first name column ‘Isabella’ from Worker table.

SELECT INSTR(FIRST_NAME, "B") FROM WORKER WHERE FIRST_NAME = "ISABELLA";

-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.

SELECT RTRIM(FIRST_NAME) FROM WORKER;  -- TRIM IS USED TO REMOVE ALL THE WHITE SPACE FROM THE STRING, BUT FOR RIGHT OF LEFT SPACES USE RTRIM OR LTRIM RESPECTIVELY;


-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.

SELECT LTRIM(FIRST_NAME) FROM WORKER;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.

SELECT DISTINCT DEPARTMENT , LENGTH(DEPARTMENT) FROM WORKER ;

-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.

SELECT REPLACE(FIRST_NAME, "a", "A") FROM WORKER;

-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.

SELECT CONCAT(FIRST_NAME ," ", LAST_NAME) AS COMPLETE_NAME FROM WORKER;

-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.

SELECT * FROM WORKER ORDER BY FIRST_NAME ASC;

-- Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.

SELECT * FROM WORKER ORDER BY DEPARTMENT DESC , FIRST_NAME ;

-- Q-13. Write an SQL query to print details for Workers with the first name as “Sophia” and “Emma” from Worker table.

SELECT * FROM WORKER WHERE FIRST_NAME IN ("sophia", "emma");

-- Q-14. Write an SQL query to print details of workers excluding first names, “Sophia” and “Emma” from Worker table.

SELECT * FROM WORKER WHERE FIRST_NAME NOT IN ("SOPHIA", "EMMA");

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”.  NOTE: AFTER ADMIN , THERE CAN BE ANY NUMBER OF CHARACTERS;

SELECT * FROM WORKER WHERE DEPARTMENT LIKE "ADMIN%";


-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.

SELECT * FROM WORKER WHERE FIRST_NAME LIKE "%a%";

-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.

SELECT * FROM WORKER WHERE FIRST_NAME LIKE "%a";

-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’ and contains six alphabets.

SELECT * FROM WORKER WHERE FIRST_NAME LIKE "_____a";

-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 10000 and 50000.

SELECT * FROM WORKER WHERE SALARY BETWEEN 10000 AND 50000;

-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2019.

SELECT * FROM WORKER WHERE YEAR(JOINING_DATE) = 2019 AND MONTH(JOINING_DATE) = 2;


-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.

SELECT DEPARTMENT, COUNT(*) FROM WORKER WHERE DEPARTMENT = "ADMIN";

-- Q-22. Write an SQL query to fetch worker full names with salaries >= 60000 and <= 100000.

SELECT CONCAT(FIRST_NAME , " " , LAST_NAME) AS FULL_NAME FROM WORKER WHERE SALARY BETWEEN 60000 AND 100000;

-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.

SELECT DEPARTMENT , COUNT(WORKER_ID) AS no_of_worker FROM WORKER GROUP BY DEPARTMENT ORDER BY no_of_worker DESC;

-- Q-24. Write an SQL query to print details of the Workers who are also Managers.

SELECT W.* FROM WORKER AS W INNER JOIN TITLE AS T ON W.WORKER_ID = T.WORKER_REF_ID WHERE T.WORKER_TITLE = "MANAGER";

-- Q-25. Write an SQL query to fetch number (more than 1) of same titles in the ORG of different types.

SELECT WORKER_TITLE, COUNT(*) FROM TITLE GROUP BY WORKER_TITLE HAVING COUNT(*) >1;  -- WE CAN'T USE WHERE IN GROUP BY;

-- Q-26. Write an SQL query to show only odd rows from a table.

SELECT * FROM WORKER WHERE MOD(WORKER_ID ,2) !=0;

SELECT * FROM WORKER WHERE MOD(WORKER_ID ,2) <>0;  -- THIS SIGN ALSO WORKS AS NOT EQUAL;

-- Q-27. Write an SQL query to show only even rows from a table.

SELECT * FROM WORKER WHERE MOD(WORKER_ID ,2) = 0;

-- Q-28. Write an SQL query to clone a new table from another table.

CREATE TABLE WORKER_CLONE LIKE WORKER ;  -- THIS IS HOW I CAN CLONE A EXISTING SCHEMA ;

-- FOR CLONE DATA WE CAN USE -->
INSERT INTO WORKER_CLONE SELECT * FROM WORKER;  -- DATA CLONED FROM EXISTING SCHEMA OF WORKER;
SELECT * FROM worker_clone;


-- Q-29. Write an SQL query to fetch intersecting records of two tables.

SELECT W.* FROM WORKER AS W INNER JOIN worker_clone USING(WORKER_ID);

-- Q-30. Write an SQL query to show records from one table that another table does not have.

SELECT * FROM WORKER LEFT JOIN worker_clone USING(WORKER_ID) WHERE WORKER_CLONE.WORKER_ID = NULL;

-- Q-31. Write an SQL query to show the current date and time.  USING DUAL TABLES;

SELECT CURDATE();  -- USED TO FETCH DATE ONLY;
SELECT NOW();     -- THIS WILL SHOW BOTH TIME AND DATE;

-- Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary.

SELECT * FROM WORKER ORDER BY SALARY DESC LIMIT 5;

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.

SELECT * FROM WORKER ORDER BY SALARY DESC LIMIT 4,1;

-- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.

SELECT DISTINCT SALARY FROM WORKER W1
WHERE 4 = (
    SELECT COUNT(DISTINCT W2.SALARY)
    FROM WORKER W2
    WHERE W2.SALARY > W1.SALARY
);

-- Q-35. Write an SQL query to fetch the list of employees with the same salary.

SELECT W1.* FROM WORKER W1, WORKER W2 WHERE W1.SALARY = W2.SALARY AND W1.WORKER_ID <> W2.WORKER_ID;  -- COMPARING WITH OTHERS RATHER THEN SELF COMPARE;

-- Q-36. Write an SQL query to show the second highest salary from a table using sub-query.

SELECT MAX(SALARY) FROM WORKER WHERE SALARY 
NOT IN (SELECT MAX(SALARY) 
FROM WORKER);

--  WE CAN ALSO NEST MULTIPLE SUB QUERIES FOR 3rd AND 4th HIGHEST SALARY RESPECTIVELY;

SELECT MAX(SALARY) FROM WORKER
WHERE SALARY < (
    SELECT MAX(SALARY) FROM WORKER
    WHERE SALARY < (
        SELECT MAX(SALARY) FROM WORKER
    )
);    -- THIS WILL GIVE ME 3rd HIGHEST SALARY


-- SUB-QUERY FOR FOURTH HIGHEST SALRY;

SELECT MAX(SALARY)
FROM WORKER
WHERE SALARY <(
    SELECT MAX(SALARY)
    FROM WORKER
    WHERE SALARY < (
        SELECT MAX(SALARY)
        FROM WORKER
        WHERE SALARY NOT IN (
            SELECT MAX(SALARY)
            FROM WORKER
        )
    )
);


-- Q-37. Write an SQL query to show one row twice in results from a table.

SELECT * FROM WORKER
UNION ALL  -- UNION ALL ALLOWS DUPLICATE DATA IN SET;
SELECT * FROM WORKER ORDER BY WORKER_ID;

-- Q-38. Write an SQL query to list worker_id who does not get bonus.

SELECT WORKER_ID 
FROM WORKER AS W 
LEFT JOIN BONUS AS B
ON W.WORKER_ID = B.WORKER_REF_ID
WHERE B.WORKER_REF_ID IS NULL;

-- 2ND WAY USING SUB QUERY;

SELECT WORKER_ID FROM WORKER WHERE WORKER_ID NOT IN (
    SELECT WORKER_REF_ID FROM BONUS 
);

-- Q-39. Write an SQL query to fetch the first 50% records from a table.

SELECT * FROM WORKER
WHERE WORKER_ID <=(SELECT FLOOR(COUNT(*)/2) AS CNT FROM WORKER);

-- Q-40. Write an SQL query to fetch the departments that have less than 4 people in it.

SELECT DEPARTMENT , COUNT(DEPARTMENT) AS DEP_COUNT 
FROM WORKER GROUP BY DEPARTMENT HAVING DEP_COUNT < 4;

-- Q-41. Write an SQL query to show all departments along with the number of people in there.

SELECT DEPARTMENT , COUNT(DEPARTMENT) AS PEOPLE_COUNT FROM WORKER GROUP BY DEPARTMENT;

-- Q-42. Write an SQL query to show the last record from a table.

(SELECT * FROM WORKER ORDER BY WORKER_ID DESC LIMIT 1);

-- USING SUB-QUERY;

SELECT * FROM WORKER 
WHERE WORKER_ID = (SELECT MAX(WORKER_ID) FROM WORKER);


-- Q-43. Write an SQL query to fetch the first row of a table.

SELECT * FROM WORKER ORDER BY WORKER_ID LIMIT 1;

--USING SUB-QUERY
SELECT * FROM WORKER
WHERE WORKER_ID = (SELECT MIN(WORKER_ID) FROM WORKER);

-- Q-44. Write an SQL query to fetch the last five records from a table.

(SELECT * FROM WORKER ORDER BY WORKER_ID DESC LIMIT 5) ORDER BY WORKER_ID; -- RETAIN THE ORDER

-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.

SELECT CONCAT(FIRST_NAME , " ", LAST_NAME) AS FULL_NAME , W.DEPARTMENT , W.SALARY 
FROM (
    SELECT DEPARTMENT , MAX(SALARY) AS MAXSAL
    FROM WORKER GROUP BY DEPARTMENT
    ) TEMP  -- DERIVE A TABLE TEMP
INNER JOIN WORKER W ON TEMP.DEPARTMENT = W.DEPARTMENT AND TEMP.MAXSAL = W.SALARY;

-- Q-46. Write an SQL query to fetch three max salaries from a table using co-related subquery.

SELECT DISTINCT SALARY FROM WORKER W1
WHERE 3 >= (
    SELECT COUNT(DISTINCT W2.SALARY)
    FROM WORKER W2 WHERE W2.SALARY >= W1.SALARY
) ORDER BY SALARY DESC;

-- Q-47. Write an SQL query to fetch three min salaries from a table using co-related subquery.

SELECT DISTINCT SALARY FROM WORKER W1
WHERE 3 >= (
    SELECT COUNT(DISTINCT W2.SALARY)
    FROM WORKER W2
    WHERE W2.SALARY <= W1.SALARY
) ORDER BY SALARY ;

-- Q-48. Write an SQL query to fetch nth max salaries from a table.

SELECT SALARY FROM WORKER ORDER BY SALARY DESC LIMIT 4,1;

-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.

SELECT DEPARTMENT, SUM(SALARY) AS SUMSAL
FROM WORKER GROUP BY DEPARTMENT 
ORDER BY SUMSAL DESC;

-- Q-50. Write an SQL query to fetch the name of worker who earn the highest salary.

-- USING DERIVED TABLE
SELECT CONCAT(FIRST_NAME , " ", LAST_NAME) AS FULL_NAME ,W.SALARY
FROM (SELECT MAX(SALARY) AS MAXSAL FROM WORKER) TEMP
INNER JOIN WORKER W ON W.SALARY = TEMP.MAXSAL;

--  USING SUB-QUERY ONLY;
SELECT CONCAT(FIRST_NAME , " ", LAST_NAME) AS FULL_NAME ,SALARY
FROM WORKER WHERE SALARY = (SELECT MAX(SALARY) FROM WORKER);

-- Q-51. Remove reverse pairs from the pair table so that, table does not contain any reversed pairs.

-- METHOD 1: APPLY JOINS

SELECT P1.* FROM PAIR P1 LEFT JOIN PAIR P2 ON P1.A = P2.B AND P1.B = P2.A WHERE P1.A < P1.B OR P2.A IS NULL;

-- METHOD 2: CO-RELATED QUERIES

SELECT * FROM PAIR P1
WHERE NOT EXISTS (
    SELECT * FROM PAIR P2
    WHERE P1.B = P2.A AND P1.A = P2.B AND P1.A > P2.A
);


-------------------------------------------------------------
-----------------QS ON CO-RELATED SUB-QUERIES---------------
-------------------------------------------------------------

-- Q1. Find the workers whose salary is greater than the average salary of all workers in their department.

-- Q2. Retrieve the names of workers who are the only ones in their department.

-- Q3. Find the worker details whose salary is the second highest in their department.

-- Q4. Identify the workers who have received the highest bonus in their department.

-- Q5. List the workers whose joining date is the most recent in their department.

-- Q6. Find the workers who have the second highest bonus amount across all departments.

-- Q7. Retrieve the names of workers whose bonus is greater than the average bonus in their department.

-- Q8. Find the workers whose titles have been updated most recently in their department.

-- Q9. List the workers who have a salary greater than the average salary of all workers who joined before them.

-- Q10. Identify the workers who have the maximum salary but are not managers.





















