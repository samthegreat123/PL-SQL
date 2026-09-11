---5) Write a PL/SQL block using a parameterized cursor 
--that displays the department wise basic salary of each 
--employee and department wise total gross salary.

SET SERVEROUTPUT ON;

DECLARE

    CURSOR dept_cursor IS
        SELECT DISTINCT Deptno, Deptname
        FROM EMP
        ORDER BY Deptno;

    CURSOR emp_cursor(p_deptno NUMBER) IS
        SELECT Name, BasicSal
        FROM EMP
        WHERE Deptno = p_deptno;

    v_Total NUMBER;

BEGIN

    FOR dept IN dept_cursor LOOP

        v_Total := 0;

        DBMS_OUTPUT.PUT_LINE('Department: ' || dept.Deptname);
        DBMS_OUTPUT.PUT_LINE('-------------------------');

        FOR emp IN emp_cursor(dept.Deptno) LOOP

            DBMS_OUTPUT.PUT_LINE(
                'Employee: ' || emp.Name ||
                ' | Basic Salary: ' || emp.BasicSal
            );

            v_Total := v_Total + emp.BasicSal;

        END LOOP;

        DBMS_OUTPUT.PUT_LINE(
            'Department Total Salary: ' || v_Total
        );

        DBMS_OUTPUT.PUT_LINE('=========================');

    END LOOP;

END;
/