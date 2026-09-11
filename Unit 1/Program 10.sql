--10) Write a PL/SQL block to delete the record of an 
--employee for a given EID.


BEGIN 

DELETE FROM
EMP 
WHERE EID = 103;

END;
/