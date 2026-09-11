--4) Write a PL/SQL block using a cursor FOR loop to 
--display the name and the basic salary of the top 3 
--highest paid employees. (Use Cursor For Loop).

SET SERVEROUTPUT ON;

DECLARE

    CURSOR emp_cursor IS
        SELECT Name, BasicSal
        FROM EMP
        ORDER BY BasicSal DESC;

    v_Count NUMBER := 0;

BEGIN

    FOR emp IN emp_cursor LOOP

        v_Count := v_Count + 1;

        EXIT WHEN v_Count > 3;

        DBMS_OUTPUT.PUT_LINE(
            'Name: ' || emp.Name ||
            ' | Basic Salary: ' || emp.BasicSal
        );

    END LOOP;

END;
/ 