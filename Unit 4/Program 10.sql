---10) Write a function that returns the balance for a 
given account number. --

-- Ensure ACCOUNT table exists (from previous setup)
CREATE TABLE IF NOT EXISTS account (
    acno NUMBER PRIMARY KEY,
    cname VARCHAR2(50),
    bname VARCHAR2(50),
    balance NUMBER(10, 2)
);

-- Create the Function
CREATE OR REPLACE FUNCTION get_account_balance(p_acno IN NUMBER) 
RETURN NUMBER AS
    v_balance NUMBER(10, 2);
BEGIN
    SELECT balance 
    INTO v_balance
    FROM account
    WHERE acno = p_acno;
    
    RETURN v_balance;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL; -- Return NULL if account does not exist
END;
/

-- Call using a PL/SQL Block
DECLARE
    v_balance NUMBER(10, 2);
    v_target_acno NUMBER := 101;
BEGIN
    v_balance := get_account_balance(v_target_acno);
    
    IF v_balance IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Balance for Account ' || v_target_acno || ': $' || v_balance);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Account number ' || v_target_acno || ' not found.');
    END IF;
END;
/