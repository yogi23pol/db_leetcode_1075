# NOTE :- In this context, it's important to note that the table names used in the examples include underscores and numbers, 
# which differ from the naming conventions used in the LeetCode problem. I

Create table If Not Exists Project_20
(
project_id int, 
employee_id int
);

Create table If Not Exists Employee_20
(
employee_id int, 
name varchar(10), 
experience_years int
);

Truncate table Project_20;
insert into Project_20 (project_id, employee_id) values ('1', '1');
insert into Project_20 (project_id, employee_id) values ('1', '2');
insert into Project_20 (project_id, employee_id) values ('1', '3');
insert into Project_20 (project_id, employee_id) values ('2', '1');
insert into Project_20 (project_id, employee_id) values ('2', '4');

Truncate table Employee_20;
insert into Employee_20 (employee_id, name, experience_years) values ('1', 'Khaled', '3');
insert into Employee_20 (employee_id, name, experience_years) values ('2', 'Ali', '2');
insert into Employee_20 (employee_id, name, experience_years) values ('3', 'John', '1');
insert into Employee_20 (employee_id, name, experience_years) values ('4', 'Doe', '2');


/*
Q. Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.
Return the result table in any order.

Input: 
Project table:
+-------------+-------------+
| project_id  | employee_id |
+-------------+-------------+
| 1           | 1           |
| 1           | 2           |
| 1           | 3           |
| 2           | 1           |
| 2           | 4           |
+-------------+-------------+
Employee table:
+-------------+--------+------------------+
| employee_id | name   | experience_years |
+-------------+--------+------------------+
| 1           | Khaled | 3                |
| 2           | Ali    | 2                |
| 3           | John   | 1                |
| 4           | Doe    | 2                |
+-------------+--------+------------------+
Output: 
+-------------+---------------+
| project_id  | average_years |
+-------------+---------------+
| 1           | 2.00          |
| 2           | 2.50          |
+-------------+---------------+
Explanation: The average experience years for the first project is (3 + 2 + 1) / 3 = 2.00 and for the second project is (3 + 2) / 2 = 2.50
*/

SELECT * FROM Project_20;
SELECT * FROM Employee_20;

# TYPE 1 :- 
# SYNTAX :- ROUND(AVG(column_name), decimal_places)
SELECT p.project_id,  ROUND(AVG(e.experience_years),2) AS average_years
FROM Project_20 AS p
LEFT JOIN Employee_20 AS e 
ON p.employee_id = e.employee_id
GROUP BY p.project_id;

# TYPE 2 :- 
SELECT p.project_id,  ROUND(SUM(e.experience_years)/count(*),2) AS average_years
FROM Project_20 AS p
LEFT JOIN Employee_20 AS e 
ON p.employee_id = e.employee_id
GROUP BY p.project_id;
