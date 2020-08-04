--------------------------------------------------Section 1--------------------------------------------------
--Task1-1
SELECT * FROM LOCATIONS;

--Task1-2
SELECT * FROM EMPLOYEES;
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, DEPARTMENT_ID FROM EMPLOYEES;
SELECT EMPLOYEE_ID "Emp#", FIRST_NAME || ' ' || LAST_NAME "Full Name", JOB_ID "Job Title", DEPARTMENT_ID "Department ID" FROM EMPLOYEES;

--Task1-3
SELECT * FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG';

--Task1-4
SELECT FIRST_NAME || ' ' || LAST_NAME "Full Name", 'Phone:' || ' ' || PHONE_NUMBER || ' Email: ' || EMAIL "Contact Details" FROM EMPLOYEES;


--Task2-1
SELECT * FROM Hotel;

--Task2-2
SELECT * FROM Guest;

--Task2-3
SELECT * FROM Room;
SELECT ROOMNO, PRICE FROM Room WHERE TYPE = 'S';

--Task2-4
SELECT GUESTNAME, GUESTADDRESS FROM Guest WHERE GUESTCITY = 'London';

--Task2-5
SELECT * FROM Booking;
SELECT * FROM Booking WHERE DATETO = NULL;


--------------------------------------------------Section 2--------------------------------------------------
--Task1-1
SELECT * FROM employees;
SELECT * FROM jobs;
SELECT FIRST_NAME || ' ' || LAST_NAME "Full Name", jobs.JOB_TITLE FROM employees, jobs WHERE employees.JOB_ID = jobs.JOB_ID AND SALARY >= 10000;

--Task1-2
SELECT FIRST_NAME || ' ' || LAST_NAME "Full Name", jobs.JOB_TITLE, employees.SALARY FROM employees, jobs 
WHERE employees.JOB_ID = jobs.JOB_ID AND SALARY NOT BETWEEN 5000 AND 12000;

--Task1-3
SELECT FIRST_NAME || ' ' || LAST_NAME "Full Name", job_history.START_DATE FROM employees, job_history 
WHERE employees.JOB_ID = job_history.JOB_ID AND ((employees.FIRST_NAME = 'Alyssa' AND employees.LAST_NAME = 'Hutton') OR (employees.FIRST_NAME = 'David' AND employees.LAST_NAME = 'Austin'));

--Task1-4
SELECT * FROM LOCATIONS;
SELECT STREET_ADDRESS, POSTAL_CODE, CITY FROM LOCATIONS WHERE COUNTRY_ID IN ('IT', 'JP');

--Task1-5
SELECT FIRST_NAME || ' ' || LAST_NAME "Full Name", 'Phone:' || ' ' || PHONE_NUMBER || ' Email: ' || EMAIL "Contact Details", HIRE_DATE FROM EMPLOYEES
WHERE HIRE_DATE <= '31/01/96' AND HIRE_DATE >= '01/01/96' ORDER BY LAST_NAME ASC;

--select sysdate from dual;

--Task1-6
--The date function SYSDATE returns the current date and time.
-- use dummy table DUAL
--DUAL is a table automatically created by Oracle Database along with the data dictionary. 
--DUAL is in the schema of the user SYS but is accessible by the name DUAL to all users. 
--It has one column, DUMMY, defined to be VARCHAR2(1), and contains one row with a value X. 
--Selecting from the DUAL table is useful for computing a constant expression with the SELECT statement. 
--Because DUAL has only one row, the constant is returned only once. Alternatively, you can select a constant, 
--pseudocolumn, or expression from any table, but the value will be returned as many times as there are rows in the table. 
--Please refer to "SQL Functions" for many examples of selecting a constant value from DUAL.

--Task1-7
SELECT FIRST_NAME || ' ' || LAST_NAME "Full Name", 'Phone:' || ' ' || PHONE_NUMBER || ' Email: ' || EMAIL "Contact Details", HIRE_DATE FROM EMPLOYEES
WHERE HIRE_DATE > '31/12/99' ORDER BY HIRE_DATE DESC;

--Task1-8
SELECT * FROM employees WHERE FIRST_NAME LIKE 'S%n';

--Task1-9
SELECT * FROM employees WHERE JOB_ID IN ('AC_MGR', 'AD_VP', 'FI_MGR', 'HR_REP', 'PR_REP');

--Task1-10
SELECT * FROM employees WHERE JOB_ID NOT IN ('AC_MGR', 'AD_VP', 'FI_MGR', 'HR_REP', 'PR_REP');

--Task1-11
SELECT MANAGER_ID, COUNT(*) FROM employees GROUP BY MANAGER_ID;
--SELECT EMPLOYEE_ID, LAST_NAME, SALARY, DEPARTMENT_ID, MANAGER_ID FROM employees WHERE MANAGER_ID = &MANAGER_ID_INPUT;


--Task2-1
SELECT * FROM Hotel;
SELECT * FROM Room;
SELECT * FROM Booking;
SELECT * FROM Guest;

SELECT * FROM Room WHERE PRICE > 40 ORDER BY TYPE ASC;
SELECT * FROM Room WHERE PRICE > 40 ORDER BY PRICE ASC;

--Task2-2
SELECT GUESTNAME, GUESTADDRESS FROM Guest WHERE GUESTADDRESS LIKE '8 Mount St.%';


--------------------------------------------------Section 3--------------------------------------------------
--Task1-1
SELECT HOTELNAME, TYPE, PRICE FROM Hotel, Room WHERE Room.HOTELNO = Hotel.HOTELNO;

--Task1-2
SELECT GUESTNAME, HOTELNAME, DATEFROM, DATETO FROM Hotel, Booking, Guest WHERE Booking.HOTELNO = Hotel.HOTELNO AND Booking.GUESTNO = Guest.GUESTNO;

--Task2-1
SELECT * FROM employees;
SELECT * FROM jobs;
SELECT * FROM departments;
SELECT * FROM locations;
SELECT * FROM countries;
SELECT * FROM job_history;

SELECT FIRST_NAME || ' ' || LAST_NAME "Full Name", JOB_TITLE "JOB TITLE", DEPARTMENT_NAME "DEPARTMENT NAME" FROM employees, jobs, departments 
WHERE employees.JOB_ID = jobs.JOB_ID AND employees.DEPARTMENT_ID = departments.DEPARTMENT_ID ORDER BY LAST_NAME ASC;

--Task2-2
SELECT FIRST_NAME || ' ' || LAST_NAME "Full Name", EMAIL || '@MEGACORP.COM' "Email", DEPARTMENT_NAME "Department Name", CITY || ', ' || COUNTRY_NAME "Full Address" 
FROM employees, departments, locations, countries 
WHERE employees.DEPARTMENT_ID = departments.DEPARTMENT_ID AND departments.LOCATION_ID = locations.LOCATION_ID AND locations.COUNTRY_ID = countries.COUNTRY_ID
ORDER BY LAST_NAME ASC;

--Task2-3
SELECT * FROM (
SELECT FIRST_NAME || ' ' || LAST_NAME "Full Name", EMAIL || '@MEGACORP.COM' "Email", DEPARTMENT_NAME "Department Name", CITY || ', ' || COUNTRY_NAME "Full Address" 
FROM employees, departments, locations, countries 
WHERE employees.DEPARTMENT_ID = departments.DEPARTMENT_ID AND departments.LOCATION_ID = locations.LOCATION_ID AND locations.COUNTRY_ID = countries.COUNTRY_ID 
ORDER BY LAST_NAME ASC) E1
WHERE e1."Full Address" LIKE '%Germany';

SELECT * FROM (
SELECT FIRST_NAME || ' ' || LAST_NAME "Full Name", EMAIL || '@MEGACORP.COM' "Email", DEPARTMENT_NAME "Department Name", CITY || ', ' || COUNTRY_NAME "Full Address" 
FROM employees, departments, locations, countries 
WHERE employees.DEPARTMENT_ID = departments.DEPARTMENT_ID AND departments.LOCATION_ID = locations.LOCATION_ID AND locations.COUNTRY_ID = countries.COUNTRY_ID 
ORDER BY LAST_NAME ASC) E1
WHERE e1."Full Address" LIKE '%New Zealand';

--Task2-4
SELECT FIRST_NAME || ' ' || LAST_NAME "Full Name", JOB_TITLE "Job Title", DEPARTMENT_NAME "Department Name", START_DATE, END_DATE 
FROM employees, jobs, departments, job_history 
WHERE job_history.EMPLOYEE_ID = employees.EMPLOYEE_ID AND job_history.JOB_ID = jobs.JOB_ID AND job_history.DEPARTMENT_ID = departments.DEPARTMENT_ID;

--Task2-5
SELECT e.FIRST_NAME || ' ' || e.LAST_NAME "Full Name", d.DEPARTMENT_NAME "Department Name" FROM employees e RIGHT JOIN departments d
ON (e.DEPARTMENT_ID = d.DEPARTMENT_ID);

--Task2-6
SELECT  w.FIRST_NAME || ' ' || w.LAST_NAME "Employee Name", w.EMPLOYEE_ID "EMP#", m.FIRST_NAME || ' ' || m.LAST_NAME "Manager Name", m.EMPLOYEE_ID "Mgr#"
FROM employees w JOIN employees m
ON (w.manager_id = m.employee_id);

--Task2-7
SELECT  w.FIRST_NAME || ' ' || w.LAST_NAME "Employee Name", w.EMPLOYEE_ID "EMP#", m.FIRST_NAME || ' ' || m.LAST_NAME "Manager Name", m.EMPLOYEE_ID "Mgr#"
FROM employees w LEFT JOIN employees m
ON (w.manager_id = m.employee_id);

--Task2-8
SELECT ROUND(AVG(SALARY),0) "Average" FROM employees;
SELECT FIRST_NAME || ' ' || LAST_NAME "Full Name", JOB_ID "Job Title", SALARY "Salary" FROM employees WHERE SALARY > (SELECT ROUND(AVG(SALARY),0) FROM employees);




