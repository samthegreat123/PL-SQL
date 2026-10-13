-----1) Write a simple procedure without any parameter 
that shows a user defined message on the screen. Call 
the procedure using a separate PL/SQL block and on 
the command line.---

-- Create the Procedure
CREATE OR REPLACE PROCEDURE show_message AS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Welcome to Oracle PL/SQL Programming!');
END;
/

-- Call using a PL/SQL Block
SET SERVEROUTPUT ON;
BEGIN
    show_message;
END;
/

-- Call on the Command Line (SQL*Plus / SQL Developer)
EXEC show_message;