/*Write a PL/SQL block to calculate the total, 
percentage and grade of student based on his/her 
Rollno from the RESULT table. (Create RESULT table 
with Rollno, Name, Sub1, Sub2, Sub3, Sub4, Sub5, 
Total, Per, Grade attributes with appropriate data 
type). */

CREATE TABLE Result (
    Rollno NUMBER,
    Name VARCHAR2(30),
    Sub1 NUMBER,
    Sub2 NUMBER,
    Sub3 NUMBER,
    Sub4 NUMBER,
    Sub5 NUMBER,
    Total NUMBER,
    Percentage NUMBER(5,2),
    Grade VARCHAR2(3)
);


INSERT INTO Result
VALUES (7870,'John Brown',88,90,78,82,85,NULL,NULL,NULL);

INSERT INTO Result
VALUES (7871,'Peter Parker',87,92,99,82,70,NULL,NULL,NULL);

INSERT INTO Result
VALUES (7872,'Mary Walkers',81,90,85,76,93,NULL,NULL,NULL);

COMMIT;



SET SERVEROUTPUT ON;

-- PL/SQL Block

DECLARE
    v_rollno NUMBER;
    v_sub1 NUMBER;
    v_sub2 NUMBER;
    v_sub3 NUMBER;
    v_sub4 NUMBER;
    v_sub5 NUMBER;
    v_total NUMBER;
    v_percentage NUMBER;
    v_grade VARCHAR2(3);

BEGIN

  
    v_rollno := &Rollno;

    SELECT Sub1, Sub2, Sub3, Sub4, Sub5
    INTO v_sub1, v_sub2, v_sub3, v_sub4, v_sub5
    FROM Result
    WHERE Rollno = v_rollno;

 
    v_total := v_sub1 + v_sub2 + v_sub3 + v_sub4 + v_sub5;


    v_percentage := v_total / 5;

  
    IF v_percentage >= 90 THEN
        v_grade := 'A';

    ELSIF v_percentage >= 80 THEN
        v_grade := 'B';

    ELSIF v_percentage >= 70 THEN
        v_grade := 'C';

    ELSE
        v_grade := 'D';

    END IF;

  
    UPDATE Result
    SET Total = v_total,
        Percentage = v_percentage,
        Grade = v_grade
    WHERE Rollno = v_rollno;

    -- Display result
    DBMS_OUTPUT.PUT_LINE('Total = ' || v_total);
    DBMS_OUTPUT.PUT_LINE('Percentage = ' || v_percentage);
    DBMS_OUTPUT.PUT_LINE('Grade = ' || v_grade);

END;
/