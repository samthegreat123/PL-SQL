DECLARE
    CURSOR c_emp IS
        SELECT empno, ename, sal
        FROM emp
        ORDER BY sal DESC;

    v_empno emp.empno%TYPE;
    v_ename emp.ename%TYPE;
    v_sal   emp.sal%TYPE;
BEGIN
    OPEN c_emp;

    LOOP
        FETCH c_emp INTO v_empno, v_ename, v_sal;
        EXIT WHEN c_emp%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Emp No: ' || v_empno ||
            ', Name: ' || v_ename ||
            ', Salary: ' || v_sal
        );
    END LOOP;

    CLOSE c_emp;
END;
/
