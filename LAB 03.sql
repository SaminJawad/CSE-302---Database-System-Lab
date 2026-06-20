-- ============================================================
-- Lab 03 - String Functions, Pattern Matching & Multi-table Joins
-- Database: Oracle XE 18c (Banking Schema)
-- Course: CSE302 - Database Systems
-- University: East West University
-- Author: Samin Jawad
-- ============================================================

-- Run banking.sql schema/data script before executing the queries below
-- Download and save banking script from https://goo.gl/o3r4Y2

@ 'C:\Users\Student\Desktop\banking (1).sql';

SELECT *FROM CUSTOMER;
SELECT *FROM ACCOUNT;
SELECT *FROM BRANCH;
SELECT *FROM LOAN;
SELECT *FROM BORROWER;
SELECT *FROM DEPOSITOR;



SELECT CUSTOMER_NAME
FROM CUSTOMER
WHERE CUSTOMER_NAME LIKE 'J%'; -- Names start with J in the Customer Table, Remember to put the query in the quotation


--FIND CUSTOMER CITY THAT HAS TWO OCCURENCES OF o ANYWHERE IN CITY'S NAME
SELECT CUSTOMER_CITY
FROM CUSTOMER
WHERE CUSTOMER_CITY LIKE '%o%o%';

SELECT UPPER CUSTOMER_CITY --Converts  the whole column in upper case
FROM CUSTOMER;


SELECT LOWER CUSTOMER_CITY --Converts  the whole column in lower case
FROM CUSTOMER;

SELECT CUSTOMER_CITY
FROM CUSTOMER
WHERE LOWER(CUSTOMER_CITY LIKE '%o%o%'); -- Converts whole column into lower case then check the condition, this shows actually case sensitiveness doesn't matter [THIS IS TEMPORARY]

SELECT CUSTOMER_CITY
FROM CUSTOMER
WHERE UPPER(CUSTOMER_CITY LIKE '%O%O%'); -- Converts whole column into upper case then check the condition, this shows actually case sensitiveness doesn't matter [THIS ARE TEMPORART]

SELECT CUSTOMER_NAME, LENGTH(CUSTOMER_NAME)
FROM CUSTOMER; -- Shows the Customer name and there character length


--FIND CUSTOMER NAME WHO HAS I IN THEIRNAME AND HAS A LENGTH OF ATLEAST 7
SELECT CUSTOMER_NAME, LENGTH(CUSTOMER_NAME)
FROM CUSTOMER
WHERE LENGTH(CUSTOMER_NAME) >= 7 AND LOWER(CUSTOMER_NAME) LIKE '%i%';

--FIND CUSTOMER NAME WHO HAS I IN THEIRNAME AND HAS A LENGTH OF ATLEAST 7
SELECT CUSTOMER_NAME, LENGTH(CUSTOMER_NAME)
FROM CUSTOMER
WHERE CUSTOMER_NAME LIKE '_______%' AND LOWER(CUSTOMER_NAME) LIKE '%i%';


SELECT DISTINCT CUSTOMER_NAME --WON'T SHOW DUPLICATE VALUES
FROM CUSTOMER; 

SELECT DISTINCT CUSTOMER_NAME 
FROM CUSTOMER 
ORDER BY CUSTOMER_NAME DESC; --SORT BY CUSTOMER_STREET

SELECT BALANCE, BALANCE + 1000 AS INCR_BALANCE --ADD 1000 TO EACH ROW AND MAKE IT A NEW TABLE NAMEDINCR_BALANCE, IF I DO NOT GIVE THE AS(NAME)N IT WILL SHOW AS THE PREVIOUS COLUMN NAME 
FROM ACCOUNT;


--CROSS JOIN + FILTER
SELECT *
FROM CUSTOMER,DEPOSITOR
WHERE CUSTOMER.CUSTOMER_NAME = DEPOSITOR.CUSTOMER_NAME;

SELECT *
FROM CUSTOMER C, DEPOSITOR D -- WE CAN NOW CALL THE CUSTOMER TABLE C AND DEPOSITOR TABLE D
WHERE C.CUSTOMER_NAME = D.CUSTOMER_NAME;

--NATURAL JOIN
SELECT *
FROM CUSTOMER NATURAL JOIN DEPOSITOR;


--JOIN ON -SAME AS CROSS JOIN + FILTER
SELECT *
FROM CUSTOMER C JOIN DEPOSITOR D
ON C.CUSTOMER_NAME = D.CUSTOMER_NAME;

--JOIN USING -SAME AS NATURAL JOIN
SELECT *
FROM CUSTOMER JOIN DEPOSITOR  USING(CUSTOMER_NAME);


--Find all account numbers and their balance which are opened in ‘Downtown’ branch or
which have balance in between 600 and 750. (on single table)
SELECT ACCOUNT_NUMBER
FROM ACCOUNT
WHERE BRANCH_NAME = 'Downtown' OR (BALANCE >= 600 AND BALANCE <= 750);

--Find all loan numbers which have amount greater than or equal to 1000 and their cus-tomers are living in ‘Harrison’ city.
SELECT LOAN.LOAN_NUMBER
FROM LOAN
JOIN BORROWER
ON LOAN.LOAN_NUMBER = BORROWER.LOAN_NUMBER
JOIN CUSTOMER
ON BORROWER.CUSTOMER_NAME = CUSTOMER.CUSTOMER_NAME
WHERE LOAN.AMOUNT >= 1000 AND CUSTOMER.CUSTOMER_CITY = 'Harrison';

--Display the customer related information in alphabetic order of customer cities.
SELECT *
FROM CUSTOMER
ORDER BY CUSTOMER_CITY;

--Find all account numbers which are opened in a branch located in ‘Rye’ city.
SELECT ACCOUNT_NUMBER
FROM ACCOUNT
WHERE BRANCH_NAME = 'Rye';