----8) Write a PL/SQL block which displays the gross salary of employees as per user input EID. (Consider an EMP table with EID, EName, Deptno, Deptname Gender, Age, BasicSal) with appropriate data types.) Gross_Salary: BASICSAL + (DA + HRA + Medical)
-- – PF. Rules: HRA = 15% of basic, DA = 50% of basic, Medical = Rs. 500, PF = 10% of basic. 

Create table EMP(
EID NUMBER Primary key,
Name Varchar2(20),
Deptno NUMBER,
Deptname Varchar2(20),
Gender Varchar2(8),
Age NUMBER,
BasicSal NUMBER
);

INSERT INTO EMP VALUES(101, 'John Brown',10,'Finance','Male',25,23000);
INSERT INTO EMP VALUES(102,'Maryan Evans',30,'HR','Female',28,20000);
INSERT INTO EMP VALUES(103,'Philip Martins',40,'IT', 'Male',22,30000);
INSERT INTO EMP VALUES(104,'Peter Jones', 20,'Security','Male',32,15000);
INSERT INTO EMP VALUES(105,'BeatriceDa Watkins',60,'Cheif cook','Female',21,20000);

--PL/SQL BlOCK TO DISPLAY THE GROSS SALARY!

SET SERVEROUTPUT ON;

DECLARE
v_EID NUMBER;
v_BasicSal NUMBER;
v_HRA NUMBER;
v_DA NUMBER;
v_Medical NUMBER;
v_PF NUMBER;
v_Gross_Salary NUMBER;

BEGIN
 v_EID :=&enter_EID;
 
  SELECT BasicSal
  INTO v_BasicSal
  FROM EMP
  WHERE EID = v_EID;
  
 v_HRA := v_BasicSal * 15/100;
 v_DA := v_BasicSal * 50/100;
 v_Medical := 500;
 v_PF := v_BasicSal * 10/100;
 v_Gross_Salary :=  v_BasicSal + (v_DA + v_HRA + v_Medical) - v_PF;
 
 DBMS.OUTPUT.PUT_LINE('Gross Salary:'||v_Gross_Salary);
 
 End;
 /