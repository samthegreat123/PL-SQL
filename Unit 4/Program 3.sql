---3) Write a procedure that searches whether the given 
employee id is present or not in the table. If an 
employee is found then show its name otherwise raise 
appropriate error messages (Use both IN and OUT 
mode variables) and also write a PL/SQL block to call 
the procedure.---

-- Create the Procedure
CREATE OR REPLACE PROCEDURE search_emp(
    p_empno IN NUMBER,
    p_ename OUT VARCHAR2,
    p_msg OUT VARCHAR2
) AS
BEGIN
    SELECT ename INTO p_ename
    FROM emp
    WHERE empno = p_empno;
    
    p_msg := 'FOUND';
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_ename := NULL;
        p_msg := 'NOT_FOUND';
END;
/

-- PL/SQL Block to Call the Procedure
DECLARE
    v_empno NUMBER := 7369; -- Example employee number
    v_ename VARCHAR2(50);
    v_msg   VARCHAR2(20);
BEGIN
    search_emp(v_empno, v_ename, v_msg);
    
    IF v_msg = 'FOUND' THEN
        DBMS_OUTPUT.PUT_LINE('Employee Found! Name: ' || v_ename);
    ELSE
        RAISE_APPLICATION_ERROR(-20001, 'Error: Employee ID ' || v_empno || ' does not exist.');
    END IF;
END;
/

