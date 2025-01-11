-- CREATE DATABASE org;
USE org;

--  CREATE WORKER TABLE;
CREATE TABLE worker (
    WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT,
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);

--  FILL VALUES INTO THE WORKER TABLE 
INSERT INTO worker (FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
('John', 'Doe', 50000, '2023-01-15 09:30:00', 'HR'),
('Jane', 'Smith', 60000, '2022-11-10 10:00:00', 'Admin'),
('Mike', 'Brown', 55000, '2023-05-20 11:45:00', 'HR'),
('Emily', 'Davis', 70000, '2021-08-01 08:00:00', 'Admin'),
('David', 'Wilson', 48000, '2023-03-18 13:15:00', 'Account'),
('Sophia', 'Johnson', 62000, '2022-06-05 10:30:00', 'Admin'),
('Chris', 'Taylor', 58000, '2020-09-12 14:20:00', 'Account'),
('Emma', 'White', 52000, '2021-12-25 15:40:00', 'HR'),
('Oliver', 'Harris', 75000, '2019-02-10 09:00:00', 'Account'),
('Isabella', 'Clark', 63000, '2023-07-22 16:50:00', 'HR');


--  SHOW TABLE DATA;
SELECT * FROM worker;


--   CREATE BONUS TABLE ;
CREATE TABLE Bonus(
    WORKER_REF_ID INT,
    BOUNS_AMOUNT INT ,
    BONUS_DATE DATETIME,
    FOREIGN KEY(WORKER_REF_ID) REFERENCES worker(WORKER_ID) ON DELETE CASCADE
);

--  INSERT INTO BONUS TABLE
INSERT INTO bonus VALUES (1, 5000, '2023-02-15 10:00:00'),
(2, 7000, '2023-01-10 11:30:00'),
(3, 4500, '2023-06-25 14:00:00'),
(4, 8000, '2022-12-01 09:15:00'), 
(5, 3000, '2023-04-10 12:45:00'), 
(6, 6000, '2022-07-15 13:50:00'), 
(1, 4000, '2021-10-20 16:20:00'), 
(2, 3500, '2022-01-30 15:30:00'),
(4, 9000, '2020-03-12 09:00:00'), 
(6, 6500, '2023-08-05 14:45:00'); 

--  SHOW DATA OF BONUS TABLE
SELECT * FROM bonus;


--  CREATE A TITLE TABLE 

CREATE TABLE Title(
    WORKER_REF_ID INT ,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY(WORKER_REF_ID) REFERENCES worker(WORKER_ID) ON DELETE CASCADE
);

--  FILL INTO TITLE TABLE;

INSERT INTO Title VALUES 
(1, 'Manager', '2022-01-15 10:00:00'),     
(2, 'Lead', '2021-11-10 11:30:00'),  
(3, 'Asst. Manager', '2023-03-01 09:45:00'), 
(4, 'Executive', '2020-08-01 08:00:00'),   
(5, 'Manager', '2023-01-10 13:15:00'),     
(6, 'Executive', '2022-06-15 14:30:00'), 
(7, 'Manager', '2019-10-05 16:20:00'),  
(8, 'Executive', '2021-12-20 12:40:00'), 
(9, 'Lead', '2018-03-12 09:30:00'),   
(10, 'Asst. Manager', '2023-07-01 15:50:00'); 

--  SHOW DATA OF TITLE TABLE;
SELECT * FROM title;


--  CREATE A PAIR TABLE 
CREATE TABLE PAIR(
    A INT,
    B INT
);

INSERT INTO PAIR VALUES 
(1,2),
(2,4),
(2,1),
(3,2),
(4,2),
(5,6),
(6,5),
(7,8);

--  SHOW PAIR TABLE DATA
SELECT * FROM PAIR;





