---2) Write a simple procedure that increases the basic 
salary of employees for the given department number 
by percentage inputted by the user using the IN 
parameter. ---

-- Create the Procedure
CREATE OR REPLACE PROCEDURE update_dept_salary(
    p_deptno IN NUMBER,
    p_percentage IN NUMBER
) AS
BEGIN
    UPDATE emp
    SET sal = sal + (sal * p_percentage / 100)
    WHERE deptno = p_deptno;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Salaries updated successfully for Department: ' || p_deptno);
END;
/

-- Call using a PL/SQL Block
BEGIN
    update_dept_salary(p_deptno => 10, p_percentage => 10);
END;
/