--9) Write a PL/SQL block which displays all records of 
--Male employees working in the HR Dept from the EMP 
--table.

SELECT * 
FROM EMP
WHERE Gender = 'Male'
AND Deptname = 'HR';