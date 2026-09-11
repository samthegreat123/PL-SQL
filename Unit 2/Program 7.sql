--7) Write a PL/SQL block to display records from the 
--CUSTOMER table using an explicit cursor. 

SET SERVEROUTPUT ON;

DECLARE

    CURSOR emp_cursor(p_deptno NUMBER) IS
        SELECT *
        FROM EMP
        WHERE Deptno = p_deptno;

    v_Emp emp_cursor%ROWTYPE;
    v_Count NUMBER := 0;

    NO_DEPT_FOUND EXCEPTION;

BEGIN

    OPEN emp_cursor(&enter_deptno);

    LOOP

        FETCH emp_cursor INTO v_Emp;

        EXIT WHEN emp_cursor%NOTFOUND;

        INSERT INTO EMP_BACKUP
        VALUES (
            v_Emp.EID,
            v_Emp.Name,
            v_Emp.Deptno,
            v_Emp.Deptname,
            v_Emp.Gender,
            v_Emp.Age,
            v_Emp.BasicSal
        );

        v_Count := v_Count + 1;

    END LOOP;

    CLOSE emp_cursor;

    IF v_Count = 0 THEN
        RAISE NO_DEPT_FOUND;
    ELSE
        DBMS_OUTPUT.PUT_LINE(
            v_Count || ' employee(s) copied to EMP_BACKUP.'
        );
    END IF;

EXCEPTION

    WHEN NO_DEPT_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(
            'No employees found for the given department.'
        );

END;
/