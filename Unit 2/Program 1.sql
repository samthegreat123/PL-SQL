SET SERVEROUTPUT ON;

BEGIN

    UPDATE EMP
    SET BasicSal = BasicSal + (BasicSal * 5 / 100)
    WHERE Deptno = 20;

    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employees found in Department 20.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Salary increased by 5% for employees in Department 20.');
        DBMS_OUTPUT.PUT_LINE('Employees updated: ' || SQL%ROWCOUNT);
    END IF;

END;
/