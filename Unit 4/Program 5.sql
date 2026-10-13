----5) Write a function that returns the balance for a 
given account number. (Create ACCOUNT table with 
ACNO, CNAME, BNAME, BALANCE columns using 
appropriate data types) ---

-- Create ACCOUNT Table
CREATE TABLE account (
    acno NUMBER PRIMARY KEY,
    cname VARCHAR2(50),
    bname VARCHAR2(50),
    balance NUMBER(10, 2)
);

-- Insert sample record (Optional for testing)
INSERT INTO account VALUES (101, 'John Doe', 'Main Branch', 5500.00);
COMMIT;

-- Create Function
CREATE OR REPLACE FUNCTION get_account_balance(p_acno IN NUMBER) 
RETURN NUMBER AS
    v_balance NUMBER(10, 2);
BEGIN
    SELECT balance INTO v_balance
    FROM account
    WHERE acno = p_acno;
    
    RETURN v_balance;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;
/

-- Call using a PL/SQL Block
DECLARE
    v_bal NUMBER(10, 2);
BEGIN
    v_bal := get_account_balance(101);
    IF v_bal IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Account Balance: $' || v_bal);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Account not found.');
    END IF;
END;
/