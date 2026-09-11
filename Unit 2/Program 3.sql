--3) Write a PL/SQL block that uses a cursor attribute 
--%ROWCOUNT to display the name, department and 
--basic salary of the first 5 employees getting the 
--highest basic salary. (Use Explicit Cursor).

SET SERVEROUTPUT ON;

DECLARE

    CURSOR emp_cursor IS
        SELECT Name, Deptname, BasicSal
        FROM EMP
        ORDER BY BasicSal DESC;

    v_Name EMP.Name%TYPE;
    v_Deptname EMP.Deptname%TYPE;
    v_BasicSal EMP.BasicSal%TYPE;

BEGIN

    OPEN emp_cursor;

    LOOP

        FETCH emp_cursor INTO v_Name, v_Deptname, v_BasicSal;

        EXIT WHEN emp_cursor%NOTFOUND OR emp_cursor%ROWCOUNT > 5;

        DBMS_OUTPUT.PUT_LINE(
            'Name: ' || v_Name ||
            ' | Department: ' || v_Deptname ||
            ' | Basic Salary: ' || v_BasicSal
        );

    END LOOP;

    CLOSE emp_cursor;

END;
/ 