---2) Write a PL/SQL block that uses a cursor attribute 
--%ISOPEN and %NOTFOUND to raise the basic salary 
--of employees of department number 20 by 5% and 
--also display the appropriate message based on the 
--existence of the record in the EMP table. Whenever 
--any such raise is given to the employees, a record for 
--the same is maintained in the emp_update table. 
--(Perform using both Implicit and Explicit Cursor).

SET SERVEROUTPUT ON;

DECLARE

    CURSOR emp_cursor IS
        SELECT EID, BasicSal
        FROM EMP
        WHERE Deptno = 20;

    v_EID EMP.EID%TYPE;
    v_BasicSal EMP.BasicSal%TYPE;

BEGIN

    OPEN emp_cursor;

    FETCH emp_cursor INTO v_EID, v_BasicSal;

    IF emp_cursor%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employees found in Department 20.');
    ELSE

        WHILE emp_cursor%FOUND LOOP

            UPDATE EMP
            SET BasicSal = BasicSal + (BasicSal * 5 / 100)
            WHERE EID = v_EID;

            INSERT INTO emp_update
            VALUES (v_EID, SYSDATE, v_BasicSal, v_BasicSal * 1.05);

            FETCH emp_cursor INTO v_EID, v_BasicSal;

        END LOOP;

        DBMS_OUTPUT.PUT_LINE('Salary increased by 5% for employees in Department 20.');

    END IF;

    CLOSE emp_cursor;

END;
/