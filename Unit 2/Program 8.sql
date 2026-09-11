--8.) Write a PL/SQL block to display data with the use 
--of LIKE Operator using cursor FOR Loop. 

SET SERVEROUTPUT ON;

DECLARE

    CURSOR emp_cursor IS
        SELECT *
        FROM EMP
        WHERE Name LIKE 'J%';

BEGIN

    FOR emp IN emp_cursor LOOP

        DBMS_OUTPUT.PUT_LINE(
            'EID: ' || emp.EID ||
            ' | Name: ' || emp.Name ||
            ' | Department: ' || emp.Deptname ||
            ' | Salary: ' || emp.BasicSal
        );

    END LOOP;

END;
/