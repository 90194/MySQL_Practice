SET SQL_SAFE_UPDATES = 0;
-- 1
INSERT INTO my_emp
VALUES (1 , "Patel" , "Ralph" , "raptel" , 795 ) ;
-- 2
INSERT INTO my_emp(ID , FIRST_NAME , LAST_NAME , USERID , SALARY )
VALUES (2 , "Dancs" , "Betty" , "bdancs" , 860 ) ;
-- 3
INSERT INTO my_emp(ID , FIRST_NAME , LAST_NAME , USERID , SALARY )
VALUES (3, "Bir" , "iBen" , "bbiri" ,1100 ) ,
	  (4, "Newman", "Chad" , "cnewman" , 750 );
-- 4
UPDATE my_emp
SET LAST_NAME = "Drexler"
WHERE  ID = 3 ;
-- 5
UPDATE my_emp
SET SALARY=1000
WHERE  SALARY <=900 ;
-- 6
DELETE FROM my_emp
WHERE ID = 2 ;
-- 7
START TRANSACTION ;
UPDATE my_emp SET SALARY = SALARY*1.1 ;
SAVEPOINT before_delet;
DELETE FROM my_emp ;

ROLLBACK TO  before_delet;
COMMIT;
