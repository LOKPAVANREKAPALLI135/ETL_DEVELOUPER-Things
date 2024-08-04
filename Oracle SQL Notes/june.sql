/*

C:\oraclexe\app\oracle\product\11.2.0\server\network\ADMIN

ORACLE : COMMAND BASED LANG 


SQL : STRUCTURED QUERY LANG 

COMMANDS : 5 TYPE OF LANG

DATA DEFINATION LANG (DDL): CREATE , ALTER , RENAME , TRUNCATE , DROP 

DATA MANIPULATION LANG (DML) :  INSERT , UPDATE , DELETE 

TRANSACTION CONTROL LANG (TCL) : COMMIT (CTRL+S), ROLLBACK (CTRL+Z), SAVEPOINT

DATA RETRIVAL LANG (DRL) : SELECT 

DATA CONTROL LANG (DCL) : GRANT , REVOKE 

CLAUSES : 

FROM 
WHERE 
ORDER BY 
GROUP BY 
HAVING 
SET
ON 


STATEMENT : ITS COLLECTIOIN OF COMMANDS ,CLAUESES AND KEYWORDS 


EX : SELECT * FROM EMP;



PLSQL : 



------------------------------

CREATE USER /SCHEMA IN ORACLE DATABASE : 



SYNTAX : CREATE USER <USERNAME>  IDENTIFIED BY <PASSWORD> ;


CREATE USER BHARAT IDENTIFIED BY BHARAT123 ;


GRANT DBA TO <USERNAME > ;



------------------

INSTALL ORACLE SOFTWARE 

BASIC COMMANDS SQL 

SQL DEVELOPER CONFIGURATION 

CREATED USER 

ADDED USER IN OUR SQL DEVELOPER 



CREATE TABLE : 

INSERT DATA INTO DATA 

SELECT

*/

--*********************************************************************************DAY-2************************************************************************************************************************************************

create user june IDENTIFIED by june;

GRANT dba to june; 

CREATE TABLE EMP(NO NUMBER(5),NAME VARCHAR(10),SALARY NUMBER,ADDR VARCHAR2(10));

-- CREATE TABLE KJKJHJSAJFBHSDFJHASYGFSJBHFSDJHFHJKUUUGFJKDS(NO NUMBER(5),PHONE NUMBER(10));  >> identifier is too long , identifier longer than 30 bytes was specified.

-- CREATE TABLE INSERT (NO NUMBER(5),NAME VARCHAR2(10),PHONE NUMBER(10)); >>  "invalid table name"

CREATE TABLE DEPT(DEPTNO NUMBER(5),DNAME VARCHAR2(10));

SELECT SYSDATE FROM DUAL;

CREATE TABLE FAMILY(FNO NUMBER,NAME VARCHAR2(16),AGE NUMBER,BDATE DATE);

CREATE TABLE BANK_ACCOUNT(
BANK_NAME VARCHAR(15),
ACCOUNT_NUMBER NUMBER(14),
CUSTOMER_NAME VARCHAR2(20),
DONO VARCHAR2(10),
AREA VARCHAR2(20),
CITY VARCHAR(10),
BRANCH_CODE VARCHAR(10)
);

-- INSERT THE DATA INTO EXISTING TABLE

-- IT IS DONE IN TWO WAYS:      I) VALUES METHOD AND II) ADDERSS METHOD

-- USING INSERCTION VALUES METHOD:

INSERT INTO EMP VALUES (1,'VIJAY',500,'HYDERABAD');

INSERT INTO EMP VALUES (6000,'HYDERABAD',2,'RAJA');

INSERT INTO EMP(SAL,addr,no,name) VALUES (6000,'HYDERABAD',2,'RAJA');

INSERT INTO EMP(NO,SAL,NAME,ADDR) VALUES(2,6000,'RAJA','HYD');

INSERT INTO EMP VALUES (3,'SACHIN',7000,'NUM');

INSERT INTO EMP(NO,SAL,addr) VALUES (4,51000,'HYDERABAD');

INSERT INTO EMP(NO,NAME) VALUES (5,'GOA');

INSERT
INTO EMP(NO) VALUES (6);

INSERT INTO EMP VALUES (4000,'US',30,'RAMU');

-- address method: 

--in this type of value inserction in address method we can write this statement once and abel to insert the values for N no of times.

-- here we have to frame a statement by the addressing the table column data variables with the help of "&" which are representing the column names of a created table 

INSERT INTO EMP VALUES (&no,&name,&SAL,&addr);

INSERT INTO EMP VALUES (&no,'&name',&SAL,'&addr');

INSERT INTO EMP VALUES (&no,'&names',&SALry,'&address');  -- here we are providing the referance names for the columns  of a creates table in our database

-- if we try to write other than the column names for our flexibility of the table then it will through the error, 

INSERT INTO EMP VALUES (&no,'&names',&SALry,'&address');

INSERT INTO EMP(no,name,sal,addr) VALUES (&no,'&names',&SALry,'&address'); -- here that we are writing the some referance names here are acts like the column names of the particular table
        --          |
-- now after the table name what ever the table colume names we are writing those column names should be mentioned perfectly in the query statement
-- and the referance names which are given by us are any thing its our optional one

INSERT INTO EMP VALUES(&NAMES,&NO,&SALRY,&ADDRESS); -- it will through an error up, because 

INSERT INTO EMP(NAME,NO,SAL,ADDR) VALUES(&NAMES,&NO,&SALRY,&ADDRESS);

INSERT INTO DEPT VALUES (01,'HR');


--SQL SELECT STATEMENT:> DRL:-;
/*
the main purpose of select is nothing but here we use this sql develouper for to write a select statement 
quary to see the data which we had already created in server read the data and displaying the data sql develouper out put window */

-- now how to read the data from the clint tool to the server tool.     >>>  if we want to read the data from the clint server that we need to send a statement to yiour server and it will try to read the data and display that out put in your sql develouper.
-- to do that process we use process select command for to complete this task shich is DRL COMMAND

-- SELECT STAEMENT: [DRL]

SELECT * FROM emp;

SELECT NO,NAME,ADDR FROM EMP;

SELECT NO, ADDR FROM emp;

ANALYZE TABLE EMP COMPUTE STATISTICS;

SELECT 1 FROM emp WHERE NO IN (2,13,15); 

--realtime topic:-  TABLE BACKUP

CREATE TABLE EMP_BKP AS 
SELECT * FROM emp;

CREATE TABLE EMP_BKP1 AS 
SELECT NO,addr FROM emp;

CREATE TABLE EMP_BKP2 AS 
SELECT * FROM emp WHERE 1=2;            -- GIVES THE STRUCTURE OF A CREATED TABLE WHICH IS STORED IN  DATABASE WITH OUT READING ANY RECORD FROM THE CREATED TABLE 


CREATE TABLE EMP_BKP3 AS 
SELECT * FROM emp WHERE
SAL>5000;


ANALYZE TABLE EMP_BKP COMPUTE STATISTICS;  --{THIS STATEMENT IS USED TO GETTING OF STATISTICS DATA OF A CREATED TABLE}




-- ================================================================= DAY-3 ================================================================================;

--SELECT 

SELECT * FROM emp;

--ORDER BY 

SELECT * FROM EMP ORDER BY SAL DESC;

SELECT * FROM EMP ORDER BY SAL ASC;

SELECT * FROM EMP ORDER BY SAL;

SELECT * FROM EMP ORDER BY SAL DESC, no ASC;

SELECT * FROM EMP ORDER BY SAL DESC, no;

SELECT * FROM EMP ORDER BY SAL, no ASC;

SELECT * FROM EMP ORDER BY SAL DESC, no DESC;

SELECT * FROM EMP ORDER BY SAL, no;

SELECT * FROM EMP ORDER BY NO,SAL DESC;

SELECT * FROM EMP ORDER BY NO DESC,SAL;

SELECT * FROM EMP ORDER BY SAL, NO DESC;

SELECT * FROM EMP ORDER BY NO,SAL DESC;
SELECT * FROM emp ORDER BY SAL,NO;


SELECT * FROM EMP ORDER BY NO DESC,SAL DESC;
/*63
55
 41
32
 24
13
 5000
 5000
 8000
 4000
 7000
3000
*/
-- deac with charecters

SELECT * FROM EMP ORDER BY name DESC;

SELECT * FROM EMP ORDER BY name 
ASC;

SELECT * FROM EMP ORDER BY NO,SAL,name,ADDR;

--WHERE

/*
>> its a DML STSTEMENT WHICH IS NOT A MANDATORY CLAUSES OF SQL DML STSTEMENT AND ALSO USED WITH [SELECT, UPDATE,DELETE].
>> USED TO LIMIT THE NO OF ROWS AFFECTED BY A WRITEN SQL DML STATEMENT WITH THE COMBINATION OF A CONDITION , FILTERS THE RECORDS AND RETURNS ONLY THOSE QUERIES WHICH FULFILL THOSE SPECIFIC CONDITIONS


-- HERE CONDITION IS USED WITH THE COMBINATION OF {column name + operator + value}
*/


SELECT * FROM EMP WHERE SAL>5000;

--                                              OPERATORS
--                                                  |
--  ---------------------------------------------------------------------------------------------------
--  |                               |                               |                                  |
--  COMPARISION                   LOGICAL                       AIRTHAMETIC                         MISLEANOUS    
--[=,!=,>,<,>=,<=,<>]            [AND, OR ]                      [+,-,*,/]                 [IS NULL, NOT, IN, BETWEEN,LIKE]


-- '= OPERATOR'
SELECT * FROM EMP WHERE SAL=5000;

SELECT * FROM EMP WHERE NAME='DIVYA';

SELECT * FROM EMP WHERE NAME='LOKPAVAN';

SELECT * FROM EMP WHERE NAME!='LOKPAVAN';

SELECT * FROM EMP WHERE NAME<>'LOKPAVAN';

SELECT * FROM EMP WHERE SAL<5000;

SELECT * FROM EMP WHERE SAL<=5000;

SELECT * FROM EMP WHERE SAL>5000;

SELECT * FROM EMP WHERE SAL>=5000;

SELECT * FROM EMP WHERE NAME='lokpavan';  -- >> here that oracle is case sensitive while comparing the data of a created table only not for table_name column_name like that.
            |
--It is solved by using upper case function
            |           
--SELECT * FROM EMP WHERE upper(NAME)=upper('LOKpavan');

SELECT * FROM EMP WHERE SAL>=5000 AND SAL<=7000;
                    |
--        ALTERNATIVE OPTION FOR AND OPERATOR IS BETWEEN OPERATOR
                    |
SELECT * FROM EMP WHERE SAL BETWEEN 5000 AND 7000;  -- IT IS USED AS SAL >= AND SAL<= OPERATION;

SELECT * FROM EMP WHERE SAL BETWEEN 5000 AND 3000;      -- NO OUT PUT WILL COME FOR THIS TYPE OF CONDITION BECAUSE 

SELECT * FROM EMP WHERE SAL<=5000 AND SAL>=7000;

SELECT * FROM EMP WHERE SAL NOT BETWEEN 5000 AND 7000;

-- IS NULL , IS NOT NULL  OPERATOR
SELECT * FROM EMP WHERE SAL IS NULL;

SELECT * FROM EMP WHERE SAL IS NOT NULL;

--       LOGICAL OPERATOR [AND, IN]


SELECT * FROM EMP WHERE SAL= 3000 AND SAL=4000;

SELECT * FROM EMP WHERE SAL= 3000 OR SAL=4000;

SELECT * FROM EMP WHERE SAL= 3000 OR SAL=4000 OR SAL=5000 OR SAL=7000 OR SAL=8000;

-- IN OPERATOR

SELECT * FROM EMP WHERE SAL IN (3000,4000,7000);  -- THE ALTERNATIVE OF WRITING MULTIPLE OR OPERATOR IS NOTHING BUT A 'IN' OPERATOR;

-- NOT OPERATOR

SELECT * FROM EMP WHERE SAL NOT IN (3000,4000,7000); --


--LIKE OPERATOR

SELECT * FROM EMP WHERE NAME  LIKE '_O%';

SELECT * FROM EMP WHERE NAME  LIKE 'L%';

SELECT * FROM EMP WHERE NAME  LIKE '_A%';-- SECOND CHARECTER 

SELECT * FROM EMP WHERE NAME  LIKE 'L%';

SELECT * FROM EMP WHERE NAME  LIKE '__K%';-- THIRD CHARECTER

SELECT * FROM EMP WHERE NAME NOT LIKE 'L%'; -- 

SELECT * FROM EMP WHERE NAME  LIKE '%A';  --  LAST CHARECTER

SELECT * FROM EMP WHERE NAME  LIKE '%A_'; -- LAST BUT ONE 


--*************************************************************************************DAY-4*************************************************************************************
/*
                                            --TOPICS:
                                                        I.CONCATINATION FUNCTION 
                                                        II. UPDATE 
                                                        III. TLC --->> COMMENT, ROLLBACK
                                                        IV. PSEDO COLUUMNS 
                                                                >> ROWNUM
                                                                >> ROWID
                                                        V. DELETE, DROP, RENAME, TRUNCATE
*/


--  CONCATINATION FUNCTION;

/*IN CASE OF WRITING THIS INSRET STATEMENT TO INSERT A THOUSENDS OF RECORDS INTO A CREATED TABLE 
HERE WE USE A SQL FUNCTION NAMELY CALLED AS {"CONCATINATION"}.

MANI IT IS CREATED BY USING "MS EXCEL"

SYNTAX:
  =CONCATENATE("INSERT INTO EMP VALUES(",B13,"','",C13,"','","','",D13,"',",E13,",",F13,",",G13,",'",H13,"','",I13,"');")


AND IN OSQLD WE USE IT FOR TO SHOW THE OUTPUT IN THE FORM OF COMBINED FORMATE OF TWO OR MORE TABLES COLUMNS

SYNTAX:

        SELECT COLUMN_NAME1 || COLUMN_NAME2 || COLUMN_NAME3 ||..........COLUMN_NAME N FROM TABLE_NAME;

*/

INSERT INTO EMP VALUES(111,'LOKPAVAN',5000,'HYDERABAD');
INSERT INTO EMP VALUES(222,'RADHA',6000,'HYDERABAD');
INSERT INTO EMP VALUES(333,'PRASANA',8000,'BANGALURU');
INSERT INTO EMP VALUES(444,'MAHESH',4000,'NUZEVEDU');
INSERT INTO EMP VALUES(555,'DIVYA',7000,'USA');
INSERT INTO EMP VALUES(666,'JAI',8000,'USA');


SELECT NAME ||' ' || ADDR  FROM EMP;   -- THIS IS HOW GENERALLY THIS "||" IS ALSO USED FOR CONCATINATION [ADDING] OF TWO OR MORE THAN TWO COLUMNS OF A TABLE.


/*
SELECT * FROM EMP WHERE NAME LIKE '___ESH%';

SELECT * FROM EMP WHERE SAL=7000 AND NAME='RAM';

SELECT * FROM EMP WHERE SAL=7000 AND NO IN();

SELECT * FROM EMP WHERE NO=6;
 
SELECT * FROM EMP WHERE NO IN (6,0);

SELECT * FROM EMP;

SELECT * FROM EMP WHERE NO=5 OR NO=1;

SELECT * FROM EMP WHERE NO=5 AND NO=1;

SELECT * FROM EMP WHERE NAME LIKE'L%';

SELECT * FROM EMP WHERE NAME='LOKPAVAN';

SELECT * FROM EMP WHERE NAME='LOKPAVAN' AND NAME LIKE'L%' AND NAME LIKE '%A_' AND SAL = 5000 AND NO<=1 AND ADDR LIKE 'H%';

*/


--UPDATE: ITS A DML STATEMENT

    -- syntax:
                --UPDATE <TABLE_NAME> SET [COLUMN_NAME1,.....,COLUME_NAME N]WHERE[CONDITON];


UPDATE EMP SET SAL=6000;

ROLLBACK;

UPDATE EMP SET SAL=6000 WHERE NAME='JAI';

SELECT * FROM EMP;

--[TLC] >> TRANSACTION LANGUAGE COMMANDS{COMMIT,ROLLBACK}

COMMIT;


INSERT INTO EMP VALUES(111,'LOKPAVAN',5000,'HYDERABAD');

COMMIT;

INSERT INTO EMP VALUES(222,'RADHA',6000,'HYDERABAD');

INSERT INTO EMP VALUES(333,'PRASANA',8000,'BANGALURU');


ROLLBACK;

SELECT * FROM EMP;

--PSEDO COLUUMNS:

SELECT * FROM EMP;

SELECT NO,NAME,SAL,ADDR,ROWNUM FROM EMP;
SELECT NO,NAME,SALARY,ROWNUM FROM EMP;
    --ROWNUM;
SELECT NO,NAME,SAL,ADDR,ROWNUM FROM EMP WHERE SAL >5000;

SELECT NO,NAME,SAL,ADDR,ROWNUM FROM EMP WHERE ROWNUM=3;

SELECT NO,NAME,SAL,ADDR,ROWNUM FROM EMP WHERE ROWNUM IN (7,8);

SELECT NO,NAME,SAL,ADDR,ROWNUM FROM EMP WHERE ROWNUM=1;

COMMIT;

SELECT NO,NAME,SAL,ADDR,ROWNUM FROM EMP WHERE ROWNUM IN (1,2,3);

SELECT NO,NAME,SAL,ADDR,ROWNUM FROM EMP WHERE ROWNUM<3;

--ROWID;
 /* ITS A PERMANENT VALUE WHILE INSERTING RECORD INTO DATA BASE
 
 IT WILL GENERATE 16 DIGIT ALPHA NUMERIC VALUE
*/
SELECT NO,NAME,SAL,ADDR,ROWNUM,ROWID FROM EMP;

SELECT NO,NAME,SAL,ADDR,ROWNUM,ROWID FROM EMP WHERE ROWID='AAAFYuAABAAALLxAAB';

SELECT NO,NAME,SAL,ADDR,ROWNUM,ROWID FROM EMP WHERE ROWID LIKE'%K';

UPDATE EMP SET SAL=7000 WHERE ROWID='AAAFYuAABAAALLxAAH';

COMMIT;

UPDATE EMP SET NO=8 WHERE SAL=100000;

UPDATE EMP SET NO=8 WHERE SAL=7000;

ROLLBACK;

UPDATE EMP SET ADDR='JAMMU' WHERE ROWID='AAAFYuAABAAALLxAAH';

SELECT * FROM EMP;

COMMIT;

-- delete
-------------

/* ITS A DML STATEMENT --DELETE FROM <TABLE_NAME> [WHERE(CONDITION)];
*/

DELETE FROM EMP;

--COMPLETLY DELETE THE TABLE DATA:

ROLLBACK;

DELETE FROM EMP WHERE ADDR='INDIA' AND SAL=7000;


--TRUNCATE:    
/* 
> DDL{DELETE COMMAND WHICH IS USED TO DELETE COMPLETE DATA}

also we can delete specific record of the perticular table 

        >commit command is not required and we can not use a WHERE CLAUSE .
        
        SYNTAX:
                TRUNCATE TABLE <TABLE_NAME>;
                
                */
                
SELECT * FROM EMP;

TRUNCATE TABLE EMP;

--ROLLBACK; ALSO WONT WORK HERE
-- ------------------------------------------------------------------------------------


--DROP:

/* 
IT IS A DDL COMMAND

USED TO DROP TABLE FROM DATABASE ALONG WITH DATA.

HERE WE CAN NOT USE ROLLBACK COMMAND ALSO.
*/


CREATE TABLE EMPCOPY
AS SELECT * FROM EMP;

DESCRIBE EMPCOPY;

CREATE TABLE EMP(NO NUMBER(5),NAME VARCHAR2(10),SAL NUMBER,ADDR VARCHAR2(10));

DROP TABLE EMP;


SELECT * FROM EMP;

SELECT * FROM EMPCOPY;

CREATE TABLE EMP AS SELECT * FROM EMPCOPY;

DELETE FROM EMP WHERE SAL>5000;

ROLLBACK;

TRUNCATE TABLE EMP WHERE ;

ROLLBACK;



-- ------------------------------------------------------------------------------------------------------------------------------

--RENAME:

SELECT* FROM EMP;

RENAME EMP TO EMPLOYEE;

ROLLBACK; -- TI WONT WORK

RENAME EMPLOYEE TO EMP;

SELECT* FROM EMPLOYEE;


-- ========================================================================= DAY-5 ==============================================================
/*
                                                                TOPICS:
                                                                        1. ALTER        2.GRANT
                                                                        3. REVOKE       4.CONSTRANTS
                                                                        5. FUNCTIONS    6. NORMALIZATION
*/

-- ALTER:   [ADDING A COLUMN,RENAME A COLUMN,MODIFY A COLUMN,DELETE A COLUMN]  it is a DDL 

--syntax: ALTER TABLE <TABLE_NAME> <ADD,MODIFY,DROP,RENAME> [COLUMN] COLUMN_NAME1 DATATYPE[SIZE],......,COLUMN_NAME N DATATYPE[SIZE];
SELECT * FROM EMP;

SELECT * FROM EMPCOPY;

CREATE TABLE EMP AS SELECT * FROM EMPCOPY;

DESCRIBE EMP;


-- ADDING A COLUMN TO EMP TABLE;

ALTER TABLE EMP ADD DNO NUMBER;   --    >> {Table EMP altered.}


UPDATE EMP SET DNO = 20;    -->> 8 rows updated.

UPDATE EMP SET DNO = 20 WHERE NAME IN ('LOKPAVAN','DIVYA','RADHA');

UPDATE EMP SET DNO = 20 WHERE NO = 1;

SELECT NAME || DNO FROM EMP;

-- RENAME A COLUMN NAME TO EMP TABLE;

ALTER TABLE EMP RENAME COLUMN SAL TO SALARY;


-- MODIFY A COLUMN IN EMP TABLE;

ALTER TABLE EMP MODIFY NAME VARCHAR2(20);

ALTER TABLE EMP MODIFY NAME VARCHAR2(2);        -->> "cannot decrease column length because some value is too big"

UPDATE EMP  SET DNO=20;

UPDATE EMP  SET DNO=NULL WHERE NO IN (6,8,9);

ALTER TABLE EMP MODIFY DNO NUMBER(10);

COMMIT;

ALTER TABLE EMP MODIFY NAME VARCHAR(20); -- IT WONT GET CHANGE BECAUSE IF THE COLUMN IS EMPTY ONLY THEN THIS ALTER MODIFY DATA TYPE OF A COLUMN WILL BE DONE 

ALTER TABLE EMP MODIFY NAME VARCHAR(60); 

ALTER TABLE EMP MODIFY DNO VARCHAR2(60); 

DESCRIBE EMP;
ALTER TABLE EMP MODIFY NAME VARCHAR2(20),ADDR VARCHAR2(20);


-- DELETE A COLUMN NAME TO EMP TABLE;

ALTER TABLE EMP DROP COLUMN DNO;

SELECT * FROM TAB;

SELECT * FROM ALL_TAB_COLUMNS WHERE OWNER ='JUNE' AND COLUMN_NAME IN ('NO','NAME','SALARY','ADDR');

..........................................................................................................
-- DCL: [GRANT, REVOKE]

GRANT SELECT,INSERT,UPDATE,DELETE ON EMP TO DWH;  --Grant succeeded.

GRANT ALL ON EMP TO DWH;  --Grant succeeded.

REVOKE INSERT,UPDATE,DELETE ON EMP FROM DWH;

REVOKE ALL ON EMP FROM DWH;

..................................................................................................


--CONSTRANTS:
/* USED TO CREATE THE RULES ON TOP OF THE CREATED TABLE TO RESTICT THE INSERTION OF INCOMPLETE & REPETED DATA

TYPES:

    NOT NULL
    UNIQUE
    PRIMARY KEY
    COMPOSIT KEY
    FORIGEN KEY
    CHECK 
    
    NOTE:
SELECT 'LOK','PAVAN' FROM DUAL;
SELECT * FROM EMP WHERE SOUNDEX(NAME)=SOUNDEX('PRAKASH');
SELECT * FROM EMP WHERE SOUNDEX(NAME)=SOUNDEX('PRAKSH');
SELECT * FROM EMP WHERE SOUNDEX(NAME)=SOUNDEX('PRKSH');
SELECT * FROM EMP WHERE SOUNDEX(NAME)=SOUNDEX('PRASH');
SELECT * FROM EMP;
SELECT * FROM EMP WHERE SOUNDEX(NAME)=SOUNDEX('RM');
SELECT * FROM EMP WHERE SOUNDEX(NAME)=SOUNDEX('DIVA');
SELECT * FROM EMP WHERE SOUNDEX(NAME)=SOUNDEX('DIYA');
SELECT * FROM EMP WHERE SOUNDEX(NAME)=SOUNDEX('DI');
SELECT * FROM EMP WHERE SOUNDEX(NAME)=SOUNDEX('jI');
SELECT * FROM EMP WHERE SOUNDEX(NAME)=SOUNDEX('jA');
SELECT * FROM EMP
SELECT * FROM EMP WHERE SOUNDEX(NAME)=SOUNDEX('LOKPAWAN');
SELECT * FROM EMP WHERE SOUNDEX(NAME)=SOUNDEX('LOKPVAN');
SELECT * FROM EMP WHERE SOUNDEX(NAME)=SOUNDEX('LOKPAVAN');
SELECT * FROM EMP WHERE SOUNDEX(NAME)=SOUNDEX('LOKP');
SELECT * FROM EMP WHERE SOUNDEX(NAME)=SOUNDEX('LOK');
SELECT * FROM EMP WHERE SOUNDEX(NAME)=SOUNDEX('LO');
SELECT * FROM EMP WHERE SALARY=(SELECT MAX(SALARY) FROM EMP);
SELECT MAX(ABS(SALARY)) FROM EMP;
SELECT * FROM ALL_USERS;
/*

C:\oraclexe\app\oracle\product\11.2.0\server\network\ADMIN

ORACLE : COMMAND BASED LANG 


SQL : STRUCTURED QUERY LANG 

COMMANDS : 5 TYPE OF LANG

DATA DEFINATION LANG (DDL): CREATE , ALTER , RENAME , TRUNCATE , DROP 

DATA MANIPULATION LANG (DML) :  INSERT , UPDATE , DELETE 

TRANSACTION CONTROL LANG (TCL) : COMMIT (CTRL+S), ROLLBACK (CTRL+Z), SAVEPOINT

DATA RETRIVAL LANG (DRL) : SELECT 

DATA CONTROL LANG (DCL) : GRANT , REVOKE 

CLAUSES : 

FROM 
WHERE 
ORDER BY 
GROUP BY 
HAVING 
SET
ON 


STATEMENT : ITS COLLECTIOIN OF COMMANDS ,CLAUESES AND KEYWORDS 


EX : SELECT * FROM EMP;



PLSQL : 
------------------------------

CREATE USER /SCHEMA IN ORACLE DATABASE : 



SYNTAX : CREATE USER <USERNAME>  IDENTIFIED BY <PASSWORD> ;


CREATE USER BHARAT IDENTIFIED BY BHARAT123 ;


GRANT DBA TO <USERNAME > ;

--------------------------------------------------------------------------------

INSTALL ORACLE SOFTWARE 

BASIC COMMANDS SQL 

SQL DEVELOPER CONFIGURATION 

CREATED USER 

ADDED USER IN OUR SQL DEVELOPER 



CREATE TABLE : 

INSERT DATA INTO DATA 

SELECT

*/


create user june IDENTIFIED by june;

GRANT dba to june; 

CREATE TABLE EMP(NO NUMBER(5),NAME VARCHAR(10),SAL NUMBER,ADDR VARCHAR2(10));

-- CREATE TABLE KJKJHJSAJFBHSDFJHASYGFSJBHFSDJHFHJKUUUGFJKDS(NO NUMBER(5),PHONE NUMBER(10));  >> identifier is too long , identifier longer than 30 bytes was specified.

-- CREATE TABLE INSERT (NO NUMBER(5),NAME VARCHAR2(10),PHONE NUMBER(10)); >>  "invalid table name"

CREATE TABLE DEPT(DEPTNO NUMBER(5),DNAME VARCHAR2(10));

SELECT SYSDATE FROM DUAL;

CREATE TABLE FAMILY(FNO NUMBER,NAME VARCHAR2(16),AGE NUMBER,BDATE DATE);

CREATE TABLE BANK_ACCOUNT(
BANK_NAME VARCHAR(15),
ACCOUNT_NUMBER NUMBER(14),
CUSTOMER_NAME VARCHAR2(20),
DONO VARCHAR2(10),
AREA VARCHAR2(20),
CITY VARCHAR(10),
BRANCH_CODE VARCHAR(10)
);

-- INSERT THE DATA INTO EXISTING TABLE

-- IT IS DONE IN TWO WAYS:      I) VALUES METHOD AND II) ADDERSS METHOD

-- USING INSERCTION VALUES METHOD:

INSERT INTO EMP VALUES (1,'VIJAY',500,'HYDERABAD');

INSERT INTO EMP VALUES (6000,'HYDERABAD',2,'RAJA');

INSERT INTO EMP(SAL,addr,no,name) VALUES (6000,'HYDERABAD',2,'RAJA');

INSERT INTO EMP(NO,SAL,NAME,ADDR) VALUES(2,6000,'RAJA','HYD');

INSERT INTO EMP VALUES (3,'SACHIN',7000,'NUM');

INSERT INTO EMP(NO,SAL,addr) VALUES (4,51000,'HYDERABAD');

INSERT INTO EMP(NO,NAME) VALUES (5,'GOA');

INSERT
INTO EMP(NO) VALUES (6);

INSERT INTO EMP VALUES (4000,'US',30,'RAMU');

-- address method: 

-- in this type of value inserction in address method we can write this statement once and abel to insert the values for N no of times.

-- here we have to frame a statement by the addressing the table column data variables with the help of "&" which are representing the column names of a created table 

INSERT INTO EMP VALUES (&no,&name,&SAL,&addr);

INSERT INTO EMP VALUES (&no,'&name',&SAL,'&addr');

INSERT INTO EMP VALUES (&no,'&names',&SALry,'&address');  -- here we are providing the referance names for the columns  of a creates table in our database

-- if we try to write other than the column names for our flexibility of the table then it will through the error, 

INSERT INTO EMP VALUES (&no,'&names',&SALry,'&address');

INSERT INTO EMP(no,name,sal,addr) VALUES (&no,'&names',&SALry,'&address'); -- here that we are writing the some referance names here are acts like the column names of the particular table
        --          |
-- now after the table name what ever the table colume names we are writing those column names should be mentioned perfectly in the query statement
-- and the referance names which are given by us are any thing its our optional one

INSERT INTO EMP VALUES(&NAMES,&NO,&SALRY,&ADDRESS); -- it will through an error up, because 

INSERT INTO EMP(NAME,NO,SAL,ADDR) VALUES(&NAMES,&NO,&SALRY,&ADDRESS);

INSERT INTO DEPT VALUES (01,'HR');


--SQL SELECT STATEMENT:> DRL:-;
/*
the main purpose of select is nothing but here we use this sql develouper for to write a select statement 
quary to see the data which we had already created in server read the data and displaying the data sql develouper out put window */

-- now how to read the data from the clint tool to the server tool.     >>>  if we want to read the data from the clint server that we need to send a statement to yiour server and it will try to read the data and display that out put in your sql develouper.
-- to do that process we use process select command for to complete this task shich is DRL COMMAND

-- SELECT STAEMENT: [DRL]

SELECT * FROM emp;

SELECT NO,NAME,ADDR FROM EMP;

SELECT NO, ADDR FROM emp;

ANALYZE TABLE EMP COMPUTE STATISTICS;

SELECT 1 FROM emp WHERE NO IN (2,13,15); 

--realtime topic:-  TABLE BACKUP

CREATE TABLE EMP_BKP AS 
SELECT * FROM emp;

CREATE TABLE EMP_BKP1 AS 
SELECT NO,addr FROM emp;

CREATE TABLE EMP_BKP2 AS 
SELECT * FROM emp WHERE 1=2;            -- GIVES THE STRUCTURE OF A CREATED TABLE WHICH IS STORED IN  DATABASE WITH OUT READING ANY RECORD FROM THE CREATED TABLE 


CREATE TABLE EMP_BKP3 AS 
SELECT * FROM emp WHERE
SAL>5000;


ANALYZE TABLE EMP_BKP COMPUTE STATISTICS;  --{THIS STATEMENT IS USED TO GETTING OF STATISTICS DATA OF A CREATED TABLE}




-- ================================================================= DAY -3 ================================================================================;

--SELECT 

SELECT * FROM emp;


--ORDER BY 

SELECT * FROM EMP ORDER BY SAL DESC;

SELECT * FROM EMP ORDER BY SAL ASC;

SELECT * FROM EMP ORDER BY SAL;

SELECT * FROM EMP ORDER BY SAL DESC, no ASC;

SELECT * FROM EMP ORDER BY SAL DESC, no;

SELECT * FROM EMP ORDER BY SAL, no ASC;

SELECT * FROM EMP ORDER BY SAL DESC, no DESC;

SELECT * FROM EMP ORDER BY SAL, no;

SELECT * FROM EMP ORDER BY NO,SAL DESC;

SELECT * FROM EMP ORDER BY NO DESC,SAL;

SELECT * FROM EMP ORDER BY SAL, NO DESC;

SELECT * FROM EMP ORDER BY NO,SAL DESC;
SELECT * FROM emp ORDER BY SAL,NO;


SELECT * FROM EMP ORDER BY NO DESC,SAL DESC;
/*63
55
 41
32
 24
13
 5000
 5000
 8000
 4000
 7000
3000
*/
-- deac with charecters

SELECT * FROM EMP ORDER BY name DESC;

SELECT * FROM EMP ORDER BY name 
ASC;

SELECT * FROM EMP ORDER BY NO,SAL,name,ADDR;

--WHERE

/*
>> its a DML STSTEMENT WHICH IS NOT A MANDATORY CLAUSES OF SQL DML STSTEMENT AND ALSO USED WITH [SELECT, UPDATE,DELETE].
>> USED TO LIMIT THE NO OF ROWS AFFECTED BY A WRITEN SQL DML STATEMENT WITH THE COMBINATION OF A CONDITION , FILTERS THE RECORDS AND RETURNS ONLY THOSE QUERIES WHICH FULFILL THOSE SPECIFIC CONDITIONS


-- HERE CONDITION IS USED WITH THE COMBINATION OF {column name + operator + value}
*/


SELECT * FROM EMP WHERE SAL>5000;

--                                              OPERATORS
--                                                  |
--  ---------------------------------------------------------------------------------------------------
--  |                               |                               |                                  |
--  COMPARISION                   LOGICAL                       AIRTHAMETIC                         MISLEANOUS    
--[=,!=,>,<,>=,<=,<>]            [AND, OR ]                      [+,-,*,/]                 [IS NULL, NOT, IN, BETWEEN,LIKE]


-- '= OPERATOR'
SELECT * FROM EMP WHERE SAL=5000;

SELECT * FROM EMP WHERE NAME='DIVYA';

SELECT * FROM EMP WHERE NAME='LOKPAVAN';

SELECT * FROM EMP WHERE NAME!='LOKPAVAN';

SELECT * FROM EMP WHERE NAME<>'LOKPAVAN';

SELECT * FROM EMP WHERE SAL<5000;

SELECT * FROM EMP WHERE SAL<=5000;

SELECT * FROM EMP WHERE SAL>5000;

SELECT * FROM EMP WHERE SAL>=5000;

SELECT * FROM EMP WHERE NAME='lokpavan';  -- >> here that oracle is case sensitive while comparing the data of a created table only not for table_name column_name like that.
            |
--It is solved by using upper case function
            |           
--SELECT * FROM EMP WHERE upper(NAME)=upper('LOKpavan');

SELECT * FROM EMP WHERE SAL>=5000 AND SAL<=7000;
                    |
--        ALTERNATIVE OPTION FOR AND OPERATOR IS BETWEEN OPERATOR
                    |
SELECT * FROM EMP WHERE SAL BETWEEN 5000 AND 7000;  -- IT IS USED AS SAL >= AND SAL<= OPERATION;

SELECT * FROM EMP WHERE SAL BETWEEN 5000 AND 3000;      -- NO OUT PUT WILL COME FOR THIS TYPE OF CONDITION BECAUSE 

SELECT * FROM EMP WHERE SAL<=5000 AND SAL>=7000;

SELECT * FROM EMP WHERE SAL NOT BETWEEN 5000 AND 7000;

-- IS NULL , IS NOT NULL  OPERATOR
SELECT * FROM EMP WHERE SAL IS NULL;

SELECT * FROM EMP WHERE SAL IS NOT NULL;

--       LOGICAL OPERATOR [AND, IN]


SELECT * FROM EMP WHERE SAL= 3000 AND SAL=4000;

SELECT * FROM EMP WHERE SAL= 3000 OR SAL=4000;

SELECT * FROM EMP WHERE SAL= 3000 OR SAL=4000 OR SAL=5000 OR SAL=7000 OR SAL=8000;

-- IN OPERATOR

SELECT * FROM EMP WHERE SAL IN (3000,4000,7000);  -- THE ALTERNATIVE OF WRITING MULTIPLE OR OPERATOR IS NOTHING BUT A 'IN' OPERATOR;

-- NOT OPERATOR

SELECT * FROM EMP WHERE SAL NOT IN (3000,4000,7000); --


--LIKE OPERATOR

SELECT * FROM EMP WHERE NAME  LIKE '_O%';

SELECT * FROM EMP WHERE NAME  LIKE 'L%';

SELECT * FROM EMP WHERE NAME  LIKE '_A%';-- SECOND CHARECTER 

SELECT * FROM EMP WHERE NAME  LIKE 'L%';

SELECT * FROM EMP WHERE NAME  LIKE '__K%';-- THIRD CHARECTER

SELECT * FROM EMP WHERE NAME NOT LIKE 'L%'; -- 

SELECT * FROM EMP WHERE NAME  LIKE '%A';  --  LAST CHARECTER

SELECT * FROM EMP WHERE NAME  LIKE '%A_'; -- LAST BUT ONE 


--*************************************************************************************DAY-4*************************************************************************************
/*
                                            --TOPICS:
                                                        I.CONCATINATION FUNCTION 
                                                        II. UPDATE 
                                                        III. TLC --->> COMMENT, ROLLBACK
                                                        IV. PSEDO COLUUMNS 
                                                                >> ROWNUM
                                                                >> ROWID
                                                        V. DELETE, DROP, RENAME, TRUNCATE
*/


--  CONCATINATION FUNCTION;

/*IN CASE OF WRITING THIS INSRET STATEMENT TO INSERT A THOUSENDS OF RECORDS INTO A CREATED TABLE 
HERE WE USE A SQL FUNCTION NAMELY CALLED AS {"CONCATINATION"}.

MANI IT IS CREATED BY USING "MS EXCEL"

SYNTAX:
  =CONCATENATE("INSERT INTO EMP VALUES(",B13,"','",C13,"','","','",D13,"',",E13,",",F13,",",G13,",'",H13,"','",I13,"');")


AND IN OSQLD WE USE IT FOR TO SHOW THE OUTPUT IN THE FORM OF COMBINED FORMATE OF TWO OR MORE TABLES COLUMNS

SYNTAX:

        SELECT COLUMN_NAME1 || COLUMN_NAME2 || COLUMN_NAME3 ||..........COLUMN_NAME N FROM TABLE_NAME;

*/

INSERT INTO EMP VALUES(111,'LOKPAVAN',5000,'HYDERABAD');
INSERT INTO EMP VALUES(222,'RADHA',6000,'HYDERABAD');
INSERT INTO EMP VALUES(333,'PRASANA',8000,'BANGALURU');
INSERT INTO EMP VALUES(444,'MAHESH',4000,'NUZEVEDU');
INSERT INTO EMP VALUES(555,'DIVYA',7000,'USA');
INSERT INTO EMP VALUES(666,'JAI',8000,'USA');


SELECT NAME ||' ' || ADDR  FROM EMP;   -- THIS IS HOW GENERALLY THIS "||" IS ALSO USED FOR CONCATINATION [ADDING] OF TWO OR MORE THAN TWO COLUMNS OF A TABLE.


/*
SELECT * FROM EMP WHERE NAME LIKE '___ESH%';

SELECT * FROM EMP WHERE SAL=7000 AND NAME='RAM';

SELECT * FROM EMP WHERE SAL=7000 AND NO IN();

SELECT * FROM EMP WHERE NO=6;
 
SELECT * FROM EMP WHERE NO IN (6,0);

SELECT * FROM EMP;

SELECT * FROM EMP WHERE NO=5 OR NO=1;

SELECT * FROM EMP WHERE NO=5 AND NO=1;

SELECT * FROM EMP WHERE NAME LIKE'L%';

SELECT * FROM EMP WHERE NAME='LOKPAVAN';

SELECT * FROM EMP WHERE NAME='LOKPAVAN' AND NAME LIKE'L%' AND NAME LIKE '%A_' AND SAL = 5000 AND NO<=1 AND ADDR LIKE 'H%';

*/


--UPDATE: ITS A DML STATEMENT

    -- syntax:
                --UPDATE <TABLE_NAME> SET [COLUMN_NAME1,.....,COLUME_NAME N]WHERE[CONDITON];


UPDATE EMP SET SAL=6000;

ROLLBACK;

UPDATE EMP SET SAL=6000 WHERE NAME='JAI';

SELECT * FROM EMP;

--[TLC] >> TRANSACTION LANGUAGE COMMANDS{COMMIT,ROLLBACK}

COMMIT;


INSERT INTO EMP VALUES(111,'LOKPAVAN',5000,'HYDERABAD');

COMMIT;

INSERT INTO EMP VALUES(222,'RADHA',6000,'HYDERABAD');

INSERT INTO EMP VALUES(333,'PRASANA',8000,'BANGALURU');


ROLLBACK;

SELECT * FROM EMP;

--PSEDO COLUUMNS:

SELECT * FROM EMP;

SELECT NO,NAME,SAL,ADDR,ROWNUM FROM EMP;
    --ROWNUM;
SELECT NO,NAME,SAL,ADDR,ROWNUM FROM EMP WHERE SAL >5000;

SELECT NO,NAME,SAL,ADDR,ROWNUM FROM EMP WHERE ROWNUM=3;

SELECT NO,NAME,SAL,ADDR,ROWNUM FROM EMP WHERE ROWNUM IN (7,8);

SELECT NO,NAME,SAL,ADDR,ROWNUM FROM EMP WHERE ROWNUM=1;

COMMIT;

SELECT NO,NAME,SAL,ADDR,ROWNUM FROM EMP WHERE ROWNUM IN (1,2,3);

SELECT NO,NAME,SAL,ADDR,ROWNUM FROM EMP WHERE ROWNUM<3;

--ROWID;
 /* ITS A PERMANENT VALUE WHILE INSERTING RECORD INTO DATA BASE
 
 IT WILL GENERATE 16 DIGIT ALPHA NUMERIC VALUE
*/
SELECT NO,NAME,SAL,ADDR,ROWNUM,ROWID FROM EMP;

SELECT NO,NAME,SAL,ADDR,ROWNUM,ROWID FROM EMP WHERE ROWID='AAAFYuAABAAALLxAAB';

SELECT NO,NAME,SAL,ADDR,ROWNUM,ROWID FROM EMP WHERE ROWID LIKE'%K';

UPDATE EMP SET SAL=7000 WHERE ROWID='AAAFYuAABAAALLxAAH';

COMMIT;

UPDATE EMP SET NO=8 WHERE SAL=100000;

UPDATE EMP SET NO=8 WHERE SAL=7000;

ROLLBACK;

UPDATE EMP SET ADDR='JAMMU' WHERE ROWID='AAAFYuAABAAALLxAAH';

SELECT * FROM EMP;

COMMIT;

-- delete

/* ITS A DML STATEMENT --DELETE FROM <TABLE_NAME> [WHERE(CONDITION)];
*/

DELETE FROM EMP;

--COMPLETLY DELETE THE TABLE DATA:

ROLLBACK;

DELETE FROM EMP WHERE ADDR='INDIA' AND SAL=7000;


--TRUNCATE:    
/* 
> DDL{DELETE COMMAND WHICH IS USED TO DELETE COMPLETE DATA}

also we can delete specific record of the perticular table 

        >commit command is not required and we can not use a WHERE CLAUSE .
        
        SYNTAX:
                TRUNCATE TABLE <TABLE_NAME>;
                
                */
                
SELECT * FROM EMP;

TRUNCATE TABLE EMP;

--ROLLBACK; ALSO WONT WORK HERE
-- ------------------------------------------------------------------------------------


--DROP:

/* 
IT IS A DDL COMMAND

USED TO DROP TABLE FROM DATABASE ALONG WITH DATA.

HERE WE CAN NOT USE ROLLBACK COMMAND ALSO.
*/


CREATE TABLE EMPCOPY
AS SELECT * FROM EMP;

DESCRIBE EMPCOPY;

CREATE TABLE EMP(NO NUMBER(5),NAME VARCHAR2(10),SAL NUMBER,ADDR VARCHAR2(10));

DROP TABLE EMP;


SELECT * FROM EMP;

SELECT * FROM EMPCOPY;

CREATE TABLE EMP AS SELECT * FROM EMPCOPY;

DELETE FROM EMP WHERE SAL>5000;

ROLLBACK;

TRUNCATE TABLE EMP WHERE ;

ROLLBACK;



-- ------------------------------------------------------------------------------------------------------------------------------

--RENAME:

SELECT* FROM EMP;

RENAME EMP TO EMPLOYEE;

ROLLBACK; -- TI WONT WORK

RENAME EMPLOYEE TO EMP;

SELECT* FROM EMPLOYEE;


-- ========================================================================= DAY-5 ==============================================================

/*
                                                                TOPICS:
                                                                        1. ALTER        2.GRANT
                                                                        3. REVOKE       4.CONSTRANTS
                                                                        5. FUNCTIONS    6. NORMALIZATION
*/

-- ALTER:  it is a DDL 

--syntax: ALTER TABLE <TABLE_NAME> <ADD,MODIFY,DROP,RENAME> [COLUMN] COLUMN_NAME1 DATATYPE[SIZE],......,COLUMN_NAME N DATATYPE[SIZE];

SELECT * FROM EMP;

SELECT * FROM EMPCOPY;

CREATE TABLE EMP AS SELECT * FROM EMPCOPY;

DESCRIBE EMP;


-- ADDING A COLUMN TO EMP TABLE;

ALTER TABLE EMP ADD DNO NUMBER;   --    >> {Table EMP altered.}


UPDATE EMP SET DNO = 20;    -->> 8 rows updated.

UPDATE EMP SET DNO = 20 WHERE NAME IN ('LOKPAVAN','DIVYA','RADHA');

UPDATE EMP SET DNO = 20 WHERE NO = 1;

SELECT NAME || DNO FROM EMP;

-- RENAME A COLUMN NAME TO EMP TABLE;

ALTER TABLE EMP RENAME COLUMN SAL TO SALARY;


-- MODIFY A COLUMN IN EMP TABLE;

ALTER TABLE EMP MODIFY NAME VARCHAR2(20);

ALTER TABLE EMP MODIFY NAME VARCHAR2(2);        -->> "cannot decrease column length because some value is too big"

UPDATE EMP  SET DNO=20;

UPDATE EMP  SET DNO=NULL WHERE NO IN (6,8,9);

ALTER TABLE EMP MODIFY DNO NUMBER(10);

COMMIT;

ALTER TABLE EMP MODIFY NAME VARCHAR(20); -- IT WONT GET CHANGE BECAUSE IF THE COLUMN IS EMPTY ONLY THEN THIS ALTER MODIFY DATA TYPE OF A COLUMN WILL BE DONE 

ALTER TABLE EMP MODIFY NAME VARCHAR(60); 

ALTER TABLE EMP MODIFY DNO VARCHAR2(60); 

DESCRIBE EMP;
ALTER TABLE EMP MODIFY NAME VARCHAR2(20),ADDR VARCHAR2(20);


-- DELETE A COLUMN NAME TO EMP TABLE;

ALTER TABLE EMP DROP COLUMN DNO;

SELECT * FROM TAB;

SELECT * FROM ALL_TAB_COLUMNS WHERE OWNER ='JUNE' AND COLUMN_NAME IN ('NO','NAME','SALARY','ADDR');

-- DCL: [GRANT, REVOKE]

GRANT SELECT,INSERT,UPDATE,DELETE ON EMP TO DWH;  --Grant succeeded.

GRANT ALL ON EMP TO DWH;  --Grant succeeded.

REVOKE INSERT,UPDATE,DELETE ON EMP FROM DWH;

REVOKE ALL ON EMP FROM DWH;

--CONSTRANTS:
/* USED TO CREATE THE RULES ON TOP OF THE CREATED TABLE TO RESTICT THE INSERTION OF INCOMPLETE & REPETED DATA

TYPES:

    NOT NULL
    UNIQUE
    PRIMARY KEY
    COMPOSIT KEY
    FORIGEN KEY
    CHECK 
    
    NOTE:
        THESE CONSTRANTS ARE GENERELLY DECIDED BY ARCHETECTS 
        
WE CAN ADD CONSTRANTS TO TABLE IN THREE WAYS
                                |
                                |
    --------------------------------------------------------------------
    |                           |                                      |
    |                           |                                      |  
TABLE LEVEL               COLUMN LEVEL                            ALTER LEVEL



-- NOT NULL:    >> it is a "column level" constrant 
                    USED TO not allows null values into the particular columns of a created table.
                    it is implemented during the creation of table IN DATABASE.
                    WE can add a NOT NULL TO A column is not possible in ALTER LEVEL POSSINLE only in COLUMN LEVEL
                    
-- UNIQUE:  >> USED WHEN WE CONSIDRED A COLUMN CALUES AS UNIQUE THEN 
               IT WILL NOT ALLOW THE REPEATED VALUES INTO THE COLUMES INTO A CREATING TABLE AND CONTROL THE REPETED VALUES IN THE COLUMN.
               WE CAN ABEL TO DECLARE THIS IN ALL THREE LEVELS [COLUMN,TABLE,ALTER]   
            
-- PRIMARY KEY  >> USED TO NOT ALLOW BOTH REPITED VALUES AND NULL VALUES
                    ITS A COMBINATION OF BOTH NOT NULL AND UNION CONSTRANT
                   HERE IT IS USED ONLY ONCE IN A TABLE (ONE TABLE CAN HAVE ONE PRIMARY KEY)
                    IF WE ARE USING THIS TO A COLUMN OF A TABLE THEN THE VALUES OF THAT COLUMN SHOULD BE HAVE DISTENCT VALUES.

-- COMPOSIT KEY: >> IF WE TRY TO DEFINE A PRIMARY KEY MORE THAN ONE COLUMN THEN THAT IS CALLED AS COMPOSIT KEY
                    THIS WE CAN DEFINE IN BOTH TABLE LEVEL AND ALTER LEVEL BUT NOT POSSIBLE IN COLUMN LEVEL

-- FORIGEN KEY: >>  

-- CHECK:>> WE CAN ALSO DEFINE THIS IN ALL 3 LEVELS.
            UDED TO RESTRICT THE DATA WHICH IS GOING TO PROVIDE IN THE CREATED TABLE BY USING CONDITIONS  
            

*/
SELECT * FROM EMPCONSTRANT;

INSERT INTO EMP VALUES(111,'LOKPAVAN',5000,'HYDERABAD');

--NOT NULL:....................................................................................................................

    -- COLUMN_LEVEL
CREATE TABLE EMPCONSTRANT
(
NO NUMBER NOT NULL,
NAME VARCHAR2(20) NOT NULL,
SALARY NUMBER,
ADDR VARCHAR(20) 
);


    --ALTER_LEVEL:

ALTER TABLE EMPCONSTRANT MODIFY ADDR VARCHAR2(20) NOT NULL;

ALTER TABLE EMPCONSTRANT MODIFY NO NUMBER NULL;


DROP TABLE EMPCONSTRANT;

INSERT INTO EMPCONSTRANT VALUES(1,'LOKPAVAN',5000,'HYDERABAD');
INSERT INTO EMPCONSTRANT VALUES(2,'RADHA',6000,'HYDERABAD');
INSERT INTO EMPCONSTRANT VALUES(3,'PRASANA',8000,'BANGALURU');
INSERT INTO EMPCONSTRANT VALUES(4,'MAHESH',4000,'NUZEVEDU');
INSERT INTO EMPCONSTRANT VALUES(6,'JAI',6000,'HYDERABAD');
INSERT INTO EMPCONSTRANT VALUES(7,'DIVYA',7000,'USA');
INSERT INTO EMPCONSTRANT VALUES(8,'RAM',7000,'INDIA');
INSERT INTO EMPCONSTRANT VALUES(9,'RAM',100000,'INDIA');


INSERT INTO EMPCONSTRANT (NAME,SALARY,ADDR) VALUES('RAM',100000,'INDIA');   -->>  ORA-01400: cannot insert NULL into ("JUNE"."EMPCONSTRANT"."NO")

INSERT INTO EMPCONSTRANT (NO,SALARY,ADDR) VALUES(12,100000,'INDIA');        -->>  ORA-01400: cannot insert NULL into ("JUNE"."EMPCONSTRANT"."NAME")


INSERT INTO EMPCONSTRANT (NO,NAME,ADDR) VALUES(10,'VIJAY','INDIA');
--UNIQUE........................................................................................................................
/*
UNIQUE;
    TABLE LEVEL >> HERE WE ARE JUST PUTING A COMMAND "UNIQUE" AT THE LAST OF MENTIONING OF ALL COLUMN NAME AND ALSO MENTIONING 
                    THE COLUMN NAME FOR WHICH WE ARE PROVIDING THIS UNIQUE CONDITION IN THE CREATING TABLE.
                    
                >> WE CAN ALSO INSERT THIS UNIQUE CONDITION  BY USING "ALTER LEVEL" ALSO
*/

    -- column_level:
CREATE TABLE EMPCONSTRANT_UNIQUE
(
NO NUMBER NOT NULL UNIQUE,
NAME VARCHAR2(20) NOT NULL,
SALARY NUMBER,
ADDR VARCHAR(20)
);


    --table_level declaration of unique constrant:
CREATE TABLE EMPCONSTRANT_UNIQUE
(
NO NUMBER NOT NULL,
NAME VARCHAR2(20) NOT NULL,
SALARY NUMBER,
ADDR VARCHAR(20),
UNIQUE(NO)
);

INSERT INTO EMPCONSTRANT_UNIQUE VALUES(1,'LOKPAVAN',5000,'HYDERABAD');
INSERT INTO EMPCONSTRANT_UNIQUE VALUES(2,'RADHA',6000,'HYDERABAD');
INSERT INTO EMPCONSTRANT_UNIQUE VALUES(3,'PRASANA',8000,'BANGALURU');
INSERT INTO EMPCONSTRANT_UNIQUE VALUES(4,'MAHESH',4000,'NUZEVEDU');
INSERT INTO EMPCONSTRANT_UNIQUE VALUES(6,'JAI',6000,'HYDERABAD');
INSERT INTO EMPCONSTRANT_UNIQUE VALUES(7,'DIVYA',7000,'USA');
INSERT INTO EMPCONSTRANT_UNIQUE VALUES(8,'RAM',7000,'INDIA');
INSERT INTO EMPCONSTRANT_UNIQUE VALUES(9,'RAM',100000,'INDIA');
INSERT INTO EMPCONSTRANT_UNIQUE VALUES(111,'LOKPAVAN',5000,'HYDERABAD');

    --alter_level;
CREATE TABLE EMPCONSTRANT_UNIQUE
(
NO NUMBER NOT NULL,
NAME VARCHAR2(20) NOT NULL,
SALARY NUMBER,
ADDR VARCHAR(20)
);

ALTER TABLE EMP ADD CONSTRAINT UN_NO UNIQUE(NO);

ALTER TABLE EMP DROP CONSTRAINT UN_NO;

--PRIMARY KEY:............................................................................................................................

SELECT * FROM EMPCONSTRANT_PK; 

--COLUME LEVEL:

CREATE TABLE EMPCONSTRANT_PK
(
NO NUMBER PRIMARY KEY,
NAME VARCHAR2(20) NOT NULL,
SALARY NUMBER,
ADDR VARCHAR(20)
);

DESCRIBE EMPCONSTRANT_PK;

ROLLBACK;

DROP TABLE EMPCONSTRANT_PK;

INSERT INTO EMPCONSTRANT_PK VALUES(1,'LOKPAVAN',5000,'HYDERABAD');
INSERT INTO EMPCONSTRANT_PK VALUES(2,'RADHA',6000,'HYDERABAD');
INSERT INTO EMPCONSTRANT_PK VALUES(3,'PRASANA',8000,'BANGALURU');
INSERT INTO EMPCONSTRANT_PK VALUES(4,'MAHESH',4000,'NUZEVEDU');
INSERT INTO EMPCONSTRANT_PK VALUES(6,'JAI',6000,'HYDERABAD');
INSERT INTO EMPCONSTRANT_PK VALUES(7,'DIVYA',7000,'USA');
INSERT INTO EMPCONSTRANT_PK VALUES(8,'RAM',7000,'INDIA');
INSERT INTO EMPCONSTRANT_PK VALUES(9,'RAM',100000,'INDIA');
INSERT INTO EMPCONSTRANT_PK VALUES(111,'LOKPAVAN',5000,'HYDERABAD');

INSERT INTO EMPCONSTRANT_PK VALUES(111,'LOKPAVAN',5000,'HYDERABAD');  -->> RAISE AN ERROR REPORT <<

INSERT INTO EMPCONSTRANT_PK VALUES('LOKPAVAN',5000,'HYDERABAD');   -->> RAISE AN ERROR REPORT <<

-- TABLE LEVEL:

CREATE TABLE EMPCONSTRANT_PK
(
NO NUMBER NOT NULL,
NAME VARCHAR2(20) NOT NULL,
SALARY NUMBER,
ADDR VARCHAR(20),
PRIMARY KEY(NO)
);

-- ALTER LEVEL:

CREATE TABLE EMPCONSTRANT_PK
(
NO NUMBER,
NAME VARCHAR2(20),
SALARY NUMBER,
ADDR VARCHAR(20)
);

ALTER TABLE EMP ADD CONSTRAINT PK_NO PRIMARY KEY (NO);

ALTER TABLE EMP DROP CONSTRAINT PK_NO; 



-- COMPOSIT KEY:...................................................................................................................

-- we cannot abel to apply composit key in column level

-- TABLE LEVEL:

CREATE TABLE EMPCONSTRANT_PK
(
NO NUMBER NOT NULL,
NAME VARCHAR2(20) NOT NULL,
SALARY NUMBER,
ADDR VARCHAR(20),
PRIMARY KEY(NO,NAME)
);

DROP TABLE EMPCONSTRANT_PK;
INSERT INTO EMPCONSTRANT_PK VALUES(1,'LOKPAVAN',5000,'HYDERABAD');
INSERT INTO EMPCONSTRANT_PK VALUES(2,'RADHA',6000,'HYDERABAD');
INSERT INTO EMPCONSTRANT_PK VALUES(3,'PRASANA',8000,'BANGALURU');
INSERT INTO EMPCONSTRANT_PK VALUES(4,'MAHESH',4000,'NUZEVEDU');
INSERT INTO EMPCONSTRANT_PK VALUES(6,'JAI',6000,'HYDERABAD');
INSERT INTO EMPCONSTRANT_PK VALUES(7,'DIVYA',7000,'USA');
INSERT INTO EMPCONSTRANT_PK VALUES(8,'RAM',7000,'INDIA');
INSERT INTO EMPCONSTRANT_PK VALUES(9,'RAM',100000,'INDIA');
INSERT INTO EMPCONSTRANT_PK VALUES(111,'LOKPAVAN',5000,'HYDERABAD');

INSERT INTO EMPCONSTRANT_PK VALUES(111,'LOKPAVAN',5000,'HYDERABAD');  -->> RAISE AN ERROR REPORT <<

INSERT INTO EMPCONSTRANT_PK VALUES('LOKPAVAN',5000,'HYDERABAD');   -->> RAISE AN ERROR REPORT  "not enough values" <<

-- ALTER LEVEL:

CREATE TABLE EMPCONSTRANT_PK
(
NO NUMBER,
NAME VARCHAR2(20),
SALARY NUMBER,
ADDR VARCHAR(20)
);

SELECT * FROM EMPCONSTRANT_PK;

DESCRIBE EMPCONSTRANT_PK;

DROP TABLE EMPCONSTRANT_PK;

ALTER TABLE EMPCONSTRANT_PK ADD CONSTRAINT C_NO_NAME PRIMARY KEY (NO,NAME);

ALTER TABLE EMPCONSTRANT_PK DROP CONSTRAINT C_NO_NAME; 

INSERT INTO EMPCONSTRANT_PK VALUES(1,'LOKPAVAN',5000,'HYDERABAD');
INSERT INTO EMPCONSTRANT_PK VALUES(2,'RADHA',6000,'HYDERABAD');
INSERT INTO EMPCONSTRANT_PK VALUES(3,'PRASANA',8000,'BANGALURU');
INSERT INTO EMPCONSTRANT_PK VALUES(4,'MAHESH',4000,'NUZEVEDU');
INSERT INTO EMPCONSTRANT_PK VALUES(6,'JAI',6000,'HYDERABAD');
INSERT INTO EMPCONSTRANT_PK VALUES(7,'DIVYA',7000,'USA');
INSERT INTO EMPCONSTRANT_PK VALUES(8,'RAM',7000,'INDIA');
INSERT INTO EMPCONSTRANT_PK VALUES(9,'RAM',100000,'INDIA');
INSERT INTO EMPCONSTRANT_PK VALUES(111,'LOKPAVAN',5000,'HYDERABAD');

INSERT INTO EMPCONSTRANT_PK VALUES(1,'NARESH',5000,'HYDERABAD');    -->  1 row inserted. <

INSERT INTO EMPCONSTRANT_PK VALUES('NARESH',5000,'HYDERABAD');    

INSERT INTO EMPCONSTRANT_PK(NO,NAME) VALUES(1,'NARESH'); 

INSERT INTO EMPCONSTRANT_PK VALUES(1,5000,'HYDERABAD');         --> "not enough values"<

-- FORIGEN KEY:......................................................................................................................

SELECT * FROM DEPT;

DROP TABLE DEPT;

CREATE TABLE DEPT -- PARENT TABLE SHOULD HAVE PRIMARY KEY
(
DEPTNO NUMBER PRIMARY KEY ,
DNAME VARCHAR2(10),
LOC VARCHAR2(10)
);


INSERT INTO DEPT VALUES(10,'HR','HYDERABAD');
INSERT INTO DEPT VALUES(20,'MANAGER','MUMBAI');
INSERT INTO DEPT VALUES(30,'CLURCK','CHENNAI');
INSERT INTO DEPT VALUES(40,'ATTENDER','DELHI');
INSERT INTO DEPT VALUES(50,'TRAINER','HYDERABAD');

-- WE CAN DEFINE IN ALL 3 LEVELS 

SELECT * FROM EMP;

DROP TABLE EMP;

DESCRIBE EMP;

DESCRIBE DEPT;

-- COLUMN LEVEL:
CREATE TABLE EMP
(
NO NUMBER ,
NAME VARCHAR2(10),
SALARY NUMBER,
DNO NUMBER  REFERENCES DEPT(DEPTNO)
);

-- TABLE LEVEL:
CREATE TABLE EMP
(
NO NUMBER ,
NAME VARCHAR2(10),
SALARY NUMBER,
DNO NUMBER,
FOREIGN KEY (DNO) REFERENCES DEPT(DEPTNO)
);

DROP TABLE EMP;
-- ALTER LEVEL:

CREATE TABLE EMP
(
NO NUMBER ,
NAME VARCHAR2(10),
SALARY NUMBER,
DNO NUMBER
);

ALTER TABLE EMP ADD CONSTRAINT FK_DNO FOREIGN KEY (DNO) REFERENCES DEPT(DNO);

INSERT INTO EMP VALUES(1,'LOKPAVAN',5000,'10');
INSERT INTO EMP VALUES(2,'RADHA',6000,50);

INSERT INTO EMP VALUES(3,'PRASANA',8000,60); -->PARENT KEY NOT FOUND<

INSERT INTO EMP VALUES(3,'PRASANA',8000,20);

INSERT INTO EMP VALUES(4,'MAHESH',4000,10);

COMMIT;

INSERT INTO EMP VALUES(6,'JAI',6000,'HYDERABAD');
INSERT INTO EMP VALUES(7,'DIVYA',7000,'USA');
INSERT INTO EMP VALUES(8,'RAM',7000,'INDIA');
INSERT INTO EMP VALUES(9,'RAM',100000,'INDIA');

SELECT * FROM EMP;

SELECT * FROM DEPT;

DELETE FROM DEPT WHERE DEPTNO IN (10,20,50);  -- >  violated - child record found  <
-- IF WE WANT TO DELETE THE RECORD FROM PARENT TABLE THEN FIRSTLY WE SHOULD DELETE THIS CHAILD TABLE RECORD

DELETE FROM EMP WHERE DNO=50;

DELETE FROM DEPT WHERE DEPTNO=50;

--CHECK CONSTRANTS:.....................................................................................................................

--COLUMN LEVEL

CREATE TABLE EMP
(
NO NUMBER ,
NAME VARCHAR2(10),
SALARY NUMBER CHECK (SALARY>=5000),
DNO NUMBER
);

--TABLE LEVEL:.................

CREATE TABLE EMP
(
NO NUMBER ,
NAME VARCHAR2(10),
SALARY NUMBER,
DNO NUMBER,
CHECK (SALARY>=5000)
);

-- ALTER LEVEL:.............................

CREATE TABLE EMP
(
NO NUMBER ,
NAME VARCHAR2(10),
SALARY NUMBER,
DNO NUMBER
);


ALTER TABLE EMP ADD CONSTRAINT C_SALARY CHECK(SALARY>=5000);


ALTER TABLE EMP DROP CONSTRAINT C_SALARY;

COMMIT;

INSERT INTO EMP VALUES(1,'LOKPAVAN',5000,'10');
INSERT INTO EMP VALUES(2,'RADHA',6000,50);

INSERT INTO EMP VALUES(3,'PRASANA',8000,50); -->PARENT KEY NOT FOUND<

INSERT INTO EMP VALUES(3,'PRASANA',8000,20);

UPDATE EMP SET SALARY =5000 WHERE DNO=10 AND NAME;

INSERT INTO EMP VALUES(4,'MAHESH',4000,10);         -- >   check constraint (JUNE.C_SALARY) violated    <

INSERT INTO EMP VALUES(4,'MAHESH',3000,10);

INSERT INTO EMP (NO,NAME,SALARY,DNO) VALUES(5,'MAHESH',50000,10);

SELECT * FROM EMP;

INSERT INTO EMP VALUES(6,'JAI',6000,30);
INSERT INTO EMP VALUES(7,'DIVYA',7000,10);
INSERT INTO EMP VALUES(8,'RAM',7000,40);
INSERT INTO EMP VALUES(9,'RAM',100000,60);


ALTER TABLE EMP MODIFY CONSTRAINT C_SALARY CHECK (SALARY>=5000);

select no || name from emp;

select name from emp where name like '%esh';

-- ------------------------------------------------------------------DAY- 6-------------------------------------------------------------------
                                    --TOPICS:     1.FUNCTIONS
-- FUNCTIONS:
            /*>> BY USING FUNCTION CALLED ABSALUTE THAT WE CAC ABEL TO 
                    CONVERT THE NEGITIVE VALUES INTO ALL POSITIVE VALUES
                    AND WE CAN ABEL TO SHOW OUTPUT IN FORM OF POSITIVES ONLY*/

SELECT * FROM EMP;

SELECT NO,NAME,ABS(SALARY),DNO FROM EMP;  
                                                
SELECT NO,LOWER(NAME),ABS(SALARY),DNO FROM EMP;  

SELECT MAX(SALARY) FROM EMP; 

SELECT NO,NAME,SALARY,DNO FROM EMP WHERE MAX(SALARY);  -- IT WONT SHOW THE ALL THE RECORDS OF THE 


/*                              FUNCTIONS
                                    |
                                    |
            .....................................................................
            |                                                                   |
    SINGLE ROW FUNCTION                                                 GROUP FUNCTION

    >IT WILL TRY TO APPLY FOR EACH AND EVERY RECORD OF THE              > ONLY ONE RECORD OUTPUT 
    CREATED TABLE.
           |
           |
    .................................................................
    |               |               |               |               |
  NUMERIC         STRING           DATE         CONVERSION      MISLENEAOUS [ADVANCED]


*/

-- HERE WE ARE USING A METEDATA TABLES WHERE WE CAN ALSO CALLED AS  DUMMY TABLE 

SELECT * FROM DUAL;

SELECT 'VAGH DHAVI', LOWER('SYSDATABASE'),90,ABS(-900/5) FROM DUAL;

SELECT 'VAGH DHAVI', UPPER('SYSDATABASE'),90,ABS(-900/5) FROM DUAL;

--TO SEE WHAT ARE THE TABLES WHICH ARE CREATED INTHE LIST OF SCHEMA GENERALLY WE USE THSI BELOW SELECT STATEMENT
SELECT * FROM TAB;

-- IF WE WANT TO SEE WHAT ARE THE TABLES THAT AVAILABLE IN ENTAIR DATA BASE
SELECT * FROM ALL_TABLES;

SELECT * FROM ALL_TABLES WHERE OWNER='JUNE';
SELECT * FROM ALL_TABLES WHERE OWNER<>'JUNE';
SELECT * FROM ALL_TABLES WHERE OWNER IN ('JUNE','PAVAN','HR');

--WE CAN ALSO IDENTEFY COLUMNS OF ALL TABLES OF ENTIRE DATA BASE 
SELECT * FROM ALL_TAB_COLUMNS WHERE OWNER='JUNE' AND TABLE_NAME='EMP';


--I) NUMERIC:

--ABS:[ABSOLUTE]    USED TO REMOUE THE SGINES WHICH ARE PRESENT IN FRONT OF OUR DATA  

SELECT * FROM EMP;

SELECT NO,NAME,salary,ABS(SALARY),DNO FROM EMP;


-- sign:  USED TO KNOW THAT DATA IS HAVING +VE OR -VE  SIGN 

SELECT NO,NAME,ABS(SALARY),DNO FROM EMP;

SELECT NO,NAME,SALARY,SIGN(SALARY),DNO FROM EMP;

SELECT NO,NAME,SALARY,SIGN(SALARY),DNO FROM EMP WHERE SIGN(SALARY)=1;

SELECT NO,NAME,SALARY,SIGN(SALARY),DNO FROM EMP WHERE SIGN(SALARY)>0 AND SIGN(SALARY)<2;

SELECT NO,NAME,SALARY,SIGN(SALARY),DNO FROM EMP WHERE SIGN(SALARY)=-1;

SELECT NO,NAME,SALARY,SIGN(SALARY),DNO FROM EMP WHERE SIGN(SALARY)<0 AND SIGN(SALARY)>-2;


--SQRT: 

SELECT SQRT(336) FROM DUAL;

--MOD:

SELECT MOD(22,7) ,MOD(6,3),MOD(3,6) FROM DUAL;

--NVL:

SELECT * FROM EMP;

SELECT NO,NAME,NVL(SALARY,10000),DNO FROM EMP;

-- POWER:

SELECT POWER(2,2),POWER(20,5),POWER(10,5) FROM DUAL;

--EXP: [EXPONENTIONAL VALUE OF A NUMBER]

SELECT EXP(1),EXP(180),EXP(-0.01) FROM DUAL;

--CEIL: USED TO SHOW THE NEXT HIGHER VALUE TO THE GIVEN THE NEXT HIGHER VALUE TO THE GIVEN VALUE 

SELECT CEIL(10.48) FROM DUAL;

--FLOOR:

SELECT FLOOR(10.48) FROM DUAL;

SELECT FLOOR(10.48),CEIL(10.48) FROM DUAL;

--ROUND:

SELECT ROUND(10) FROM DUAL;

SELECT ROUND(10.548) FROM DUAL;

SELECT ROUND(10.548),ROUND(103.548),ROUND(120.5548),ROUND(10.548,1),ROUND(10.548,2) FROM DUAL;

SELECT ROUND(1000.),ROUND(103.548,1),ROUND(120.5548,-1),ROUND(10.548-2),ROUND(10.548,-3) FROM DUAL;

SELECT ROUND(123.256,0),ROUND(128.345,-1),ROUND(123.684,-2) FROM DUAL;

SELECT ROUND(128.345,-1),ROUND(128.345,-2),ROUND(1568.345,-2),ROUND(128.345,-3),ROUND(528.345,-3) FROM DUAL;

--TRUNC

SELECT TRUNC(10.548) FROM DUAL;

SELECT TRUNC(10.48) FROM DUAL;

SELECT TRUNC(10.548),TRUNC(103.548),TRUNC(120.5548),TRUNC(10.548,1),TRUNC(10.548,2) FROM DUAL;

SELECT TRUNC(1000.),TRUNC(103.548,1),TRUNC(120.5548,-1),TRUNC(10.548-2),TRUNC(10.548,-3) FROM DUAL;

SELECT TRUNC(123.256,0),TRUNC(128.345,-1),TRUNC(123.684,-2) FROM DUAL;

SELECT TRUNC(128.345,-1),TRUNC(128.345,-2),TRUNC(1568.345,-2),TRUNC(128.345,-3),TRUNC(528.345,-3),TRUNC(5128.345,-3) FROM DUAL;

SELECT TRUNC(123.256,0),TRUNC(-128.345,-1),TRUNC(123.684,-2) FROM DUAL;

SELECT TRUNC(123.56,0),TRUNC(-128.345,-1),TRUNC(123.684,-2) FROM DUAL;

--GREATEST:

SELECT GREATEST(1,5.9,6,8,10,99,80,99.1) FROM DUAL;

SELECT GREATEST('r.lokpavan','divya','mahesh','rajesh') FROM DUAL;

SELECT GREATEST('l','d','m','r') FROM DUAL;

-- LEAST

SELECT LEAST(1,5.9,6,8,10,99,80,99.1) FROM DUAL;

--COALESCE:

SELECT LEAST(NULL,6,NULL,10,99,NULL,80,99.1) FROM DUAL;

SELECT * FROM EMP_S;

SELECT NO,NAME,COALESCE(ADDR1,ADDR2,ADDR3) FROM EMP_S;

SELECT NO,NAME, TRIM(COALESCE(ADDR1,ADDR2,ADDR3)) AS ADDRESS FROM EMP_S;


--II)STRING FUNCTIONS
/*
Initcap
Upper
Lower
Length
Rpad
Lpad
Ltrim
Rtrim
Trim
Translate
Replace
Soundex
Concat  ( ‘ || ‘ Concatenation operator)
Ascii
Chr
Substr
Instr
*/

--GREATEST:

select * from emp_s;

select GREATEST ('VIJAY','PRAKASH','BASHA') from DUAL;

select GREATEST ('V','P','R','A','K','Z') from DUAL;

select GREATEST ('V','P','R','A','K','Z',NULL) from DUAL;

select GREATEST ('VIJAY',NULL,'PRAKASH','BASHA') from DUAL;

--LEAST

select LEAST ('V','P','R','A','K','Z') from DUAL;

select LEAST ('V','P','R','A','K','Z',NULL) from DUAL;

select LEAST(NULL,NULL,'VIJAY',NULL,'PRAKASH','BASHA') from DUAL;

--COALESCE

select COALESCE ('V','P','R','A','K','Z',NULL) from DUAL;

select COALESCE ('VIJAY','PRAKASH','BASHA') from DUAL;

select COALESCE('V','P',NULL,'R','A','K','Z') from DUAL;

select COALESCE(NULL,'R','A','K','Z') from DUAL;

select COALESCE(NULL,'BASHA',NULL,'VIJAY',NULL,'PRAKASH') from DUAL;

--Initcap:

SELECT * FROM EMP_S;

SELECT NO,INITCAP(NAME),NAME,COALESCE(ADDR1,ADDR2,ADDR3) FROM EMP_S;
--UPPER:

SELECT NO,INITCAP(NAME),UPPER(NAME),SALARY,DNO FROM EMP;

--LOWER:

SELECT NO,INITCAP(NAME),UPPER(NAME),LOWER(NAME),SALARY,DNO FROM EMP;


--LENGTH:

SELECT NO,INITCAP(NAME),LENGTH(NAME),NAME,COALESCE(ADDR1,ADDR2,ADDR3) FROM EMP_S;

SELECT NO,INITCAP(NAME),UPPER(NAME),LOWER(NAME),LENGTH(NAME),SALARY,DNO FROM EMP;

SELECT LENGTH('lok pavan'),LENGTH('divya latha'),LENGTH('rajesh') FROM DUAL;

--RPAD:

SELECT RPAD('LOKPAVAN',15,'&') FROM DUAL;

SELECT RPAD('LOKPAVAN   ',15,'&') FROM DUAL;

SELECT RPAD('LOKPAVAN',25,'&#*%@') FROM DUAL;

--LPAD:

SELECT LPAD('LOKPAVAN',15,'&') FROM DUAL;

SELECT LPAD('   LOKPAVAN',35,' & ') FROM DUAL;

SELECT RPAD(LPAD('LOKPAVAN',25,'&#*%@'),100000050,'||') FROM DUAL;

--LTRIM:

SELECT ('     COMPUTER     ') FROM DUAL;

SELECT LTRIM('     COMPUTER     ') FROM DUAL;

SELECT LTRIM('     COMPUTER     ','     COM') FROM DUAL;

--rtrim

SELECT RTRIM('     COMPUTER     ') FROM DUAL;

SELECT RTRIM('     COMPUTER     ','R') FROM DUAL;

--TRIM;

SELECT TRIM('     COMPUTER     ') FROM DUAL;
SELECT RTRIM(LTRIM('     COMPUTER     ')) AS TRIM_OP FROM DUAL;


--TRANSLATE:--TRYS TO REPLACE CHAR

SELECT Translate('LOKPAVAN','AVAN','ASDF') FROM DUAL;

SELECT Translate('INDIAN','IN','AS') FROM DUAL;

SELECT Translate('INDIAN','IAN','SDK') FROM DUAL;


SELECT Translate('INDIAN','IAN') FROM DUAL;   -- IF WE ARE NOT PROVIDING THE REPLACEMENT CHARECTERS THEN IT WILL TRY TO RASE AN ERROR   "invalid number of arguments"

--REPLACE:  --REPLACE STRING

SELECT REPLACE('INDIAN','IAN','ASD') FROM DUAL; --USED TO REPLAXE THE ORGINAL STRING CHARECTERS WITH OTHER SELECTED CHARECTERS

SELECT REPLACE('INDIAN','IAN') FROM DUAL;  --ALSO USED TO REMOVE CERTAIN CHARECTERS OF A STRING


SELECT REPLACE('LOKPAVAN, DIVYA, LATHA, REDDY', ',') FROM DUAL;--WE CAN REMOVE THE ', [COMMAS]'

SELECT REPLACE('LOKPAVAN, DIVYA, LATHA, REDDY', ',','  ') FROM DUAL;  -- WE CAN ABEL TO REPLACE THE COMMAS WITH SPACE

SELECT REPLACE('LOKPAVAN, DIVYA', ',','   $  ') FROM DUAL;  -- WE CAN ABEL TO REPLACE THE COMMAS WITH $

--ASCII:
            --  by using this we can abel to find the each and every charecter value weather it is a capital,small,special charecter also
SELECT ASCII('L'),ASCII('O'),ASCII('K'),ASCII('P'),ASCII('A'),ASCII('V'),ASCII('A'),ASCII('N') FROM DUAL;

SELECT ASCII('l'),ASCII('o'),ASCII('k'),ASCII('p'),ASCII('a'),ASCII('v'),ASCII('a'),ASCII('n') FROM DUAL;

SELECT ASCII('-'),ASCII('_'),ASCII('='),ASCII('+'),ASCII('*'),ASCII('&'),ASCII('%'),ASCII('$') FROM DUAL;

SELECT ASCII(' '), ASCII('          ') FROM DUAL;


--CHR:
        -- USED TO FIND THE RESPECTIVE CHARECTER BY USING THE OBTAINED ASCII VALUE 

SELECT ASCII('-'),ASCII('_'),ASCII('='),ASCII('+'),ASCII('*'),ASCII('&'),ASCII('%'),ASCII('$') FROM DUAL;

SELECT CHR(45),CHR(95),CHR(61),CHR(43),CHR(42),CHR(38),CHR(37),CHR(36) FROM DUAL;

SELECT CHR(108),CHR(111),CHR(107),CHR(32),CHR(112),CHR(97),CHR(118),CHR(97),CHR(110) FROM DUAL;


SELECT CHR(10) FROM DUAL; -- CHR(10) IT IS MENT TO BE NEW LINE CHARECTER

SELECT CHR('124') FROM DUAL;

--DECODE:
            /*  USED ON A COLUMN WHICH IS PRESENT IN A CREATED TABLE TO SHOW OUTUPT WITH THE COMBINATION OF RANGE VALUES 
            OF THAT PARTICULAR COLUME OF SAME TABLE WITH SOME PARTICULAR MENTIONED CONDITIONS OF EACT VALUE CASES THAT WE ARE
            PROVIDING TO THAT PARTICULAR COLUMN.
            
            SYNTAX:
                    DECODE(COL1,VAL1,OUTPUT1,VAL2,OUTPUT2,..........,DEFAULT OUTPUT)
            */
SELECT * FROM DEPT;

SELECT DEPTNO,DNAME,LOC AS LOCATION,SAL AS SALES,
DECODE(SAL,100000,'HIGH',50000,'MEDIUM',20000,'LOW',10000,'LEAST',5000,'LOW') AS RANGE
FROM DEPT;

SELECT DEPTNO,DNAME,LOC AS LOCATION,SAL AS SALES,
DECODE(SAL,100000,'HIGH',50000,'MEDIUM','LOW') AS RANGE
FROM DEPT;

--CASE:

SELECT DEPTNO,DNAME,LOC AS LOCATION,SAL AS SALES,
CASE WHEN SAL>=100000 THEN 'HIGH'
     WHEN SAL>=50000 THEN 'MEDIUM'
     ELSE 'LOW' 
END AS RANGE
FROM DEPT;

--Soundex:

SELECT * FROM EMP;

SELECT * FROM EMP WHERE SOUNDEX(NAME)=SOUNDEX('jI');

SELECT * FROM EMP WHERE SOUNDEX(NAME)=SOUNDEX('DIVA');

SELECT * FROM EMP WHERE SOUNDEX(NAME)=SOUNDEX('RM');

SELECT * FROM EMP WHERE SOUNDEX(NAME)=SOUNDEX('PRAKASH');

--Concat  ( ‘ || ‘ Concatenation operator)

SELECT 'LOK','PAVAN' FROM DUAL;

--CONCAT

--Instr
            -- SYNTAX:
            
                    -- SELECT INSTR(EXPR1,CHARECTER NEED TO IDENTFY START POSITION , [OCCURANCE]) FORM TABLE_NAME;
                    
SELECT 
INSTR('VIJAY,SARATHI,KOTA',',',1,1) FROM DUAL;

SELECT NO,NAME, 
INSTR('NAME',',',1,1) FROM EMP_S;
--Substr
            --SYNTAX:
                        --SELECT SUBSTR(EXPR1,START POSITION,()NUMBER OF CHARECTERS) FORM TABLE_NAME;

SELECT * FROM EMP_S;
           
SELECT NO, NAME,
SUBSTR(NAME,1,INSTR(NAME,',',1,1)-1),
COALESCE(ADDR1,ADDR2,ADDR3) AS ADDRESS 
FROM EMP_S;

SELECT NO, NAME,
SUBSTR(NAME,1,INSTR(NAME,',',1,1)-1) AS FIRST_NAME,
SUBSTR(NAME,INSTR(NAME,',',1,2)+1) AS LAST_NAME,
COALESCE(ADDR1,ADDR2,ADDR3) AS ADDRESS 
FROM EMP_S;


SELECT NO, NAME,
SUBSTR(NAME,1,INSTR(NAME,',',1,1)-1) AS FIRST_NAME,     -- FIRST NAME 
SUBSTR(NAME,INSTR(NAME,',',1,2)+1) AS LAST_NAME,        -- LAST NAME 
SUBSTR(NAME,INSTR(NAME,',',1,1)+1,INSTR(NAME,',',1,2)-INSTR(NAME,',',1,1)-1) AS MIDLE_NAME,         -- MIDDLE NAME
COALESCE(ADDR1,ADDR2,ADDR3) AS ADDRESS 
FROM EMP_S;




------------------------------------------------------------------------DAY-7---------------------------------------------------------------------------------------------


--                                                      >>>>>   02-JAN-2023     06:00PM     <<<<<



                    --      TOPICS:         1. DATE FUNCTIONS
                                            2. SYNONYM
                                            3.SEQUENCR
                                            
                                            
--SYNONYM:

CREATE TABLE EMP_HJBKJGUGDKSJDADSGKLUIFKJASGDFUULITFUIQ(NO NUMBER);         --identifier is too long

CREATE TABLE EMP_QWERTYUIOPLKJHGFDSAZXCVBNM(NO NUMBER);


SELECT * FROM EMP_QWERTYUIOPLKJHGFDSAZXCVBNM;

        -- HERE ALOS FOR OUR BIG TABLE NAME WE ARE TRYING TO CREATE THE SHORT CUT BY USING SYNONYM;
        
CREATE SYNONYM LOK FOR EMP_QWERTYUIOPLKJHGFDSAZXCVBNM;          --Synonym LOK created.

SELECT * FROM LOK;

DROP TABLE LOK;


-- SEQUENCR::***

--IN INFORMATICA WE CAN FIND SEQUENCE GENERATOE WHICH IS USED TO GENERATE THE SEQUENTIAL MEMBERS IN A TABLE.

CREATE SEQUENCE E_SEQ 
INCREMENT BY 1 
START WITH 2300 
MAXVALUE 999999999999999999                 --      Sequence E_SEQ created.
MINVALUE 100
--CYCLE 
--ORDER
;
ROLLBACK;
drop sequence E_SEQ;


SELECT * FROM EMP;

TRUNCATE TABLE EMP;

INSERT INTO EMP VALUES(E_SEQ.NEXTVAL,'LOKPAVAN',6000,10);
INSERT INTO EMP VALUES(E_SEQ.NEXTVAL,'RADHA',10000,50);
INSERT INTO EMP VALUES(E_SEQ.NEXTVAL,'PRASANA',8000,50);
INSERT INTO EMP VALUES(E_SEQ.NEXTVAL,'SHANU',6000,10);
INSERT INTO EMP VALUES(E_SEQ.NEXTVAL,'MAHESH',50000,10);
INSERT INTO EMP VALUES(E_SEQ.NEXTVAL,'JAI',1000,30);
INSERT INTO EMP VALUES(E_SEQ.NEXTVAL,'DIVYA',200000,10);
INSERT INTO EMP VALUES(E_SEQ.NEXTVAL,'RAM',2000000,40);

---------------------------------------------------------------------------------------------------

---     >> DATE_FUNCTIONS:

/*
Sysdate
Current_date
Current_timestamp
Systimestamp
Localtimestamp
Dbtimezone
Sessiontimezone
To_char
To_date
Add_months
Months_between
Next_day
Last_day
Extract
Greatest
Least
Round
Trunc
New_time
Coalesce
*/


--Sysdate:

SELECT SYSDATE FROM DUAL;       -->>03-JAN-23

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH12:MI:SS AM'; --->2023-01-03 12:17:40

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY HH12:MI:SS';  --->03-01-2023 12:16:55

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS'; --->2023-01-03 12:18:250

SELECT SYSDATE FROM DUAL; 

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MON-DD HH12:MI:SS'; --->2023-JAN-03 12:19:35

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YYYY HH12:MI:SS';  --->03-JAN-2023 12:20:04

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MON-DD HH24:MI:SS'; --->2023-JAN-03 12:20:33


SELECT SYSDATE FROM DUAL; 

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MON-DD-DAY HH12:MI:SS'; --->2023-JAN-03-TUESDAY   12:22:44

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YYYY-DAY HH12:MI:SS';  ---03-JAN-2023-TUESDAY   12:23:15

ALTER SESSION SET NLS_DATE_FORMAT = 'DAY    YYYY-MON-DD HH24:MI:SS'; --->TUESDAY      2023-JAN-03 12:24:18


SELECT SYSDATE FROM DUAL; 

ALTER SESSION SET NLS_DATE_FORMAT = 'YY-MON-DD-DAY HH12:MI:SS AM'; --->23-JAN-03-TUESDAY   12:35:36

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YY-DAY HH12:MI:SS';  ---03-JAN-23-TUESDAY   12:23:15

ALTER SESSION SET NLS_DATE_FORMAT = 'DAY   YY-MON-DD HH24:MI:SS'; --->TUESDAY      23-JAN-03 12:24:18

/*
-- DATE FORMATS 
    
--	D		--	No of days in week

SELECT SYSDATE FROM DUAL;       -->>2023-01-3 12:49:33

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD D HH12:MI:SS'; 
--	DD		--	No of days in month

SELECT SYSDATE FROM DUAL;       -->>2023-01-03 3 12:49:33

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD DD HH12:MI:SS'; 
--	DDD		--	No of days in year

SELECT SYSDATE FROM DUAL;       -->>2023-01-03 003 12:49:33

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD DDD HH12:MI:SS'; 
	MM		--	No of month
	MON		--	Three letter abbreviation of month
	MONTH 	--	Fully spelled out month
	RM		-- 	Roman numeral month
	DY		--	Three letter abbreviated day
	DAY		--	Fully spelled out day
	Y		--	Last one digit of the year
	YY		--	Last two digits of the year
	YYY		--	Last three digits of the year
	YYYY		--	Full four digit year
	SYYYY	--	Signed year
	I		--	One digit year from ISO standard
	IY		--	Two digit year from ISO standard
	IYY		--	Three digit year from ISO standard
	IYYY		--	Four digit year from ISO standard
	Y, YYY		--	Year with comma
	YEAR		--	Fully spelled out year
	CC		--	Century
	Q		--	No of quarters
	W		--	No of weeks in month
	WW		-- 	No of weeks in year
	IW		--	No of weeks in year from ISO standard
	HH		--	Hours
	MI		--	Minutes
	SS		--	Seconds
	FF		--	Fractional seconds
	AM or PM	--	Displays AM or PM depending upon time of day
	A.M or P.M	--	Displays A.M or P.M depending upon time of day
	AD or BC	--	Displays AD or BC depending upon the date
	A.D or B.C	--	Displays AD or BC depending upon the date
	FM		--	Prefix to month or day, suppresses padding of month or day
	TH		--	Suffix to a number
	SP		--	suffix to a number to be spelled out
	SPTH 		--	Suffix combination of TH and SP to be both spelled out
	THSP		--	same as SPTH
*/


-- CURRENT_DATE:

SELECT CURRENT_DATE FROM DUAL;      -->2023-01-03 12:54:43 PM

-- CURRENT_TINE_STAMP:
SELECT CURRENT_TIMESTAMP FROM DUAL;      -->03-JAN-23 12.56.30.582000000 PM ASIA/COLOMBO

--Systimestamp:
SELECT SYSTIMESTAMP FROM DUAL;      -->03-JAN-23 01.02.04.339000000 PM +05:30

--Localtimestamp:
SELECT LOCALTIMESTAMP FROM DUAL;       -->03-JAN-23 01.03.51.383000000 PM

--Dbtimezone:
SELECT Dbtimezone FROM DUAL;        -->+00:00

--Sessiontimezone:
SELECT Sessiontimezone FROM DUAL;          --> Asia/Colombo

--To_date:
            -- USED TO CONVERT THE GIVEN STRING INTO THE DATE 
            
            
SELECT '03-01-2023' FROM DUAL;

CREATE TABLE EMP_DATE (NO NUMBER, JOIN_DATE DATE);

ALTER SESSION SET NLS_DATE_FORMAT='DD-MM-YYYY';

INSERT INTO EMP_DATE VALUES (101,'03-01-2023');     --literal does not match format string:

INSERT INTO EMP_DATE VALUES (102,'05-01-2023'); 

SELECT To_date('03-01-2023','DD-MM-YYYY') FROM DUAL;


INSERT INTO EMP_DATE VALUES (101,To_date('03-01-2023','DD-MM-YYYY'));  
SELECT * FROM EMP_DATE;

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-M-YYYY HH12:MM:SS PM';

SELECT * FROM EMP_DATE;

--To_char:
                -- USED TO CONVERT THE DATE INTO CHARECTER FROMATE 
                
            SELECT SYSDATE FROM DUAL;
            
            SELECT TO_CHAR(SYSDATE,'MM-DD-YYYY') AS CHAR_FROM FROM DUAL;
            
--Add_months:
SELECT SYSDATE FROM DUAL;           --2023-01-03 02:52:55 PM

SELECT ADD_MONTHS(SYSDATE,5) FROM DUAL;   --2023-06-03 02:52:02 PM 

ALTER SESSION SET NLS_DATE_FORMAT ='DD-MON-YYYY   DAY HH12:MI:SS AM';

SELECT ADD_MONTHS(To_date('03-01-2023','DD-MM-YYYY'),5) FROM DUAL;      --2023-06-03 12:00:00 AM

--Months_between:
SELECT MONTHS_BETWEEN(To_date('03-01-2024','DD-MM-YYYY'),To_date('03-01-2023','DD-MM-YYYY')) FROM DUAL;      --12

SELECT MONTHS_BETWEEN(To_date('03-01-2024','DD-MM-YYYY'),To_date('28-01-2023','DD-MM-YYYY')) FROM DUAL;      --11.19354838709677419354838709677419354839

SELECT MONTHS_BETWEEN(To_date('03-01-2023','DD-MM-YYYY'),To_date('03-06-2022','DD-MM-YYYY')) FROM DUAL;      --7

SELECT ROUND(MONTHS_BETWEEN(To_date('03-01-2024','DD-MM-YYYY'),To_date('28-01-2023','DD-MM-YYYY'))) FROM DUAL;  --11

--Next_day:
        --FUNCTION IS USED TO CALCULATE THE NEXT DAY OF THE WEEK:
SELECT NEXT_DAY(SYSDATE,'SAT') FROM DUAL;       --07-01-2023;
SELECT NEXT_DAY(SYSDATE,'THU') FROM DUAL; 


--Last_day:
        -- USED TO CALCULATE THE LAST DAY OF A MONTH
        
        SELECT LAST_DAY(TO_DATE('03-01-2024','DD-MM-YYYY')) AS LAST_DATEE FROM DUAL;    --31-01-2024
        
        SELECT 
        LAST_DAY(TO_DATE('03-01-2024','DD-MM-YYYY')) AS M1,
        LAST_DAY(TO_DATE('03-02-2024','DD-MM-YYYY')) AS M2,
        LAST_DAY(TO_DATE('03-03-2024','DD-MM-YYYY')) AS M3,
        LAST_DAY(TO_DATE('03-04-2024','DD-MM-YYYY')) AS M4,
        LAST_DAY(TO_DATE('03-05-2024','DD-MM-YYYY')) AS M5,
        LAST_DAY(TO_DATE('03-06-2024','DD-MM-YYYY')) AS M6,
        LAST_DAY(TO_DATE('03-07-2024','DD-MM-YYYY')) AS M7,
        LAST_DAY(TO_DATE('03-08-2024','DD-MM-YYYY')) AS M8,
        LAST_DAY(TO_DATE('03-09-2024','DD-MM-YYYY')) AS M9,
        LAST_DAY(TO_DATE('03-10-2024','DD-MM-YYYY')) AS M10,
        LAST_DAY(TO_DATE('03-11-2024','DD-MM-YYYY')) AS M11,
        LAST_DAY(TO_DATE('03-12-2024','DD-MM-YYYY')) AS M12
        FROM DUAL;    --31-01-2024

--Extract:
            -- USED TO EXTRACT [YEARS,MONTHS, DATES,DAYS,HOURS,MINETES,SECONDS] DATE VALUE  FROM A SYSDATE OR FROM THE DATE THAT HA SMENTIONED 
SELECT EXTRACT(YEAR FROM SYSDATE) FROM DUAL;

SELECT EXTRACT(YEAR FROM TO_DATE('03-12-2024','DD-MM-YYYY')) FROM DUAL;

SELECT EXTRACT( MONTH FROM TO_DATE('2024-06-03 MONDAY 1:32:34','YYYY-MM-DD DAY HH12:MI:SS PM')) FROM DUAL;

--Greatest
        --USED TO FINE THE MAXIMUM DATE FROM A SET OF DATEES
        
SELECT TO_DATE('02-01-2004','DD-MM-YYYY'),
TO_DATE('03-12-2014','DD-MM-YYYY'),
TO_DATE('03-12-2018','DD-MM-YYYY'),
TO_DATE('03-12-2012','DD-MM-YYYY'),
TO_DATE('03-12-2030','DD-MM-YYYY'),
TO_DATE('03-12-2030','DD-MM-YYYY'),
TO_DATE('03-12-2025','DD-MM-YYYY') FROM DUAL;


SELECT ROWID,GREATEST (TO_DATE('02-01-2004','DD-MM-YYYY'),
TO_DATE('03-12-2014','DD-MM-YYYY'),
TO_DATE('03-12-2018','DD-MM-YYYY'),
TO_DATE('03-12-2012','DD-MM-YYYY'),
TO_DATE('03-12-2030','DD-MM-YYYY'),
TO_DATE('03-12-2030','DD-MM-YYYY'),
TO_DATE('03-12-2025','DD-MM-YYYY')) FROM DUAL;


--Least:
            --USED TO FINE THE MAXIMUM DATE FROM A SET OF DATEES
            -- LEAST IS ALSO USED TO SHOW THE 'NULL' / NONCOMPARABLE VALUE 
SELECT 
LEAST(TO_DATE('02-01-2004','DD-MM-YYYY'),
TO_DATE('03-12-2014','DD-MM-YYYY'),
TO_DATE('03-12-2018','DD-MM-YYYY'),
TO_DATE('03-12-2012','DD-MM-YYYY'),             ----->>>>> 02-01-2004:
TO_DATE('03-12-2030','DD-MM-YYYY'),
TO_DATE('03-12-2030','DD-MM-YYYY'),
TO_DATE('03-12-2025','DD-MM-YYYY'))
FROM DUAL;

SELECT 
LEAST(
NULL,
NULL,
TO_DATE('02-01-2004','DD-MM-YYYY'),
TO_DATE('03-12-2014','DD-MM-YYYY'),
NULL,
TO_DATE('03-12-2018','DD-MM-YYYY'),
TO_DATE('03-12-2012','DD-MM-YYYY'),             ----->>>>> NULL
TO_DATE('03-12-2030','DD-MM-YYYY'),
TO_DATE('03-12-2030','DD-MM-YYYY'),
TO_DATE('03-12-2025','DD-MM-YYYY'))
FROM DUAL;
--Coalesce:
            -- TRYS TO SHOW US THE FIRST NOT NULL VALUE 
SELECT 
COALESCE(
NULL,
NULL,
TO_DATE('02-01-2004','DD-MM-YYYY'),
TO_DATE('03-12-2014','DD-MM-YYYY'),
NULL,
TO_DATE('03-12-2018','DD-MM-YYYY'),
TO_DATE('03-12-2012','DD-MM-YYYY'),             ----->>>>> NULL
TO_DATE('03-12-2030','DD-MM-YYYY'),
TO_DATE('03-12-2030','DD-MM-YYYY'),
TO_DATE('03-12-2025','DD-MM-YYYY'))
FROM DUAL;



--Round

SELECT MONTHS_BETWEEN(To_date('03-01-2024','DD-MM-YYYY'),To_date('20-01-2023','DD-MM-YYYY')) FROM DUAL;         --11.4516129032258064516129032258064516129

SELECT ROUND(MONTHS_BETWEEN(To_date('03-01-2024','DD-MM-YYYY'),To_date('20-01-2023','DD-MM-YYYY'))) FROM DUAL;         --11


--Trunc
            -- USED TO PROVIDE THE FLOOR VALUES ONLY
SELECT TRUNC(MONTHS_BETWEEN(To_date('03-01-2024','DD-MM-YYYY'),To_date('20-01-2023','DD-MM-YYYY'))) FROM DUAL;

SELECT (MONTHS_BETWEEN(To_date('03-01-2024','DD-MM-YYYY'),To_date('06-02-2023','DD-MM-YYYY'))) FROM DUAL;      --10.90322580645161290322580645161290322581

SELECT TRUNC(MONTHS_BETWEEN(To_date('03-01-2024','DD-MM-YYYY'),To_date('06-02-2023','DD-MM-YYYY'))) FROM DUAL;


--New_time:

            --USED TO give the desired timezone’s date and time.

    --  Syntax: new_time (date, current_timezone, desired_timezone)


select to_char(new_time(sysdate,'gmt','edt'),'dd mon yyyy hh:mi:ss pm') from dual;

......................................................................................................................................................................................................

-- GROUP FUNCTIONS:
                    -- USED TO LOAD THE DATA INTO THE FACT TABLE OF DATA WARE HOUSING SYSTEM.
                    -- THESE GROUP FUNSECTIONS ARE ALSO THERE IN INFORMATICA 
                    -- THESE FACT TABLES ARE HAVING COLUMNS NAMELY CALLED AS AGGREGATE OR GROUP OR FACT OR CALCULATED COLUMNS
/* 
MAX
MIN
AVG
SUM
COUNT

*/

-- MAX

SELECT * FROM EMP;

SELECT ABS(SALARY) AS SAL FROM EMP;---->>>> GROUP FUNCTION 

SELECT MAX(SALARY) AS MAX_SALARY FROM EMP;      -- SINGLE ROW FUNCTION 
--                                          
SELECT MAX(ABS(SALARY)) AS SAL FROM EMP;        -- GROUP FUNCTION + SINGLR ROW FUNCTION 

--MIN:
SELECT ABS(SALARY) AS SAL FROM EMP;

SELECT MIN(ABS(SALARY)) AS SAL FROM EMP;

--SUM

SELECT ABS(SALARY) AS SAL FROM EMP;

SELECT SUM(ABS(SALARY)) AS SAL FROM EMP;

--AVG

SELECT AVG(ABS(SALARY)) AS SAL FROM EMP;    --254333.3333333333333333333333333333333333

--COUNT

SELECT COUNT(ABS(SALARY)) AS SAL FROM EMP;    

SELECT COUNT(*) FROM EMP;

SELECT COUNT(1) FROM EMP;

SELECT COUNT(NO) FROM EMP;

SELECT COUNT(NO) FROM EMP_S;  -- IF ANY NULL VALUE IS THERE IN THE SELECTED COLUMN OF A TABLE THEN BY NEGLECTING THAT RECORD IT WILL TRY TO SHOW THE COUNT OF REMAINING RECORDS OF A TABLE

--FACT TABLE {DATA WHEARE HOUSE}


-----------------------------------------------...............................----------------------------------------------------

--MISLENEAOUS FUNCTIONS 
--Uid
--User
--Vsize
--Rank

--USER:     USED TO IDENTEFIE THE USER NAME OF THE DATA BASE WE ARE USING 
SELECT USER FROM DUAL;
-- UID
SELECT UID FROM DUAL;

SELECT * FROM ALL_USERS;

SELECT * FROM ALL_TABLES;

SELECT * FROM ALL_TAB_COLUMNS;

--RANK:
--DENSE_RANK:


--GROUP BY:
--SUB QUERY:

-- WRITING A quary STATEMENT WITH in the WHERE CLAUSE IS CALLED AS SUB QUERY
SELECT MAX(ABS(SALARY)) FROM EMP;

SELECT NO,NAME,MAX(SALARY) FROM EMP;  -- IT WILL THOOUGH AN ERROR
-- WE CANNOT COMBINE THE GROUP COLUMN WITH THE NON GROUP COLUMN

SELECT * FROM EMP WHERE MAX(SALARY);

SELECT * FROM EMP WHERE SALARY=(SELECT MAX(SALARY) FROM EMP);
SELECT UID FROM DUAL;
SELECT USER FROM DUAL;
SELECT COUNT(NO) FROM EMP_S;
SELECT COUNT(NO) FROM EMP;
SELECT COUNT(1) FROM EMP;
SELECT AVG(ABS(SALARY)) AS SAL FROM EMP;
SELECT SUM(ABS(SALARY)) AS SAL FROM EMP;
SELECT ABS(SALARY) AS SAL FROM EMP;
SELECT MAX(ABS(SALARY)) AS SAL FROM EMP;
SELECT MAX(SALARY) AS MAX_SALARY FROM EMP;
select to_char(new_time(sysdate,'gmt','edt'),'dd mon yyyy hh:mi:ss pm') from dual;
select to_char(new_time(sysdate,'gmt','ydt'),'dd mon yyyy hh:mi:ss pm') from dual;
select to_char(new_time(sysdate,'gmt','pdt'),'dd mon yyyy hh:mi:ss pm') from dual;
select to_char(new_time(sysdate,'gmt','nst'),'dd mon yyyy hh:mi:ss pm') from dual;
select to_char(new_time(sysdate,'gmt','mdt'),'dd mon yyyy hh:mi:ss pm') from dual;
select to_char(new_time(sysdate,'gmt','hdt'),'dd mon yyyy hh:mi:ss pm') from dual;
select to_char(new_time(sysdate,'gmt','est'),'dd mon yyyy hh:mi:ss pm') from dual;
select to_char(new_time(sysdate,'gmt','yst'),'dd mon yyyy hh:mi:ss am') from dual;
SELECT TRUNC(MONTHS_BETWEEN(To_date('03-01-2024','DD-MM-YYYY'),To_date('06-02-2023','DD-MM-YYYY'))) FROM DUAL;
SELECT (MONTHS_BETWEEN(To_date('03-01-2024','DD-MM-YYYY'),To_date('06-02-2023','DD-MM-YYYY'))) FROM DUAL;
SELECT (MONTHS_BETWEEN(To_date('03-01-2024','DD-MM-YYYY'),To_date('2-02-2023','DD-MM-YYYY'))) FROM DUAL;
SELECT (MONTHS_BETWEEN(To_date('03-01-2024','DD-MM-YYYY'),To_date('20-02-2023','DD-MM-YYYY'))) FROM DUAL;
SELECT TRUNC(MONTHS_BETWEEN(To_date('03-01-2024','DD-MM-YYYY'),To_date('20-02-2023','DD-MM-YYYY'))) FROM DUAL;
SELECT CEIL(MONTHS_BETWEEN(To_date('03-01-2024','DD-MM-YYYY'),To_date('20-01-2023','DD-MM-YYYY'))) FROM DUAL;
SELECT ROUND(MONTHS_BETWEEN(To_date('03-01-2024','DD-MM-YYYY'),To_date('20-01-2023','DD-MM-YYYY'))) FROM DUAL;
SELECT MONTHS_BETWEEN(To_date('03-01-2024','DD-MM-YYYY'),To_date('20-01-2023','DD-MM-YYYY')) FROM DUAL;
SELECT MONTHS_BETWEEN(To_date('03-01-2024','DD-MM-YYYY'),To_date('21-01-2023','DD-MM-YYYY')) FROM DUAL;
SELECT MONTHS_BETWEEN(To_date('03-01-2024','DD-MM-YYYY'),To_date('25-01-2023','DD-MM-YYYY')) FROM DUAL;
SELECT MONTHS_BETWEEN(To_date('03-01-2024','DD-MM-YYYY'),To_date('28-01-2023','DD-MM-YYYY')) FROM DUAL;
SELECT 
COALESCE(
NULL,
NULL,
TO_DATE('02-01-2004','DD-MM-YYYY'),
TO_DATE('03-12-2014','DD-MM-YYYY'),
NULL,
TO_DATE('03-12-2018','DD-MM-YYYY'),
TO_DATE('03-12-2012','DD-MM-YYYY'),             ----->>>>> NULL
TO_DATE('03-12-2030','DD-MM-YYYY'),
TO_DATE('03-12-2030','DD-MM-YYYY'),
TO_DATE('03-12-2025','DD-MM-YYYY'))
FROM DUAL;
SELECT 
LEAST(
NULL,
NULL,
TO_DATE('02-01-2004','DD-MM-YYYY'),
TO_DATE('03-12-2014','DD-MM-YYYY'),
NULL,
TO_DATE('03-12-2018','DD-MM-YYYY'),
TO_DATE('03-12-2012','DD-MM-YYYY'),             ----->>>>> 02-01-2004:
TO_DATE('03-12-2030','DD-MM-YYYY'),
TO_DATE('03-12-2030','DD-MM-YYYY'),
TO_DATE('03-12-2025','DD-MM-YYYY'))
FROM DUAL;
SELECT TO_DATE('02-01-2004','DD-MM-YYYY'),
TO_DATE('03-12-2014','DD-MM-YYYY'),
TO_DATE('03-12-2018','DD-MM-YYYY'),
TO_DATE('03-12-2012','DD-MM-YYYY'),
TO_DATE('03-12-2030','DD-MM-YYYY'),
TO_DATE('03-12-2030','DD-MM-YYYY'),
TO_DATE('03-12-2025','DD-MM-YYYY') FROM DUAL;
SELECT ROWID,GREATEST (TO_DATE('02-01-2004','DD-MM-YYYY'),
TO_DATE('03-12-2014','DD-MM-YYYY'),
TO_DATE('03-12-2018','DD-MM-YYYY'),
TO_DATE('03-12-2012','DD-MM-YYYY'),
TO_DATE('03-12-2030','DD-MM-YYYY'),
TO_DATE('03-12-2030','DD-MM-YYYY'),
TO_DATE('03-12-2025','DD-MM-YYYY')) FROM DUAL;
SELECT GREATEST (TO_DATE('02-01-2004','DD-MM-YYYY'),
TO_DATE('03-12-2014','DD-MM-YYYY'),
TO_DATE('03-12-2018','DD-MM-YYYY'),
TO_DATE('03-12-2012','DD-MM-YYYY'),
TO_DATE('03-12-2030','DD-MM-YYYY'),
TO_DATE('03-12-2030','DD-MM-YYYY'),
TO_DATE('03-12-2025','DD-MM-YYYY')) FROM DUAL;
SELECT GREATEST (TO_DATE('02-01-2004','DD-MM-YYYY'),
TO_DATE('03-12-2014','DD-MM-YYYY'),
TO_DATE('03-12-2018','DD-MM-YYYY'),
TO_DATE('03-12-2012','DD-MM-YYYY')) FROM DUAL;
SELECT EXTRACT(DAY FROM TO_DATE('2024-06-03 MONDAY 1:32:34','YYYY-MM-DD DAY HH:MI:SS PM')) FROM DUAL;
SELECT EXTRACT(YEAR FROM SYSDATE) FROM DUAL;
SELECT LAST_DAY(TO_DATE('03-01-2024','DD-MM-YYYY')),
        LAST_DAY(TO_DATE('03-02-2024','DD-MM-YYYY')),
        LAST_DAY(TO_DATE('03-03-2024','DD-MM-YYYY')),
        LAST_DAY(TO_DATE('03-04-2024','DD-MM-YYYY')),
        LAST_DAY(TO_DATE('03-05-2024','DD-MM-YYYY')),
        LAST_DAY(TO_DATE('03-06-2024','DD-MM-YYYY')),
        LAST_DAY(TO_DATE('03-07-2024','DD-MM-YYYY')),
        LAST_DAY(TO_DATE('03-08-2024','DD-MM-YYYY')),
        LAST_DAY(TO_DATE('03-09-2024','DD-MM-YYYY')),
        LAST_DAY(TO_DATE('03-10-2024','DD-MM-YYYY')),
        LAST_DAY(TO_DATE('03-11-2024','DD-MM-YYYY')),
        LAST_DAY(TO_DATE('03-12-2024','DD-MM-YYYY'))
        FROM DUAL;
SELECT LAST_DAY(TO_DATE('03-01-2024','DD-MM-YYYY')),
        LAST_DAY(TO_DATE('03-02-2024','DD-MM-YYYY')),
        LAST_DAY(TO_DATE('03-03-2024','DD-MM-YYYY')),
        LAST_DAY(TO_DATE('03-04-2024','DD-MM-YYYY')) FROM DUAL;
SELECT LAST_DAY(TO_DATE('03-01-2024','DD-MM-YYYY')) AS LAST_DATEE FROM DUAL;
SELECT LAST_DAY(TO_DATE('03-01-2024','DD-MM-YYYY')) FROM DUAL;
SELECT NEXT_DAY(SYSDATE,'SAT') FROM DUAL;
SELECT ROUND(MONTHS_BETWEEN(To_date('03-01-2024','DD-MM-YYYY'),To_date('28-01-2023','DD-MM-YYYY'))) FROM DUAL;
SELECT MONTHS_BETWEEN(To_date('03-01-2023','DD-MM-YYYY'),To_date('03-06-2022','DD-MM-YYYY')) FROM DUAL;
SELECT MONTHS_BETWEEN(To_date('03-01-2024','DD-MM-YYYY'),To_date('28-06-2022','DD-MM-YYYY')) FROM DUAL;
SELECT MONTHS_BETWEEN(To_date('03-01-2024','DD-MM-YYYY'),To_date('24-01-2023','DD-MM-YYYY')) FROM DUAL;
SELECT ADD_MONTHS(To_date('03-01-2023','DD-MM-YYYY'),5) FROM DUAL;
SELECT SYSDATE FROM DUAL;
SELECT ADD_MONTHS(SYSDATE,6) FROM DUAL;
SELECT * FROM EMP_DATE;
SELECT To_date('03-01-2023','DD-MM-YYYY') FROM DUAL;
SELECT Sessiontimezone FROM DUAL;
SELECT Dbtimezone FROM DUAL;
SELECT SYSTIMESTAMP FROM DUAL;
SELECT 
INSTR('VIJAY,SARATHI,KOTA',',',1,1) FROM DUAL;
SELECT NO, NAME,
SUBSTR(NAME,1,INSTR(NAME,',',1,1)-1) AS FIRST_NAME,
SUBSTR(NAME,INSTR(NAME,',',1,2)+1) AS LAST_NAME,
COALESCE(ADDR1,ADDR2,ADDR3) AS ADDRESS 
FROM EMP_S;
SELECT NO, NAME,
SUBSTR(NAME,1,INSTR(NAME,',',1,1)-1),
COALESCE(ADDR1,ADDR2,ADDR3) AS ADDRESS 
FROM EMP_S;
SELECT * FROM EMP_S;
SELECT NO,NAME,
SUBSTR(NAME,1,5) AS FN,
COALESCE(ADDR1,ADDR2,ADDR3) AS ADDRESS FROM EMP_S;
SELECT SUBSTR('REKAPALLI,LOK,PAVAN',1,9) FROM DUAL;
SELECT NO,NAME, INITCAP(TRIM(COALESCE(ADDR1,ADDR2,ADDR3))) AS ADDRESS1, UPPER(INITCAP(TRIM(COALESCE(ADDR1,ADDR2,ADDR3)))) AS ADDRESS2 FROM EMP_S;
SELECT LEAST(1,939,8839,774,646,9938,2.483569) AS GRATEST_VVALUE FROM DUAL;
SELECT 

ROUND(10002.483569) AS OP, ROUND(10002.83569,0) AS OP0,

ROUND(10002.483569,1) AS OP1, ROUND(10002.83569,2) AS OP2, ROUND(10002.83569,3) AS OP3,

ROUND(10002.483569,-1) AS OPM1, ROUND(10002.83569,-2) AS OPM2, ROUND(10002.483569,-3) AS OPM3, ROUND(15362.83569,-4) AS OPM4

FROM DUAL;
SELECT 

ROUND(10002.483569) AS OP, ROUND(10002.83569,0) AS OP0,

ROUND(10002.483569,1) AS OP1, ROUND(10002.83569,2) AS OP2,

ROUND(10002.483569,-1) AS OPM1, ROUND(10002.83569,-2) AS OPM2, ROUND(10002.483569,-3) AS OPM3, ROUND(15362.83569,-2) AS OPM4

FROM DUAL;
SELECT 

TRUNC(10002.483569) AS OP, TRUNC(10002.83569,0) AS OP0,

TRUNC(10002.483569,1) AS OP1, TRUNC(10002.83569,2) AS OP2,

TRUNC(10002.483569,-1) AS OPM1, TRUNC(10002.83569,-2) AS OPM2, TRUNC(10002.483569,-3) AS OPM3, TRUNC(15342.83569,-1) AS OPM4

FROM DUAL;
SELECT ROUND(10002.483569), ROUND(10002.83569) FROM DUAL;
SELECT CEIL(10002.483569) FROM DUAL;
SELECT DEPTNO,DNAME,LOC AS LOCATION,SAL AS SALES,
DECODE(SAL,100000,'HIGH',50000,'MEDIUM',20000,'LOW') AS RANGE
FROM DEPT;
SELECT CHR('45'),CHR('95'),CHR('61'),CHR('43'),CHR('42'),CHR('38'),CHR('37'),CHR('36') FROM DUAL;
SELECT ASCII('-'),ASCII('_'),ASCII('='),ASCII('+'),ASCII('*'),ASCII('&'),ASCII('%'),ASCII('$') FROM DUAL;
SELECT ASCII('LOKPAVAN') FROM DUAL;
SELECT REPLACE('LOKPAVAN, DIVYA', ',','   $  ') FROM DUAL;
SELECT Translate('INDIAN','INAN','SDFKK') FROM DUAL;
SELECT Translate('INDIAN','INDIAN','ASDF') FROM DUAL;
SELECT Translate('INDIAN','IAN','ASDF') FROM DUAL;
SELECT Translate('INDIAN','AN','ASDF') FROM DUAL;
SELECT Translate('lokpavan','IN','XY') FROM DUAL;
        THESE CONSTRANTS ARE GENERELLY DECIDED BY ARCHETECTS 
        
WE CAN ADD CONSTRANTS TO TABLE IN THREE WAYS
                                |
                                |
    --------------------------------------------------------------------
    |                           |                                      |
    |                           |                                      |  
TABLE LEVEL               COLUMN LEVEL                            ALTER LEVEL



-- NOT NULL:    >> it is a "column level" constrant 
                    USED not TO allows null values into the particular columns of a created table.
                     it is implemented during the creation of table IN DATABASE.
                    WE can add a NOT NULL TO A column is not possible in ALTER LEVEL POSSINLE only in COLUMN LEVEL
                    
-- UNIQUE:  >> USED WHEN WE CONSIDRED A COLUMN CALUES AS UNIQUE THEN 
                IT WILL NOT ALLOW THE REPEATED VALUES INTO THE COLUMES INTO A CREATING TABLE AND CONTROL THE REPETED VALUES IN THE COLUMN.
            >> WE CAN ABEL TO DECLARE THIS IN ALL THREE LEVELS [COLUMN,TABLE,ALTER]   
            
-- PRIMARY KEY  >> USED TO NOT ALLOW BOTH REPITED VALUES AND NULL VALUES
                    ITS A COMBINATION OF BOTH NOT NULL AND UNION CONSTRANT
                   HERE IT IS USED ONLY ONCE IN A TABLE (ONE TABLE CAN HAVE ONE PRIMARY KEY)
                    IF WE ARE USING THIS TO A COLUMN OF A TABLE THEN THE VALUES OF THAT COLUMN SHOULD BE HAVE DISTENCT VALUES.

-- COMPOSIT KEY: >> IF WE TRY TO DEFINE A PRIMARY KEY MORE THAN ONE COLUMN THEN THAT IS CALLED AS COMPOSIT KEY
                    THIS WE CAN DEFINE IN BOTH TABLE LEVEL AND ALTER LEVEL BUT NOT POSSIBLE IN COLUMN LEVEL

-- FORIGEN KEY: >>  

-- CHECK:>> WE CAN ALSO DEFINE THIS IN ALL 3 LEVELS.
            UDED TO RESTRICT THE DATA WHICH IS GOING TO PROVIDE IN THE CREATED TABLE BY USING CONDITIONS  
            

*/
SELECT * FROM EMPCONSTRANT;

INSERT INTO EMP VALUES(111,'LOKPAVAN',5000,'HYDERABAD');

--NOT NULL:....................................................................................................................

    -- COLUMN_LEVEL
CREATE TABLE EMPCONSTRANT
(
NO NUMBER NOT NULL,
NAME VARCHAR2(20) NOT NULL,
SALARY NUMBER,
ADDR VARCHAR(20) 
);


    --ALTER_LEVEL:

ALTER TABLE EMPCONSTRANT MODIFY ADDR VARCHAR2(20) NOT NULL;

ALTER TABLE EMPCONSTRANT MODIFY NO NUMBER NULL;


DROP TABLE EMPCONSTRANT;

INSERT INTO EMPCONSTRANT VALUES(1,'LOKPAVAN',5000,'HYDERABAD');
INSERT INTO EMPCONSTRANT VALUES(2,'RADHA',6000,'HYDERABAD');
INSERT INTO EMPCONSTRANT VALUES(3,'PRASANA',8000,'BANGALURU');
INSERT INTO EMPCONSTRANT VALUES(4,'MAHESH',4000,'NUZEVEDU');
INSERT INTO EMPCONSTRANT VALUES(6,'JAI',6000,'HYDERABAD');
INSERT INTO EMPCONSTRANT VALUES(7,'DIVYA',7000,'USA');
INSERT INTO EMPCONSTRANT VALUES(8,'RAM',7000,'INDIA');
INSERT INTO EMPCONSTRANT VALUES(9,'RAM',100000,'INDIA');


INSERT INTO EMPCONSTRANT (NAME,SALARY,ADDR) VALUES('RAM',100000,'INDIA');   -->>  ORA-01400: cannot insert NULL into ("JUNE"."EMPCONSTRANT"."NO")

INSERT INTO EMPCONSTRANT (NO,SALARY,ADDR) VALUES(12,100000,'INDIA');        -->>  ORA-01400: cannot insert NULL into ("JUNE"."EMPCONSTRANT"."NAME")


INSERT INTO EMPCONSTRANT (NO,NAME,ADDR) VALUES(10,'VIJAY','INDIA');
--UNIQUE........................................................................................................................
/*
UNIQUE;
    TABLE LEVEL >> HERE WE ARE JUST PUTING A COMMAND "UNIQUE" AT THE LAST OF MENTIONING OF ALL COLUMN NAME AND ALSO MENTIONING 
                    THE COLUMN NAME FOR WHICH WE ARE PROVIDING THIS UNIQUE CONDITION IN THE CREATING TABLE.
                    
                >> WE CAN ALSO INSERT THIS UNIQUE CONDITION  BY USING "ALTER LEVEL" ALSO
*/

    -- column_level:
CREATE TABLE EMPCONSTRANT_UNIQUE
(
NO NUMBER NOT NULL UNIQUE,
NAME VARCHAR2(20) NOT NULL,
SALARY NUMBER,
ADDR VARCHAR(20)
);


    --table_level declaration of unique constrant:
CREATE TABLE EMPCONSTRANT_UNIQUE
(
NO NUMBER NOT NULL,
NAME VARCHAR2(20) NOT NULL,
SALARY NUMBER,
ADDR VARCHAR(20),
UNIQUE(NO)
);

INSERT INTO EMPCONSTRANT_UNIQUE VALUES(1,'LOKPAVAN',5000,'HYDERABAD');
INSERT INTO EMPCONSTRANT_UNIQUE VALUES(2,'RADHA',6000,'HYDERABAD');
INSERT INTO EMPCONSTRANT_UNIQUE VALUES(3,'PRASANA',8000,'BANGALURU');
INSERT INTO EMPCONSTRANT_UNIQUE VALUES(4,'MAHESH',4000,'NUZEVEDU');
INSERT INTO EMPCONSTRANT_UNIQUE VALUES(6,'JAI',6000,'HYDERABAD');
INSERT INTO EMPCONSTRANT_UNIQUE VALUES(7,'DIVYA',7000,'USA');
INSERT INTO EMPCONSTRANT_UNIQUE VALUES(8,'RAM',7000,'INDIA');
INSERT INTO EMPCONSTRANT_UNIQUE VALUES(9,'RAM',100000,'INDIA');
INSERT INTO EMPCONSTRANT_UNIQUE VALUES(111,'LOKPAVAN',5000,'HYDERABAD');

    --alter_level;
CREATE TABLE EMPCONSTRANT_UNIQUE
(
NO NUMBER NOT NULL,
NAME VARCHAR2(20) NOT NULL,
SALARY NUMBER,
ADDR VARCHAR(20)
);

ALTER TABLE EMP ADD CONSTRAINT UN_NO UNIQUE(NO);

ALTER TABLE EMP DROP CONSTRAINT UN_NO;


--PRIMARY KEY:............................................................................................................................

SELECT * FROM EMPCONSTRANT_PK; 

--COLUME LEVEL:

CREATE TABLE EMPCONSTRANT_PK
(
NO NUMBER PRIMARY KEY,
NAME VARCHAR2(20) NOT NULL,
SALARY NUMBER,
ADDR VARCHAR(20)
);

DESCRIBE EMPCONSTRANT_PK;

ROLLBACK;

DROP TABLE EMPCONSTRANT_PK;

INSERT INTO EMPCONSTRANT_PK VALUES(1,'LOKPAVAN',5000,'HYDERABAD');
INSERT INTO EMPCONSTRANT_PK VALUES(2,'RADHA',6000,'HYDERABAD');
INSERT INTO EMPCONSTRANT_PK VALUES(3,'PRASANA',8000,'BANGALURU');
INSERT INTO EMPCONSTRANT_PK VALUES(4,'MAHESH',4000,'NUZEVEDU');
INSERT INTO EMPCONSTRANT_PK VALUES(6,'JAI',6000,'HYDERABAD');
INSERT INTO EMPCONSTRANT_PK VALUES(7,'DIVYA',7000,'USA');
INSERT INTO EMPCONSTRANT_PK VALUES(8,'RAM',7000,'INDIA');
INSERT INTO EMPCONSTRANT_PK VALUES(9,'RAM',100000,'INDIA');
INSERT INTO EMPCONSTRANT_PK VALUES(111,'LOKPAVAN',5000,'HYDERABAD');

INSERT INTO EMPCONSTRANT_PK VALUES(111,'LOKPAVAN',5000,'HYDERABAD');  -->> RAISE AN ERROR REPORT <<

INSERT INTO EMPCONSTRANT_PK VALUES('LOKPAVAN',5000,'HYDERABAD');   -->> RAISE AN ERROR REPORT <<

-- TABLE LEVEL:

CREATE TABLE EMPCONSTRANT_PK
(
NO NUMBER NOT NULL,
NAME VARCHAR2(20) NOT NULL,
SALARY NUMBER,
ADDR VARCHAR(20),
PRIMARY KEY(NO)
);

-- ALTER LEVEL:

CREATE TABLE EMPCONSTRANT_PK
(
NO NUMBER,
NAME VARCHAR2(20),
SALARY NUMBER,
ADDR VARCHAR(20)
);

ALTER TABLE EMP ADD CONSTRAINT PK_NO PRIMARY KEY (NO);

ALTER TABLE EMP DROP CONSTRAINT PK_NO; 



-- COMPOSIT KEY:...................................................................................................................



-- TABLE LEVEL:

CREATE TABLE EMPCONSTRANT_PK
(
NO NUMBER NOT NULL,
NAME VARCHAR2(20) NOT NULL,
SALARY NUMBER,
ADDR VARCHAR(20),
PRIMARY KEY(NO,NAME)
);


INSERT INTO EMPCONSTRANT_PK VALUES(1,'LOKPAVAN',5000,'HYDERABAD');
INSERT INTO EMPCONSTRANT_PK VALUES(2,'RADHA',6000,'HYDERABAD');
INSERT INTO EMPCONSTRANT_PK VALUES(3,'PRASANA',8000,'BANGALURU');
INSERT INTO EMPCONSTRANT_PK VALUES(4,'MAHESH',4000,'NUZEVEDU');
INSERT INTO EMPCONSTRANT_PK VALUES(6,'JAI',6000,'HYDERABAD');
INSERT INTO EMPCONSTRANT_PK VALUES(7,'DIVYA',7000,'USA');
INSERT INTO EMPCONSTRANT_PK VALUES(8,'RAM',7000,'INDIA');
INSERT INTO EMPCONSTRANT_PK VALUES(9,'RAM',100000,'INDIA');
INSERT INTO EMPCONSTRANT_PK VALUES(111,'LOKPAVAN',5000,'HYDERABAD');

INSERT INTO EMPCONSTRANT_PK VALUES(111,'LOKPAVAN',5000,'HYDERABAD');  -->> RAISE AN ERROR REPORT <<

INSERT INTO EMPCONSTRANT_PK VALUES('LOKPAVAN',5000,'HYDERABAD');   -->> RAISE AN ERROR REPORT  "not enough values" <<

-- ALTER LEVEL:

CREATE TABLE EMPCONSTRANT_PK
(
NO NUMBER,
NAME VARCHAR2(20),
SALARY NUMBER,
ADDR VARCHAR(20)
);

SELECT * FROM EMPCONSTRANT_PK;

DESCRIBE EMPCONSTRANT_PK;

DROP TABLE EMPCONSTRANT_PK;

ALTER TABLE EMPCONSTRANT_PK ADD CONSTRAINT C_NO_NAME PRIMARY KEY (NO,NAME);

ALTER TABLE EMPCONSTRANT_PK DROP CONSTRAINT C_NO_NAME; 

INSERT INTO EMPCONSTRANT_PK VALUES(1,'LOKPAVAN',5000,'HYDERABAD');
INSERT INTO EMPCONSTRANT_PK VALUES(2,'RADHA',6000,'HYDERABAD');
INSERT INTO EMPCONSTRANT_PK VALUES(3,'PRASANA',8000,'BANGALURU');
INSERT INTO EMPCONSTRANT_PK VALUES(4,'MAHESH',4000,'NUZEVEDU');
INSERT INTO EMPCONSTRANT_PK VALUES(6,'JAI',6000,'HYDERABAD');
INSERT INTO EMPCONSTRANT_PK VALUES(7,'DIVYA',7000,'USA');
INSERT INTO EMPCONSTRANT_PK VALUES(8,'RAM',7000,'INDIA');
INSERT INTO EMPCONSTRANT_PK VALUES(9,'RAM',100000,'INDIA');
INSERT INTO EMPCONSTRANT_PK VALUES(111,'LOKPAVAN',5000,'HYDERABAD');

INSERT INTO EMPCONSTRANT_PK VALUES(1,'NARESH',5000,'HYDERABAD');    -->  1 row inserted. <

INSERT INTO EMPCONSTRANT_PK VALUES('NARESH',5000,'HYDERABAD');    

INSERT INTO EMPCONSTRANT_PK(NO,NAME) VALUES(1,'NARESH'); 

INSERT INTO EMPCONSTRANT_PK VALUES(1,5000,'HYDERABAD');         --> "not enough values"<

-- FORIGEN KEY:......................................................................................................................

SELECT * FROM DEPT;

DROP TABLE DEPT;

CREATE TABLE DEPT -- PARENT TABLE SHOULD HAVE PRIMARY KEY
(
DEPTNO NUMBER PRIMARY KEY ,
DNAME VARCHAR2(10),
LOC VARCHAR2(10)
);


INSERT INTO DEPT VALUES(10,'HR','HYDERABAD');
INSERT INTO DEPT VALUES(20,'MANAGER','MUMBAI');
INSERT INTO DEPT VALUES(30,'CLURCK','CHENNAI');
INSERT INTO DEPT VALUES(40,'ATTENDER','DELHI');
INSERT INTO DEPT VALUES(50,'TRAINER','HYDERABAD');

-- WE CAN DEFINE IN ALL 3 LEVELS 

SELECT * FROM EMP;

DROP TABLE EMP;

DESCRIBE EMP;

DESCRIBE DEPT;

-- COLUMN LEVEL:
CREATE TABLE EMP
(
NO NUMBER ,
NAME VARCHAR2(10),
SALARY NUMBER,
DNO NUMBER  REFERENCES DEPT(DEPTNO)
);

-- TABLE LEVEL:
CREATE TABLE EMP
(
NO NUMBER ,
NAME VARCHAR2(10),
SALARY NUMBER,
DNO NUMBER,
FOREIGN KEY (DNO) REFERENCES DEPT(DEPTNO)
);

DROP TABLE EMP;
-- ALTER LEVEL:

CREATE TABLE EMP
(
NO NUMBER ,
NAME VARCHAR2(10),
SALARY NUMBER,
DNO NUMBER
);

ALTER TABLE EMP ADD CONSTRAINT FK_DNO FOREIGN KEY (DNO) REFERENCES DEPT(DEPTNO);


INSERT INTO EMP VALUES(1,'LOKPAVAN',5000,'10');
INSERT INTO EMP VALUES(2,'RADHA',6000,50);

INSERT INTO EMP VALUES(3,'PRASANA',8000,60); -->PARENT KEY NOT FOUND<

INSERT INTO EMP VALUES(3,'PRASANA',8000,20);

INSERT INTO EMP VALUES(4,'MAHESH',4000,10);

COMMIT;

INSERT INTO EMP VALUES(6,'JAI',6000,'HYDERABAD');
INSERT INTO EMP VALUES(7,'DIVYA',7000,'USA');
INSERT INTO EMP VALUES(8,'RAM',7000,'INDIA');
INSERT INTO EMP VALUES(9,'RAM',100000,'INDIA');

SELECT * FROM EMP;

SELECT * FROM DEPT;

DELETE FROM DEPT WHERE DEPTNO IN (10,20,50);  -- >  violated - child record found  <
-- IF WE WANT TO DELETE THE RECORD FROM PARENT TABLE THEN FIRSTLY WE SHOULD DELETE THIS CHAILD TABLE RECORD

DELETE FROM EMP WHERE DNO=50;

DELETE FROM DEPT WHERE DEPTNO=50;

--CHECK CONSTRANTS:.....................................................................................................................

--COLUMN LEVEL

CREATE TABLE EMP
(
NO NUMBER ,
NAME VARCHAR2(10),
SALARY NUMBER CHECK (SALARY>=5000),
DNO NUMBER
);

--TABLE LEVEL:.................

CREATE TABLE EMP
(
NO NUMBER ,
NAME VARCHAR2(10),
SALARY NUMBER,
DNO NUMBER,
CHECK (SALARY>=5000)
);

-- ALTER LEVEL:.............................

CREATE TABLE EMP
(
NO NUMBER ,
NAME VARCHAR2(10),
SALARY NUMBER,
DNO NUMBER
);


ALTER TABLE EMP ADD CONSTRAINT C_SALARY CHECK(SALARY>=5000);


ALTER TABLE EMP DROP CONSTRAINT C_SALARY;

COMMIT;

INSERT INTO EMP VALUES(1,'LOKPAVAN',5000,'10');
INSERT INTO EMP VALUES(2,'RADHA',6000,50);

INSERT INTO EMP VALUES(3,'PRASANA',8000,50); -->PARENT KEY NOT FOUND<

INSERT INTO EMP VALUES(3,'PRASANA',8000,20);

UPDATE EMP SET SALARY =5000 WHERE DNO=10 AND NAME;

INSERT INTO EMP VALUES(4,'MAHESH',4000,10);         -- >   check constraint (JUNE.C_SALARY) violated    <

INSERT INTO EMP VALUES(4,'MAHESH',3000,10);

INSERT INTO EMP (NO,NAME,SALARY,DNO) VALUES(5,'MAHESH',50000,10);

SELECT * FROM EMP;

INSERT INTO EMP VALUES(6,'JAI',6000,30);
INSERT INTO EMP VALUES(7,'DIVYA',7000,10);
INSERT INTO EMP VALUES(8,'RAM',7000,40);
INSERT INTO EMP VALUES(9,'RAM',100000,60);


ALTER TABLE EMP MODIFY CONSTRAINT C_SALARY CHECK (SALARY>=5000);

select no || name from emp;

select name from emp where name like '%esh';

-- ------------------------------------------------------------------DAY- 6-------------------------------------------------------------------


                                    --TOPICS:     1.FUNCTIONS



SELECT * FROM EMP;

SELECT NO,NAME,ABS(SALARY),DNO FROM EMP;  /*>> BY USING FUNCTION CALLED ABSALUTE THAT WE CAC ABEL TO 
                                                CONVERT THE NEGITIVE VALUES INTO ALL POSITIVE VALUES
                                                AND WE CAN ABEL TO SHOW OUTPUT IN FORM OF POSITIVES ONLY*/
                                                
SELECT NO,LOWER(NAME),ABS(SALARY),DNO FROM EMP;  

SELECT MAX(SALARY) FROM EMP; 

SELECT NO,NAME,SALARY,DNO FROM EMP WHERE MAX(SALARY);  -- IT WONT SHOW THE ALL THE RECORDS OF THE 

/*                              FUNCTIONS
                                    |
                                    |
            .....................................................................
            |                                                                   |
    SINGLE ROW FUNCTION                                                 GROUP FUNCTION

    >IT WILL TRY TO APPLY FOR EACH AND EVERY RECORD OF THE              > ONLY ONE RECORD OUTPUT 
    CREATED TABLE.
           |
           |
    .................................................................
    |               |               |               |               |
  NUMERIC         STRING           DATE         CONVERSION      MISLENEAOUS [ADVANCED]


*/

-- HERE WE ARE USING A METEDATA TABLES WHERE WE CAN ALSO CALLED AS  DUMMY TABLE 

SELECT * FROM DUAL;

SELECT 'VAGH DHAVI', LOWER('SYSDATABASE'),90,ABS(-900/5) FROM DUAL;

--TO SEE WHAT ARE THE TABLES WHICH ARE CREATED IN THE LIST OF SCHEMA GENERALLY WE USE THSI BELOW SELECT STATEMENT
SELECT * FROM TAB;

-- IF WE WANT TO SEE WHAT ARE THE TABLES THAT AVAILABLE IN ENTAIR DATA BASE
SELECT * FROM ALL_TABLES;

SELECT * FROM ALL_TABLES WHERE OWNER='JUNE';
SELECT * FROM ALL_TABLES WHERE OWNER<>'JUNE';
SELECT * FROM ALL_TABLES WHERE OWNER IN ('JUNE','PAVAN','HR');

--WE CAN ALSO IDENTEFY COLUMNS OF ALL TABLES OF ENTIRE DATA BASE 
SELECT * FROM ALL_TAB_COLUMNS WHERE OWNER='JUNE' AND TABLE_NAME='EMP';


--I) NUMERIC:[Abs, Sign, Sqrt, Mod, Nvl, Power, Exp, Ln, Log, Ceil, Floor, Round, Trunk, Bitand, Greatest, Least, Coalesce]

--ABS:[ABSOLUTE]    USED TO REMOUE THE SGINES WHICH ARE PRESENT IN FRONT OF OUR DATA  

SELECT * FROM EMP;

SELECT NO,NAME,salary,ABS(SALARY),DNO FROM EMP;


-- sign:  USED TO KNOW THAT DATA IS HAVING +VE OR -VE  SIGN 

SELECT NO,NAME,ABS(SALARY),DNO FROM EMP;

SELECT NO,NAME,SALARY,SIGN(SALARY),DNO FROM EMP;

SELECT NO,NAME,SALARY,SIGN(SALARY),DNO FROM EMP WHERE SIGN(SALARY)=1;

SELECT NO,NAME,SALARY,SIGN(SALARY),DNO FROM EMP WHERE SIGN(SALARY)>0 AND SIGN(SALARY)<2;

SELECT NO,NAME,SALARY,SIGN(SALARY),DNO FROM EMP WHERE SIGN(SALARY)=-1;

SELECT NO,NAME,SALARY,SIGN(SALARY),DNO FROM EMP WHERE SIGN(SALARY)<0 AND SIGN(SALARY)>-2;


--SQRT: 

SELECT SQRT(336) FROM DUAL;

--MOD:

SELECT MOD(22,7),MOD(6,3),MOD(3,6) FROM DUAL;

--NVL:

SELECT * FROM EMP;

SELECT NO,NAME,NVL(SALARY,10000),DNO FROM EMP;


-- POWER:

SELECT POWER(2,2),POWER(20,5),POWER(10,5) FROM DUAL;

--EXP: [EXPONENTIONAL VALUE OF A NUMBER]

SELECT EXP(1),EXP(180),EXP(-0.01) FROM DUAL;

--CEIL:

SELECT CEIL(10.48) FROM DUAL;

--FLOOR:

SELECT FLOOR(10.48) FROM DUAL;

SELECT FLOOR(10.48),CEIL(10.48) FROM DUAL;

--ROUND:

SELECT ROUND(10) FROM DUAL;

SELECT ROUND(10.548) FROM DUAL;

SELECT ROUND(10.548),ROUND(103.548),ROUND(120.5548),ROUND(10.548,1),ROUND(10.548,2) FROM DUAL;

SELECT ROUND(1000.),ROUND(103.548,1),ROUND(120.5548,-1),ROUND(10.548-2),ROUND(10.548,-3) FROM DUAL;

SELECT ROUND(123.256,0),ROUND(128.345,-1),ROUND(123.684,-2) FROM DUAL;

SELECT ROUND(128.345,-1),ROUND(128.345,-2),ROUND(1568.345,-2),ROUND(128.345,-3),ROUND(528.345,-3) FROM DUAL;

--TRUNC

SELECT TRUNC(10.548) FROM DUAL;

SELECT TRUNC(10.48) FROM DUAL;

SELECT TRUNC(10.548),TRUNC(103.548),TRUNC(120.5548),TRUNC(10.548,1),TRUNC(10.548,2) FROM DUAL;

SELECT TRUNC(1000.),TRUNC(103.548,1),TRUNC(120.5548,-1),TRUNC(10.548-2),TRUNC(10.548,-3) FROM DUAL;

SELECT TRUNC(123.256,0),TRUNC(128.345,-1),TRUNC(123.684,-2) FROM DUAL;

SELECT TRUNC(128.345,-1),TRUNC(128.345,-2),TRUNC(1568.345,-2),TRUNC(128.345,-3),TRUNC(528.345,-3),TRUNC(5128.345,-3) FROM DUAL;

SELECT TRUNC(123.256,0),TRUNC(-128.345,-1),TRUNC(123.684,-2) FROM DUAL;

SELECT TRUNC(123.56,0),TRUNC(-128.345,-1),TRUNC(123.684,-2) FROM DUAL;

--GREATEST:

SELECT GREATEST(1,5.9,6,8,10,99,80,99.1) FROM DUAL;

SELECT GREATEST('lok','divya','mahesh','rajesh') FROM DUAL;

SELECT GREATEST('l','d','m','r') FROM DUAL;

-- LEAST

SELECT LEAST(1,5.9,6,8,10,99,80,99.1) FROM DUAL;

--COALESCE:

SELECT LEAST(NULL,6,NULL,10,99,NULL,80,99.1) FROM DUAL;

SELECT * FROM EMP_S;

SELECT NO,NAME,COALESCE(ADDR1,ADDR2,ADDR3) FROM EMP_S;

SELECT NO,NAME, TRIM(COALESCE(ADDR1,ADDR2,ADDR3)) AS ADDRESS FROM EMP_S;


--II)STRING FUNCTIONS
/*
Initcap
Upper
Lower
Length
Rpad
Lpad
Ltrim
Rtrim
Trim
Translate
Replace
Soundex
Concat  ( ‘ || ‘ Concatenation operator)
Ascii
Chr
Substr
Instr
*/

--GREATEST:

select * from emp_s;

select GREATEST ('VIJAY','PRAKASH','BASHA') from DUAL;

select GREATEST ('V','P','R','A','K','Z') from DUAL;

select GREATEST ('V','P','R','A','K','Z',NULL) from DUAL;

select GREATEST ('VIJAY',NULL,'PRAKASH','BASHA') from DUAL;

--LEAST

select LEAST ('V','P','R','A','K','Z') from DUAL;

select LEAST ('V','P','R','A','K','Z',NULL) from DUAL;

select LEAST(NULL,NULL,'VIJAY',NULL,'PRAKASH','BASHA') from DUAL;

--COALESCE

select COALESCE ('V','P','R','A','K','Z',NULL) from DUAL;

select COALESCE ('VIJAY','PRAKASH','BASHA') from DUAL;

select COALESCE('V','P',NULL,'R','A','K','Z') from DUAL;

select COALESCE(NULL,'R','A','K','Z') from DUAL;

select COALESCE(NULL,'BASHA',NULL,'VIJAY',NULL,'PRAKASH') from DUAL;

--Initcap:

SELECT * FROM EMP_S;

SELECT NO,INITCAP(NAME),NAME,COALESCE(ADDR1,ADDR2,ADDR3) FROM EMP_S;
--UPPER:

SELECT NO,INITCAP(NAME),UPPER(NAME),SALARY,DNO FROM EMP;

--LOWER:

SELECT NO,INITCAP(NAME),UPPER(NAME),LOWER(NAME),SALARY,DNO FROM EMP;


--LENGTH:

SELECT NO,INITCAP(NAME),LENGTH(NAME),NAME,COALESCE(ADDR1,ADDR2,ADDR3) FROM EMP_S;

SELECT NO,INITCAP(NAME),UPPER(NAME),LOWER(NAME),LENGTH(NAME),SALARY,DNO FROM EMP;

SELECT LENGTH('lok pavan'),LENGTH('divya latha'),LENGTH('rajesh') FROM DUAL;

--RPAD:

SELECT RPAD('LOKPAVAN',15,'&') FROM DUAL;

SELECT RPAD('LOKPAVAN   ',15,'&') FROM DUAL;

SELECT RPAD('LOKPAVAN',25,'&#*%@') FROM DUAL;

--LPAD:

SELECT LPAD('LOKPAVAN',15,'&') FROM DUAL;

SELECT LPAD('   LOKPAVAN',35,' & ') FROM DUAL;

SELECT RPAD(LPAD('LOKPAVAN',25,'&#*%@'),100000050,'||') FROM DUAL;

--LTRIM:

SELECT ('     COMPUTER     ') FROM DUAL;

SELECT LTRIM('     COMPUTER     ') FROM DUAL;

SELECT LTRIM('     COMPUTER     ','     COM') FROM DUAL;

--rtrim

SELECT RTRIM('     COMPUTER     ') FROM DUAL;

SELECT RTRIM('     COMPUTER     ','R') FROM DUAL;

--TRIM;

SELECT TRIM('     COMPUTER     ') FROM DUAL;

--TRANSLATE:--REPLACE CHAR

SELECT Translate('LOKPAVAN','AVAN','ASDF') FROM DUAL;

SELECT Translate('INDIAN','IN','AS') FROM DUAL;

SELECT Translate('INDIAN','IAN','SDK') FROM DUAL;


SELECT Translate('INDIAN','IAN') FROM DUAL;   -- IF WE ARE NOT PROVIDING THE REPLACEMENT CHARECTERS THEN IT WILL TRY TO RASE AN ERROR   "invalid number of arguments"

--REPLACE:  --REPLACE STRING

SELECT REPLACE('INDIAN','IAN','ASD') FROM DUAL; --USED TO REPLAXE THE ORGINAL STRING CHARECTERS WITH OTHER SELECTED CHARECTERS

SELECT REPLACE('INDIAN','IAN') FROM DUAL;  --ALSO USED TO REMOVE CERTAIN CHARECTERS OF A STRING


SELECT REPLACE('LOKPAVAN, DIVYA, LATHA, REDDY', ',') FROM DUAL;--WE CAN REMOVE THE ', [COMMAS]'

SELECT REPLACE('LOKPAVAN, DIVYA, LATHA, REDDY', ',','  ') FROM DUAL;  -- WE CAN ABEL TO REPLACE THE COMMAS WITH SPACE

SELECT REPLACE('LOKPAVAN, DIVYA', ',','   $  ') FROM DUAL;  -- WE CAN ABEL TO REPLACE THE COMMAS WITH $

--ASCII:
            --  by using this we can abel to find the each and every charecter value weather it is a capital,small,special charecter also
SELECT ASCII('L'),ASCII('O'),ASCII('K'),ASCII('P'),ASCII('A'),ASCII('V'),ASCII('A'),ASCII('N') FROM DUAL;

SELECT ASCII('l'),ASCII('o'),ASCII('k'),ASCII('p'),ASCII('a'),ASCII('v'),ASCII('a'),ASCII('n') FROM DUAL;

SELECT ASCII('-'),ASCII('_'),ASCII('='),ASCII('+'),ASCII('*'),ASCII('&'),ASCII('%'),ASCII('$') FROM DUAL;

SELECT ASCII(' '), ASCII('          ') FROM DUAL;


--CHR:
        -- USED TO FIND THE RESPECTIVE CHARECTER BY USING THE OBTAINED ASCII VALUE 

SELECT ASCII('-'),ASCII('_'),ASCII('='),ASCII('+'),ASCII('*'),ASCII('&'),ASCII('%'),ASCII('$') FROM DUAL;

SELECT CHR(45),CHR(95),CHR(61),CHR(43),CHR(42),CHR(38),CHR(37),CHR(36) FROM DUAL;

SELECT CHR(108),CHR(111),CHR(107),CHR(32),CHR(112),CHR(97),CHR(118),CHR(97),CHR(110) FROM DUAL;


SELECT CHR(10) FROM DUAL; -- CHR(10) IT IS MENT TO BE NEW LINE CHARECTER

SELECT CHR('124') FROM DUAL;

--DECODE:
            /*  USED ON A COLUMN WHICH IS PRESENT IN A CREATED TABLE TO SHOW OUTUPT WITH THE COMBINATION OF RANGE VALUES 
            OF THAT PARTICUNAR COLUME OF SAME TABLE WITH SOME PARTICULAR MENTIONED CONDITIONS OF EACT VALUE CASES THAT WE ARE
            PROVIDING TO THAT PARTICULAR COLUMN.
            
            SYNTAX:
                    DECODE(COL1,VAL1,OUTPUT1,VAL2,OUTPUT2,..........,DEFAULT OUTPUT)
            */
SELECT * FROM DEPT;

SELECT DEPTNO,DNAME,LOC AS LOCATION,SAL AS SALES,
DECODE(SAL,100000,'HIGH',50000,'MEDIUM',20000,'LOW',10000,'LEAST',5000,'LOW') AS RANGE
FROM DEPT;

SELECT DEPTNO,DNAME,LOC AS LOCATION,SAL AS SALES,
DECODE(SAL,100000,'HIGH',50000,'MEDIUM','LOW') AS RANGE
FROM DEPT;

--CASE:

SELECT DEPTNO,DNAME,LOC AS LOCATION,SAL AS SALES,
CASE WHEN SAL>=100000 THEN 'HIGH'
     WHEN SAL>=50000 THEN 'MEDIUM'
     ELSE 'LOW' 
END AS RANGE
FROM DEPT;

--Soundex:

SELECT * FROM EMP;

SELECT * FROM EMP WHERE SOUNDEX(NAME)=SOUNDEX('jI');

SELECT * FROM EMP WHERE SOUNDEX(NAME)=SOUNDEX('DIVA');

SELECT * FROM EMP WHERE SOUNDEX(NAME)=SOUNDEX('RM');

SELECT * FROM EMP WHERE SOUNDEX(NAME)=SOUNDEX('PRAKASH');

--Concat  ( ‘ || ‘ Concatenation operator)

SELECT 'LOK','PAVAN' FROM DUAL;

--CONCAT

--Instr
            -- SYNTAX:
            
                    -- SELECT INSTR(EXPR1,CHARECTER NEED TO IDENTFY START POSITION , [OCCURANCE]) FORM TABLE_NAME;
                    
SELECT 
INSTR('VIJAY,SARATHI,KOTA',',',1,1) FROM DUAL;

SELECT NO,NAME, 
INSTR('NAME',',',1,1) FROM EMP_S;
--Substr
            --SYNTAX:
                        --SELECT SUBSTR(EXPR1,START POSITION,()NUMBER OF CHARECTERS) FORM TABLE_NAME;

SELECT * FROM EMP_S;
           
SELECT NO, NAME,
SUBSTR(NAME,1,INSTR(NAME,',',1,1)-1),
COALESCE(ADDR1,ADDR2,ADDR3) AS ADDRESS 
FROM EMP_S;

SELECT NO, NAME,
SUBSTR(NAME,1,INSTR(NAME,',',1,1)-1) AS FIRST_NAME,
SUBSTR(NAME,INSTR(NAME,',',1,2)+1) AS LAST_NAME,
COALESCE(ADDR1,ADDR2,ADDR3) AS ADDRESS 
FROM EMP_S;


SELECT NO, NAME,
SUBSTR(NAME,1,INSTR(NAME,',',1,1)-1) AS FIRST_NAME,     -- FIRST NAME 
SUBSTR(NAME,INSTR(NAME,',',1,2)+1) AS LAST_NAME,        -- LAST NAME 
SUBSTR(NAME,INSTR(NAME,',',1,1)+1,INSTR(NAME,',',1,2)-INSTR(NAME,',',1,1)-1) AS MIDLE_NAME,         -- MIDDLE NAME
COALESCE(ADDR1,ADDR2,ADDR3) AS ADDRESS 
FROM EMP_S;




------------------------------------------------------------------------DAY-7---------------------------------------------------------------------------------------------


--                                                      >>>>>   02-JAN-2023     06:00PM     <<<<<



                    --      TOPICS:         1. DATE FUNCTIONS
                                            2. SYNONYM
                                            3.SEQUENCR
                                            
                                            
--SYNONYM:

CREATE TABLE EMP_HJBKJGUGDKSJDADSGKLUIFKJASGDFUULITFUIQ(NO NUMBER);         --identifier is too long

CREATE TABLE EMP_QWERTYUIOPLKJHGFDSAZXCVBNM(NO NUMBER);


SELECT * FROM EMP_QWERTYUIOPLKJHGFDSAZXCVBNM;

        -- HERE ALOS FOR OUR BIG TABLE NAME WE ARE TRYING TO CREATE THE SHORT CUT BY USING SYNONYM;
        
CREATE SYNONYM LOK FOR EMP_QWERTYUIOPLKJHGFDSAZXCVBNM;          --Synonym LOK created.

SELECT * FROM LOK;

DROP TABLE LOK;


-- SEQUENCE::***

--IN INFORMATICA WE CAN FIND SEQUENCE GENERATOE WHICH IS USED TO GENERATE THE SEQUENTIAL MEMBERS IN A TABLE.

CREATE SEQUENCE E_SEQ 
INCREMENT BY 1 
START WITH 100 
MAXVALUE 999999999999999999                 --      Sequence E_SEQ created.
MINVALUE 100 
--CYCLE 
--ORDER
;


SELECT * FROM EMP;

TRUNCATE TABLE EMP;

INSERT INTO EMP VALUES(E_SEQ.NEXTVAL,'LOKPAVAN',6000,10);
INSERT INTO EMP VALUES(E_SEQ.NEXTVAL,'RADHA',10000,50);
INSERT INTO EMP VALUES(E_SEQ.NEXTVAL,'PRASANA',8000,50);
INSERT INTO EMP VALUES(E_SEQ.NEXTVAL,'SHANU',6000,10);
INSERT INTO EMP VALUES(E_SEQ.NEXTVAL,'MAHESH',50000,10);
INSERT INTO EMP VALUES(E_SEQ.NEXTVAL,'JAI',1000,30);
INSERT INTO EMP VALUES(E_SEQ.NEXTVAL,'DIVYA',200000,10);
INSERT INTO EMP VALUES(E_SEQ.NEXTVAL,'RAM',2000000,40);

---------------------------------------------------------------------------------------------------

---     >> DATE_FUNCTIONS:

/*
Sysdate
Current_date
Current_timestamp
Systimestamp
Localtimestamp
Dbtimezone
Sessiontimezone
To_char
To_date
Add_months
Months_between
Next_day
Last_day
Extract
Greatest
Least
Round
Trunc
New_time
Coalesce
*/


--Sysdate:

SELECT SYSDATE FROM DUAL;       -->>03-JAN-23

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH12:MI:SS AM'; --->2023-01-03 12:17:40

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY HH12:MI:SS';  --->03-01-2023 12:16:55

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS'; --->2023-01-03 12:18:250

SELECT SYSDATE FROM DUAL; 

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MON-DD HH12:MI:SS'; --->2023-JAN-03 12:19:35

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YYYY HH12:MI:SS';  --->03-JAN-2023 12:20:04

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MON-DD HH24:MI:SS'; --->2023-JAN-03 12:20:33


SELECT SYSDATE FROM DUAL; 

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MON-DD-DAY HH12:MI:SS'; --->2023-JAN-03-TUESDAY   12:22:44

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YYYY-DAY HH12:MI:SS';  ---03-JAN-2023-TUESDAY   12:23:15

ALTER SESSION SET NLS_DATE_FORMAT = 'DAY    YYYY-MON-DD HH24:MI:SS'; --->TUESDAY      2023-JAN-03 12:24:18


SELECT SYSDATE FROM DUAL; 

ALTER SESSION SET NLS_DATE_FORMAT = 'YY-MON-DD-DAY HH12:MI:SS AM'; --->23-JAN-03-TUESDAY   12:35:36

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YY-DAY HH12:MI:SS';  ---03-JAN-23-TUESDAY   12:23:15

ALTER SESSION SET NLS_DATE_FORMAT = 'DAY   YY-MON-DD HH24:MI:SS'; --->TUESDAY      23-JAN-03 12:24:18

/*
-- DATE FORMATS 
    
--	D		--	No of days in week

SELECT SYSDATE FROM DUAL;       -->>2023-01-3 12:49:33

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD D HH12:MI:SS'; 
--	DD		--	No of days in month

SELECT SYSDATE FROM DUAL;       -->>2023-01-03 3 12:49:33

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD DD HH12:MI:SS'; 
--	DDD		--	No of days in year

SELECT SYSDATE FROM DUAL;       -->>2023-01-03 003 12:49:33

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD DDD HH12:MI:SS'; 
	MM		--	No of month
	MON		--	Three letter abbreviation of month
	MONTH 	--	Fully spelled out month
	RM		-- 	Roman numeral month
	DY		--	Three letter abbreviated day
	DAY		--	Fully spelled out day
	Y		--	Last one digit of the year
	YY		--	Last two digits of the year
	YYY		--	Last three digits of the year
	YYYY		--	Full four digit year
	SYYYY	--	Signed year
	I		--	One digit year from ISO standard
	IY		--	Two digit year from ISO standard
	IYY		--	Three digit year from ISO standard
	IYYY		--	Four digit year from ISO standard
	Y, YYY		--	Year with comma
	YEAR		--	Fully spelled out year
	CC		--	Century
	Q		--	No of quarters
	W		--	No of weeks in month
	WW		-- 	No of weeks in year
	IW		--	No of weeks in year from ISO standard
	HH		--	Hours
	MI		--	Minutes
	SS		--	Seconds
	FF		--	Fractional seconds
	AM or PM	--	Displays AM or PM depending upon time of day
	A.M or P.M	--	Displays A.M or P.M depending upon time of day
	AD or BC	--	Displays AD or BC depending upon the date
	A.D or B.C	--	Displays AD or BC depending upon the date
	FM		--	Prefix to month or day, suppresses padding of month or day
	TH		--	Suffix to a number
	SP		--	suffix to a number to be spelled out
	SPTH 		--	Suffix combination of TH and SP to be both spelled out
	THSP		--	same as SPTH
*/


-- CURRENT_DATE:

SELECT CURRENT_DATE FROM DUAL;      -->2023-01-03 12:54:43 PM

-- CURRENT_TINE_STAMP:
SELECT CURRENT_TIMESTAMP FROM DUAL;      -->03-JAN-23 12.56.30.582000000 PM ASIA/COLOMBO

--Systimestamp:
SELECT SYSTIMESTAMP FROM DUAL;      -->03-JAN-23 01.02.04.339000000 PM +05:30

--Localtimestamp:
SELECT LOCALTIMESTAMP FROM DUAL;       -->03-JAN-23 01.03.51.383000000 PM

--Dbtimezone:
SELECT Dbtimezone FROM DUAL;        -->+00:00

--Sessiontimezone:
SELECT Sessiontimezone FROM DUAL;          --> Asia/Colombo

--To_date:
            -- USED TO CONVERT THE GIVEN STRING INTO THE DATE 
            
            
SELECT '03-01-2023' FROM DUAL;

CREATE TABLE EMP_DATE (NO NUMBER, JOIN_DATE DATE);

INSERT INTO EMP_DATE VALUES (101,'03-01-2023');     --literal does not match format string:

SELECT To_date('03-01-2023','DD-MM-YYYY') FROM DUAL;


INSERT INTO EMP_DATE VALUES (101,To_date('03-01-2023','DD-MM-YYYY'));  

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY';

SELECT * FROM EMP_DATE;

--To_char:
                -- USED TO CONVERT THE DATE INTO CHARECTER FROMATE 
                
            SELECT SYSDATE FROM DUAL;
            
            SELECT TO_CHAR(SYSDATE,'MM-DD-YYYY') AS CHAR_FROM FROM DUAL;
            
--Add_months:
SELECT SYSDATE FROM DUAL;           --2023-01-03 02:52:55 PM

SELECT ADD_MONTHS(SYSDATE,5) FROM DUAL;   --2023-06-03 02:52:02 PM

SELECT ADD_MONTHS(To_date('03-01-2023','DD-MM-YYYY'),5) FROM DUAL;      --2023-06-03 12:00:00 AM

--Months_between:
SELECT MONTHS_BETWEEN(To_date('03-01-2024','DD-MM-YYYY'),To_date('03-01-2023','DD-MM-YYYY')) FROM DUAL;      --12

SELECT MONTHS_BETWEEN(To_date('03-01-2024','DD-MM-YYYY'),To_date('28-01-2023','DD-MM-YYYY')) FROM DUAL;      --11.19354838709677419354838709677419354839

SELECT MONTHS_BETWEEN(To_date('03-01-2023','DD-MM-YYYY'),To_date('03-06-2022','DD-MM-YYYY')) FROM DUAL;      --7

SELECT ROUND(MONTHS_BETWEEN(To_date('03-01-2024','DD-MM-YYYY'),To_date('28-01-2023','DD-MM-YYYY'))) FROM DUAL;  --11

--Next_day:
        --FUNCTION IS USED TO CALCULATE THE NEXT DAY OF THE WEEK:
SELECT NEXT_DAY(SYSDATE,'SAT') FROM DUAL;       --07-01-2023;

--Last_day:
        -- USED TO CALCULATE THE LAST DAY OF A MONTH
        
        SELECT LAST_DAY(TO_DATE('03-01-2024','DD-MM-YYYY')) AS LAST_DATEE FROM DUAL;    --31-01-2024
        
        SELECT 
        LAST_DAY(TO_DATE('03-01-2024','DD-MM-YYYY')) AS M1,
        LAST_DAY(TO_DATE('03-02-2024','DD-MM-YYYY')) AS M2,
        LAST_DAY(TO_DATE('03-03-2024','DD-MM-YYYY')) AS M3,
        LAST_DAY(TO_DATE('03-04-2024','DD-MM-YYYY')) AS M4,
        LAST_DAY(TO_DATE('03-05-2024','DD-MM-YYYY')) AS M5,
        LAST_DAY(TO_DATE('03-06-2024','DD-MM-YYYY')) AS M6,
        LAST_DAY(TO_DATE('03-07-2024','DD-MM-YYYY')) AS M7,
        LAST_DAY(TO_DATE('03-08-2024','DD-MM-YYYY')) AS M8,
        LAST_DAY(TO_DATE('03-09-2024','DD-MM-YYYY')) AS M9,
        LAST_DAY(TO_DATE('03-10-2024','DD-MM-YYYY')) AS M10,
        LAST_DAY(TO_DATE('03-11-2024','DD-MM-YYYY')) AS M11,
        LAST_DAY(TO_DATE('03-12-2024','DD-MM-YYYY')) AS M12
        FROM DUAL;    --31-01-2024

--Extract:
            -- USED TO EXTRACT [YEARS,MONTHS, DATES,DAYS,HOURS,MINETES,SECONDS] DATE VALUE  FROM A SYSDATE OR FROM THE DATE THAT HA SMENTIONED 
SELECT EXTRACT(YEAR FROM SYSDATE) FROM DUAL;

SELECT EXTRACT(YEAR FROM TO_DATE('03-12-2024','DD-MM-YYYY')) FROM DUAL;

SELECT EXTRACT( MONTH FROM TO_DATE('2024-06-03 MONDAY 1:32:34','YYYY-MM-DD DAY HH12:MI:SS PM')) FROM DUAL;

--Greatest
        --USED TO FINE THE MAXIMUM DATE FROM A SET OF DATEES
        
SELECT TO_DATE('02-01-2004','DD-MM-YYYY'),
TO_DATE('03-12-2014','DD-MM-YYYY'),
TO_DATE('03-12-2018','DD-MM-YYYY'),
TO_DATE('03-12-2012','DD-MM-YYYY'),
TO_DATE('03-12-2030','DD-MM-YYYY'),
TO_DATE('03-12-2030','DD-MM-YYYY'),
TO_DATE('03-12-2025','DD-MM-YYYY') FROM DUAL;


SELECT ROWID,GREATEST (TO_DATE('02-01-2004','DD-MM-YYYY'),
TO_DATE('03-12-2014','DD-MM-YYYY'),
TO_DATE('03-12-2018','DD-MM-YYYY'),
TO_DATE('03-12-2012','DD-MM-YYYY'),
TO_DATE('03-12-2030','DD-MM-YYYY'),
TO_DATE('03-12-2030','DD-MM-YYYY'),
TO_DATE('03-12-2025','DD-MM-YYYY')) FROM DUAL;


--Least:
            --USED TO FINE THE MAXIMUM DATE FROM A SET OF DATEES
            -- LEAST IS ALSO USED TO SHOW THE 'NULL' / NONCOMPARABLE VALUE 
SELECT 
LEAST(TO_DATE('02-01-2004','DD-MM-YYYY'),
TO_DATE('03-12-2014','DD-MM-YYYY'),
TO_DATE('03-12-2018','DD-MM-YYYY'),
TO_DATE('03-12-2012','DD-MM-YYYY'),             ----->>>>> 02-01-2004:
TO_DATE('03-12-2030','DD-MM-YYYY'),
TO_DATE('03-12-2030','DD-MM-YYYY'),
TO_DATE('03-12-2025','DD-MM-YYYY'))
FROM DUAL;

SELECT 
LEAST(
NULL,
NULL,
TO_DATE('02-01-2004','DD-MM-YYYY'),
TO_DATE('03-12-2014','DD-MM-YYYY'),
NULL,
TO_DATE('03-12-2018','DD-MM-YYYY'),
TO_DATE('03-12-2012','DD-MM-YYYY'),             ----->>>>> NULL
TO_DATE('03-12-2030','DD-MM-YYYY'),
TO_DATE('03-12-2030','DD-MM-YYYY'),
TO_DATE('03-12-2025','DD-MM-YYYY'))
FROM DUAL;
--Coalesce:
            -- TRYS TO SHOW US THE FIRST NOT NULL VALUE 
SELECT 
COALESCE(
NULL,
NULL,
TO_DATE('02-01-2004','DD-MM-YYYY'),
TO_DATE('03-12-2014','DD-MM-YYYY'),
NULL,
TO_DATE('03-12-2018','DD-MM-YYYY'),
TO_DATE('03-12-2012','DD-MM-YYYY'),             ----->>>>> NULL
TO_DATE('03-12-2030','DD-MM-YYYY'),
TO_DATE('03-12-2030','DD-MM-YYYY'),
TO_DATE('03-12-2025','DD-MM-YYYY'))
FROM DUAL;



--Round

SELECT MONTHS_BETWEEN(To_date('03-01-2024','DD-MM-YYYY'),To_date('20-01-2023','DD-MM-YYYY')) FROM DUAL;         --11.4516129032258064516129032258064516129

SELECT ROUND(MONTHS_BETWEEN(To_date('03-01-2024','DD-MM-YYYY'),To_date('20-01-2023','DD-MM-YYYY'))) FROM DUAL;         --11


--Trunc
            -- USED TO PROVIDE THE FLOOR VALUES ONLY
SELECT TRUNC(MONTHS_BETWEEN(To_date('03-01-2024','DD-MM-YYYY'),To_date('20-01-2023','DD-MM-YYYY'))) FROM DUAL;

SELECT (MONTHS_BETWEEN(To_date('03-01-2024','DD-MM-YYYY'),To_date('06-02-2023','DD-MM-YYYY'))) FROM DUAL;      --10.90322580645161290322580645161290322581

SELECT TRUNC(MONTHS_BETWEEN(To_date('03-01-2024','DD-MM-YYYY'),To_date('06-02-2023','DD-MM-YYYY'))) FROM DUAL;


--New_time:

            --USED TO give the desired timezone’s date and time.

    --  Syntax: new_time (date, current_timezone, desired_timezone)


select to_char(new_time(sysdate,'gmt','edt'),'dd mon yyyy hh:mi:ss pm') from dual;

......................................................................................................................................................................................................

-- GROUP FUNCTIONS:
                    -- USED TO LOAD THE DATA INTO THE FACT TABLE OF DATA WARE HOUSING SYSTEM.
                    -- THESE GROUP FUNSECTIONS ARE ALSO THERE IN INFORMATICA 
                    -- THESE FACT TABLES ARE HAVING COLUMNS NAMELY CALLED AS AGGREGATE OR GROUP OR FACT OR CALCULATED COLUMNS
/* 
MAX
MIN
AVG
SUM
COUNT
*/

-- MAX

SELECT * FROM EMP;

SELECT ABS(SALARY) AS SAL FROM EMP;---->>>> GROUP FUNCTION 

SELECT MAX(SALARY) AS MAX_SALARY FROM EMP;      -- SINGLE ROW FUNCTION 
--                                          
SELECT MAX(ABS(SALARY)) AS SAL FROM EMP;        -- GROUP FUNCTION + SINGLR ROW FUNCTION 

--MIN:
SELECT ABS(SALARY) AS SAL FROM EMP;

SELECT MIN(ABS(SALARY)) AS SAL FROM EMP;

--SUM

SELECT ABS(SALARY) AS SAL FROM EMP;

SELECT SUM(ABS(SALARY)) AS SAL FROM EMP;

--AVG

SELECT AVG(ABS(SALARY)) AS SAL FROM EMP;    --254333.3333333333333333333333333333333333

--COUNT

SELECT COUNT(ABS(SALARY)) AS SAL FROM EMP;    

SELECT COUNT(*) FROM EMP;

SELECT COUNT(1) FROM EMP;

SELECT COUNT(NO) FROM EMP;

SELECT COUNT(NO) FROM EMP_S;  -- IF ANY NULL VALUE IS THERE IN THE SELECTED COLUMN OF A TABLE THEN BY NEGLECTING THAT RECORD IT WILL TRY TO SHOW THE COUNT OF REMAINING RECORDS OF A TABLE

--FACT TABLE {DATA WHEARE HOUSE}


-----------------------------------------------...............................----------------------------------------------------

--MISLENEAOUS FUNCTIONS 
--Uid
--User
--Vsize
--Rank

--USER:     USED TO IDENTEFIE THE USER NAME OF THE DATA BASE WE ARE USING 
SELECT USER FROM DUAL;
-- UID
SELECT UID FROM DUAL;

SELECT * FROM ALL_USERS;

SELECT * FROM ALL_TABLES;

SELECT * FROM ALL_TAB_COLUMNS;

--RANK:
--DENSE_RANK:


--GROUP BY:
--SUB QUERY:

-- WRITING A quary STATEMENT WITH in the WHERE CLAUSE IS CALLED AS SUB QUERY
SELECT MAX(ABS(SALARY)) FROM EMP;

SELECT NO,NAME,MAX(SALARY) FROM EMP;  -- IT WILL THOOUGH AN ERROR
-- WE CANNOT COMBINE THE GROUP COLUMN WITH THE NON GROUP COLUMN

SELECT * FROM EMP WHERE MAX(SALARY);

SELECT * FROM EMP WHERE SALARY=(SELECT MAX(SALARY) FROM EMP);

SELECT * FROM EMP WHERE SALARY=(SELECT MIN(SALARY) FROM EMP);

SELECT * FROM EMP WHERE SALARY=(SELECT MAX(SALARY) FROM EMP) OR SALARY=(SELECT MIN(SALARY) FROM EMP);

SELECT * FROM EMP WHERE SALARY!=(SELECT MAX(SALARY) FROM EMP) AND SALARY!=(SELECT MIN(SALARY) FROM EMP);

---------------------------------------------------------------practice  23-JAN-04-WEDNESDAY 10:45:04 AM----------------------------------------------------------------------------------------------------------------------------------------------

select sysdate from dual;

--------------------------------------------------------------------------------day 8-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT SYSDATE FROM DUAL;                   --06-01-2023 FRIDAY    11:52:25 AM

ALTER SESSION SET Nls_DATE_FORMAT= 'DD-MM-YYYY DAY HH12:MI:SS AM';

--SUB QUERY: if we try to write a select statement in where clause
                --first sub_query will exicute then it will stop, based on result of subquery then our query will be exicuting

-- based on output of subquery it is divided into 4 types
--[single row,Multiple row, corelated,Multiple]

--single row subquery
                    --  returns the result of only one record as output from a created table 
SELECT MAX(SALARY) FROM EMP;

SELECT NO,NAME,MAX(SALARY) FROM EMP;  -- IT WILL THOOUGH AN ERROR
-- WE CANNOT COMBINE THE GROUP COLUMN WITH THE NON GROUP COLUMN
SELECT * FROM EMP WHERE MAX(SALARY);

SELECT * FROM EMP WHERE SALARY=(SELECT MAX(SALARY) FROM EMP);       --9	RAM	100000	10	
SELECT * FROM EMP_CCC WHERE SALARY=(SELECT MAX(SALARY) FROM EMP_CCC);

SELECT no,name,salary FROM EMP WHERE SALARY=(SELECT MIN(SALARY) FROM EMP);

SELECT * FROM EMP WHERE SALARY=(SELECT MAX(SALARY) FROM EMP) OR SALARY=(SELECT MIN(SALARY) FROM EMP);

SELECT * FROM EMP WHERE SALARY!=(SELECT MAX(SALARY) FROM EMP) AND SALARY!=(SELECT MIN(SALARY) FROM EMP);

SELECT MAX(ABS(SALARY)),NAME,DNO FROM EMP GROUP BY NAME,DNO;

....................................................
--MULTIPLE ROW SUBQUERY;
                    --  returns the result of MORE THAN one record as output from a created table 
                    
-- FOR TO WORK WITH MULTIPLE ROW SUBQUERY IS DONE BY USING 'GROUP BY' CLAUSE  
--GROUP BY: IS USED TO DIVIDE THE GIVEN TABLE INTO GROUPS ON THE BASES OF 'GROUP_BY_COLUMN_CONDITION' 
select MAX(SALARY),DNO from EMP GROUP BY DNO;

SELECT* FROM EMP WHERE SALARY IN (select MAX(SALARY) from EMP GROUP BY DNO);
SELECT* FROM EMP WHERE (SALARY,DNO) IN (select MAX(SALARY),DNO from EMP GROUP BY DNO);    --HOW TO SELECT DEPARTMENT WISE MAX SALARY EMP DETAILS

--.............................
--SINGLE ROW
SELECT MAX(SALARY) FROM EMP;
SELECT MAX(SALARY) FROM EMP WHERE DNO IN (10,20,30,40,50);

--MULITPUL ROW
SELECT * FROM EMP WHERE SALARY IN (SELECT MAX(SALARY) FROM EMP);
SELECT * FROM EMP WHERE SALARY IN (SELECT MAX(SALARY) FROM EMP GROUP BY DNO);

--CORELATED SUBQUERY : CO REALTED SUBQUERY  IS ALSO A SUAQERY 
            --BUT IF SUBQUERY IS EXECUTING EACH AND EVERY PARENT ITERNATION (RECORD) THEN WE CALL IT 'CO REALTED SUBQUERY'


SELECT * FROM EMP E1 WHERE SALARY IN (SELECT MAX(SALARY) FROM EMP E2 WHERE E2.DNO=E1.DNO  GROUP BY DNO);
SELECT * FROM EMP E1 WHERE SALARY IN(SELECT MAX(SALARY) FROM EMP E2 WHERE E2.DNO=E1.DNO);
SELECT * FROM EMP E1 WHERE SALARY=(SELECT MAX(SALARY) FROM EMP E2 WHERE E2.DNO=E1.DNO);


--MULTIPLE SUBQUERY:

--HOW TO FIND 2ND AND 3RD MAX SALARY:
SELECT MAX(SALARY) FROM EMP;
SELECT MAX(SALARY),DNO FROM EMP GROUP BY DNO;
SELECT * FROM(SELECT * FROM EMP  WHERE (SALARY,DNO) IN (SELECT MAX(SALARY),DNO FROM EMP GROUP BY DNO))ORDER BY SALARY;

SELECT * FROM EMP  WHERE SALARY 
=(SELECT MAX(SALARY) FROM EMP WHERE SALARY<(SELECT MAX(SALARY) FROM EMP));      -- 2ND MAX SALARY

SELECT * FROM EMP  WHERE SALARY 
=(SELECT MAX(SALARY) FROM EMP WHERE SALARY<(SELECT MAX(SALARY) FROM EMP));   --SELECT * FROM EMP WHERE SALARY=(SELECT MAX(SALARY) FROM EMP GROUP BY DNO);
SELECT * FROM EMP  WHERE SALARY 
=(SELECT MAX(SALARY) FROM EMP SALARY < (SELECT MAX(SALARY) FROM EMP WHERE SALARY<(SELECT MAX(SALARY) FROM EMP)));      -- 2ND MAX SALARY


SELECT * FROM EMP WHERE SALARY=
(SELECT MAX(SALARY) FROM EMP WHERE SALARY<(SELECT MAX(SALARY) FROM EMP WHERE SALARY<(SELECT MAX(SALARY) FROM EMP )));       --3RD MAX VALUE 

SELECT * FROM EMP WHERE SALARY>
(SELECT MAX(SALARY) FROM EMP WHERE SALARY<(SELECT MAX(SALARY) FROM EMP WHERE SALARY<(SELECT MAX(SALARY) FROM EMP)));        --1,2 MAX VALUES

........................................................................................
--RANGE,DENSE_RANGE:

--PROVIDING RANGE TO THE SALARY COLUMN IN EMP TABLE 
            --SYNTAX:RANK()OVER(ORDER BY SAL <DIRECTION>);
SELECT NO,NAME,DNO,SALARY,
RANK() OVER(ORDER BY SALARY ASC) AS RANGE_ FROM EMP
WHERE (SALARY,DNO) IN (SELECT MAX(SALARY),DNO FROM EMP GROUP BY DNO);


SELECT NO,NAME,DNO,SALARY,
DENSE_RANK() OVER(ORDER BY SALARY ASC) AS RANGE_ FROM EMP 
WHERE (SALARY,DNO) IN (SELECT MAX(SALARY),DNO FROM EMP  GROUP BY DNO);

--DEPARTMENT WISE MAX SALARY DETAILS 

SELECT MAX(SALARY) FROM EMP;    --SINGLE ROW

SELECT * FROM EMP WHERE SALARY=(SELECT MAX(SALARY) FROM EMP);   --MULTIPLE ROW SUBQUERY

SELECT * FROM EMP E1 WHERE SALARY IN(SELECT MAX(SALARY) FROM EMP E2 WHERE E2.DNO=E1.DNO);   --CORELATIONAL SUBQUERY

SELECT * FROM(SELECT * FROM EMP  WHERE (SALARY,DNO) IN (SELECT MAX(SALARY),DNO FROM EMP GROUP BY DNO))ORDER BY SALARY;      --MULTIPLE SUBQUERY

-- PARTITION BY CLAUSE:
                        --standard windows function and also subquery clause of over clause
                        

SELECT* FROM EMP WHERE (SALARY,DNO) IN (select MAX(SALARY),DNO from EMP GROUP BY DNO);    --HOW TO SELECT DEPARTMENT WISE MAX SALARY EMP DETAILS


SELECT NO,NAME,SALARY,RANK() OVER(PARTITION BY DNO ORDER BY (SALARY) ASC) AS RNK FROM EMP;

                        SELECT NO,NAME,SALARY,DNO,RANK() OVER(PARTITION BY DNO ORDER BY (SALARY) ASC) AS RNK1 FROM EMP 
                        WHERE (SALARY,DNO) IN (select MAX(SALARY),DNO from EMP GROUP BY DNO);
                        
                        SELECT NO,NAME,SALARY,DNO,RANK() OVER(PARTITION BY DNO ORDER BY (SALARY) ASC) AS RNK1 FROM EMP 
                        WHERE SALARY = (select MAX(SALARY) from EMP);
                        
                        
SELECT * FROM (SELECT NO,NAME,SALARY,DNO,RANK() OVER(PARTITION BY DNO ORDER BY (SALARY) ASC) AS RNK FROM EMP) WHERE RNK=1;    

--SELECT * FROM (SELECT NO,NAME,SALARY,DNO,RANK()OVER(PARTITION BY DNO ORDER BY SAL DESC) AS RNK FROM EMP) WHERE RNK=1;
/*

Group By                                                                                        PARTITION BY

We get a limited number of records                                                  We get all records in a table 

It gives one row per group in result set. For example, we get a result          It gives aggregated columns with each record in the specified table.
for each group of DNO in the GROUP BY clause.



                                                                                We have 15 records in the Orders table. In the query output of SQL PARTITION BY,
                                                                                we also get 15 rows along with Min, Max and average values.                                                                         from DEPT;
*/

------------------------------------------------------------------------------------day-9----------------------------------------------------------------------------

-- group by:    It will try to divide the given data into different groups based on the given GROUPING column_name
                --and the select statement will try to select the data from divided tables from the orginal table, 
                --TRYS TO SHOW THE  OUTPUT ACCORDING TO GIVEN WINDOWS FUNCTION TO THE SELECT STSTEMENT OF PARENT QUERY
                
                    

select * from EMP;

SELECT MAX(SALARY) FROM EMP;

--MAX SAL FROM EACH DEPARTMENT 
SELECT MAX(SALARY),DNO FROM EMP; -- THEOUGH AN ERROR
SELECT MAX(SALARY),DNO FROM EMP GROUP BY DNO;
SELECT MAX(SALARY),DNO,NO FROM EMP GROUP BY DNO,NO;

SELECT MAX(SALARY) FROM EMP;

SELECT SALARY,DNO FROM EMP GROUP BY DNO;        --not a GROUP BY expressio

SELECT MAX(SALARY),DNO FROM EMP GROUP BY DNO;

SELECT DISTINCT * FROM EMP GROUP BY DNO;

--DISTENCT:
           -- USED ONLY TO RETURN ONLY DISTENCT(DIFFERENT) VALUES IN THE table SET 
           --TRYS TO RESTRICT THE REPETED AND SAME VALUES INTO THE TABLE SET, here we are trying to element the repeating AND SAME TYPE  OF DATA FROM ONE DATA BASE TO ANOTHER DATA.
           --THE RECORDS IN A TABLE DATA WHICH ARE REPETED NOT MORE THAN ONE TIME ARE CALLED UNIQUE TYPE OF RECORD DATA 
           --THE RECORDS IN A TABLE DATA WHICH ARE REPETED MORE THAN ONE TIME ARE CALLED DUPLICATED TYPE OF RECORD DATA
           --OTHER THAN THE DISTENCT DATA THE REMAINING DATA RECORDS WHICH ARE PRESENT IN THE ORGINAL TABLE SET ARE CALLED ALL DUPLICATES
           
        SELECT * FROM EMP;

        --SELECTING THE DISTENCT RECORDS FROM A CREATED TABLE IS DONE IN TWO WAYS :

        SELECT DISTINCT * FROM EMP;     --IT TRYS TO FETCH THE 


        --WE CAN ALSO SELECT THE DISTENCT DATA RECORDS FROM ONE DATA BASE TABLE TO ANOTHER DATA BASE TABLE WITH OUT USING 'DISTENCT'

        SELECT NO,NAME,SALARY,DNO FROM EMP GROUP BY NO,NAME,SALARY,DNO;     

        SELECT * FROM EMP GROUP BY NO,NAME,SALARY,DNO;
        -- HOW TO SELECT DESTENCT RECORDS FROM TABLE?
                -- WE CAN DO THIS IN TWO WAYS  BY USING 1. DISTINCT CLAUSE 
                --                                      2. GROUP BY CLAUSE  [HERE WE ARE GOING TO SELECTING THE ALL COLUMNS OF THE TABLE AND TRYING TO GROPING WITH SAME ALL SELECTED COLUMNS OF THE SAME TABLE WHICH WE ALREADY MENTIONED]
                --                                          WHAT EVER COLUMNS ARE PROVIDED IN GROUP BY CLAUSE ONLY THOSE COLUMNS ONLY PROVIDED IN SELECT LIST
                --                                          IF WE ARE USING OTHER COLUMNS WE NEED TO APPLY AGGREGATE FUNCTION
                --                                          WHAT EVER THE COLUMNS ARE IN THE SELECT LIST THERE SHOULD BE IN GROUP BY CLAUSE
                --                                          WHILE SELECTING THE DATA FROM GROUPED TABLES IT WILL TRY TO READ ONLY ONE RECORD FROM ONE GROUP DATA.
        -- HOW TO SELECT UNIQUE RECORDS FROM TABLE?

                    --IF WE ARE SELECTING DATA FROM GROUPS AND WE NEED TO FILTER THE DATA THEN WE NEED TO USE 'HAVING CLAUSE'
            
            SELECT DISTINCT * FROM EMP;     -- DISTENCT RECORD VALUS
            
            SELECT * FROM EMP GROUP BY NO,NAME,SALARY,DNO;      -- DISTENCT RECORD VALUS
            
            SELECT UNIQUE * FROM EMP;          --TRYS TO ELEMINATE THE REPEATED RECORDS FROM TABLE AND SHOW THE DISTENT TYPE OF RECORDS IN A TABLE 
             
            SELECT NO,NAME,SALARY,DNO FROM EMP GROUP BY NO,NAME,SALARY,DNO HAVING NO=4;
            
            SELECT NO,NAME,SALARY,DNO FROM EMP GROUP BY NO,NAME,SALARY,DNO HAVING COUNT(*)=1;       -- UNIQUE RECORD VALUS 
            
            SELECT NO,NAME,SALARY,DNO FROM EMP GROUP BY NO,NAME,SALARY,DNO HAVING COUNT(*)>1;
            SELECT NO,NAME,SALARY,DNO FROM EMP GROUP BY NO,NAME,SALARY,DNO HAVING COUNT(*) BETWEEN 2 AND 1000;      }------> DUPLICATE RECORDS
            SELECT NO,NAME,SALARY,DNO FROM EMP GROUP BY NO,NAME,SALARY,DNO HAVING COUNT(*) BETWEEN 2 AND 1000;
            
            
        -- ALL DUPLICATE RECORDS                                                                   
        SELECT NO,NAME,SALARY,DNO FROM EMP GROUP BY NO,NAME,SALARY,DNO HAVING COUNT(*)>1;

        SELECT NO, NAME, SALARY, DNO,ROWID FROM EMP;
            
                    SELECT * FROM EMP GROUP BY NO, NAME, SALARY, DNO;--THIS WILL GIVE DISTENCT VALUES
            
                    SELECT MAX(ROWID) FROM EMP GROUP BY NO, NAME, SALARY, DNO;--THIS WILL GIVE REPETED OR ALL DUPLICATE RECORDS OF A TABLE 
            
            SELECT NO, NAME, SALARY, DNO,ROWID FROM EMP WHERE ROWID IN (SELECT MAX(ROWID) FROM EMP GROUP BY NO, NAME, SALARY, DNO);
            SELECT NO, NAME, SALARY, DNO,ROWID FROM EMP WHERE ROWID NOT IN (SELECT MAX(ROWID) FROM EMP GROUP BY NO, NAME, SALARY, DNO);
            
--....................................................................
--DELETE THE DUPLICATE RECORDS FROM EMP_DELDUP
            -- IN RANK FUNCTION WE CAN NOT DELET THE DUPLICATE RECORDS

CREATE TABLE EMP_DELDUP AS SELECT * FROM EMP;

DELETE FROM EMP_DELDUP WHERE ROWID NOT IN (SELECT MAX(ROWID) FROM EMP_DELDUP GROUP BY NO, NAME, SALARY, DNO);

SELECT * FROM EMP_DELDUP;

ROLLBACK;


DELETE FROM EMP WHERE ROWID NOT IN 
(
SELECT MAX(ROWID) FROM (SELECT ROWID,ROW_NUMBER()OVER(PARTITION BY NO,NAME,SALARY,DNO ORDER BY NO,NAME,SALARY,DNO ) AS RN FROM EMP
)WHERE RN=2);
--..........................................................................................................................................................................
--                                      WHERE                                                                    HAVING
--..........................................................................................................................................................................

USED TO FILTER THE REQUIRED DATA FROM THE DATA BASE TABLE ACCORDING TO THE GIVEN        USED TO FILTER THE REQUIRED DATA FROM THE DATA BASE TABLE ACCORDING TO THE GROUP            
CONDITION GIVEN IN WHERE CLAUSE.                                                        BY CLAUSE LEVEL.

                                                                                        WE ARE USING THIS HAVING CLAUSE ONLY TO FILTER THE DATA GROUP BY CLAUSE LEVEL ONLY 
--............................................................................................................................................................................

-->ROW_NUMBER:

SELECT NO, NAME, SALARY, DNO,ROWID,ROW_NUMBER() OVER(PARTITION BY NO, NAME, SALARY, DNO ORDER BY NO, NAME, SALARY, DNO) AS ROW_NUMBER FROM EMP;
SELECT NO, NAME, SALARY, DNO,ROWID,Rank() OVER(PARTITION BY NO, NAME, SALARY, DNO ORDER BY NO, NAME, SALARY, DNO) AS Rank_NUMBER FROM EMP;
SELECT NO, NAME, SALARY, DNO,ROW_NUMBER() OVER(PARTITION BY NO, NAME, SALARY, DNO ORDER BY NO, NAME, SALARY, DNO) AS ROW_NUMBER FROM EMP;

SELECT * FROM (                                                                 -- TRYING TO SHOW THE DUPLICATE VALUES FROM A TABLE BY USING ROW_NUMBER FUNCTION
SELECT NO, NAME, SALARY, DNO,ROW_NUMBER() OVER(PARTITION BY NO, NAME, SALARY, DNO ORDER BY NO, NAME, SALARY, DNO) AS ROW_NUMBER FROM EMP)
WHERE ROW_NUMBER>1;


SELECT NO, NAME, SALARY, DNO, ROW_NUMBER,ROWID FROM (                                                                 -- TRYING TO SHOW THE DUPLICATE VALUES FROM A TABLE BY USING ROW_NUMBER FUNCTION
SELECT NO, NAME, SALARY, DNO,ROWID,ROW_NUMBER() OVER(PARTITION BY NO, NAME, SALARY, DNO ORDER BY NO, NAME, SALARY, DNO) AS ROW_NUMBER FROM EMP)
WHERE ROW_NUMBER>1;


--................................................................................;
SELECT NO, NAME, SALARY, DNO,ROWID,ROW_NUMBER() OVER(PARTITION BY NO, NAME, SALARY, DNO ORDER BY NO, NAME, SALARY, DNO) AS RN FROM EMP;

CREATE  TABLE DUPE AS 
((SELECT* FROM)
(SELECT * FROM
(
SELECT NO, NAME, SALARY, DNO,ROWID,ROW_NUMBER() OVER(PARTITION BY NO, NAME, SALARY, DNO ORDER BY NO, NAME, SALARY, DNO) AS RN FROM EMP
)
);

SELECT * FROM 
(
SELECT NO, NAME, SALARY, DNO,ROWID,ROW_NUMBER() OVER(PARTITION BY NO, NAME, SALARY, DNO ORDER BY NO, NAME, SALARY, DNO) AS RN FROM EMP
) WHERE RN>1;

DELETE FROM EMP WHERE ROWID IN 
(
SELECT ROWID FROM 
(SELECT ROWID,ROW_NUMBER()OVER(PARTITION BY NO,NAME,SALARY,DNO ORDER BY NO,NAME,SALARY,DNO) 
AS RN FROM EMP
)
WHERE RN>1);

rollback;

--*******************************************************************************************************
delete from emp e1 where rowid not in
(select max(rowid) from emp e2
where e1.no = e2.no );

commit;

select * from EMP;

delete from emp where rowid in
            (
             select rid from
                (
                  select rowid rid,
                  dense_rank() over(partition by no order by rowid
                ) rn
             from emp
            )
where rn > 1
);


-- BY USING THE SET OPERATORS WE CAN ABEL TO SHOW THE THAT UNIQUE RECORD DATA TABLE FROM A DUPLICATED RECORDS TABLE;
SELECT* FROM (SELECT NO, NAME, SALARY, DNO,ROWID,ROW_NUMBER() OVER(PARTITION BY NO, NAME, SALARY, DNO ORDER BY NO, NAME, SALARY, DNO) AS ROW_NUMBER FROM EMP)       --NO, NAME, SALARY, DNO, ROWID, ROW_NUMBER
MINUS
SELECT* FROM (SELECT * FROM (SELECT NO, NAME, SALARY, DNO,ROWID,ROW_NUMBER() OVER(PARTITION BY NO, NAME, SALARY, DNO ORDER BY NO, NAME, SALARY, DNO) AS ROW_NUMBER FROM EMP)WHERE ROW_NUMBER>1);      --NO, NAME, SALARY, DNO, ROW_NUMBER
commit;
ROLLBACK;
--................................................................;

--JOINS

        -- USED TO JOIN THE TWO OR MORE TABLES OF A  DATA BASE AND TRYS TO STORE THEM IN ANOTHER DATA BASE TABLE 
        -- IF WE WANT TO JOIN THE TWO TABLES, THAT BOTH THE TABLES SHOULD HAVE A JOINING COLUMN WITH SAME DATA TYPE [EVEN THOUGH THE COLUMN NAME IS DIFFERENT BUT THE DATA TUPE SHOULD BE THE SAME]
        -- WE CANNOT ABEL TO JOIN TWO TABLES BY THE HELP OF COLUMN NAME OF ONE TABLE AND COLUMN NAME OF ANOTHER TABLE.
        
SELECT * FROM EMP;

SELECT * FROM DEPT;
ALTER TABLE DEPT RENAME COLUMN LOCS TO LOC;


-- WE CAN JOIN TWO TABLES IN TWO WAYS 
                            --1. WHERE CLAUSE
                            --2. ON CLAUSE
        --BU USING WHERE CLAUSE:
--EQUI JOIN OR INNER JOIN
        SELECT NO,NAME,DNO,DNAME
        FROM EMP E,DEPT D                                       --THIS IS THE JOINING CONDITION OF TWO TABLES{EMP.DNO=DEPT.DEPTNO}
        WHERE E.DNO=D.DNO;
        
        SELECT NO,NAME,DNO,DNAME
        FROM EMP,DEPT                                       --WE CAN ALSO JOIN THE TWO COLUMNS OF TWO DIFFERENT TABLE WITHT OUT PROVIDING THE TABLE NAMES ALSO.
        WHERE DNO=DEPTNO;                                   -- BUT IN SOME CASES IT WONT WORK LIKE THE COLUMN NAMES OF TWO JOINING TABLES ARE SAME THEN WE SHOULD HAVE TO MENTION THE TABLE NAME WITH SELECTING COLUMN NAME.

-- WE CAN ALSO CREATE A TABLE ALSO BY THE JOINING OF TWO TABLES       
        
        
        CREATE TABLE EMP_DEPT AS
        SELECT NO,NAME,DNO,DNAME
        FROM EMP,DEPT                                       --THIS IS THE JOINING CONDITION OF TWO TABLES{EMP.DNO=DEPT.DEPTNO}
        WHERE EMP.DNO=DEPT.DEPTNO;                          
                                    -- IN JOINING CONDITION OF TWO TABLES OF A DATA BASE THEN IF WE USE THE OPERATOR '=' EQUAL TO THEN IT IS CALLED AS EQUIJION 
        
        
        DROP TABLE EMP_DEPT;
        
        SELECT NO,NAME,E.DNO,DNAME
        FROM EMP E,DEPT D                                      --WE CAN ALSO JOIN THE TWO COLUMNS OF TWO DIFFERENT TABLE WITHT OUT PROVIDING THE TABLE NAMES ALSO.
        WHERE E.DNO=D.DNO;                                   -- BUT IN SOME CASES IT WONT WORK LIKE THE COLUMN NAMES OF TWO JOINING TABLES ARE SAME THEN WE SHOULD HAVE TO MENTION THE TABLE NAME WITH SELECTING COLUMN NAME.
         
        SELECT E.NO,E.NAME,E.DNO,D.DNAME
        FROM EMP E,DEPT D                                      
        WHERE E.DNO=D.DNO;               --WE CAN ALSO PROVIDE ALIES NAMES FOR TABLE NAMES AND ALOS WE CAN INSERT THEM IN SELECTING COLUMN NAMES ALSO.
                                                                
        
        --BY USING THE "ON" CLAUSE 

        SELECT NO,NAME,SALARY,D.DNO,DNAME
        FROM EMP E JOIN DEPT D                                       --THIS IS THE JOINING CONDITION OF TWO TABLES{EMP.DNO=DEPT.DEPTNO}
        ON E.DNO=D.DNO;
        
--NON EQUI JOIN
--SELF JOIN
--CROSSJOIN
--NATURAL JOIN
--OUTER JOIN
            --LEFT OUTER JOUN
            --RIGHT OUTER JOIN
            --FULL OUTER JOIN
            
--SET OPERATORS
--EXIST VS IN
select sysdate from dual;           --2023-01-08 10:01:50 PMSELECT CEIL(10) FROM DUAL;
-- .............................................................DAY-10.............................................................

select sysdate from dual;               --2023-JAN-09 09:38:16


                        --TOPICS:   --EQUI JOIN
                                    --NON EQUI JOIN
                                    --SELF JOIN
                                    --CROSSJOIN
                                    --NATURAL JOIN
                                    --OUTER JOIN
                                                --LEFT OUTER JOUN
                                                --RIGHT OUTER JOIN
                                                --FULL OUTER JOIN
            
                                    --SET OPERATORS
                                    --EXIST VS IN
/*
delete * from emp where 
(SELECT NO, NAME, SALARY, DNO,ROWID,ROW_NUMBER() OVER(PARTITION BY NO, NAME, SALARY, DNO ORDER BY NO, NAME, SALARY, DNO) AS RN FROM EMP);


delete * from EMP
(
    SELECT * FROM 
                (                                                                 -- TRYING TO SHOW THE DUPLICATE VALUES FROM A TABLE BY USING ROW_NUMBER FUNCTION
                SELECT NO, NAME, SALARY, DNO,ROW_NUMBER() OVER(PARTITION BY NO, NAME, SALARY, DNO ORDER BY NO, NAME, SALARY, DNO) AS ROW_NUMBER FROM EMP
                )
)WHERE ROW_NUMBER>1;

*/



--EQUI JOIN/INNER JOIN:            IF WE USE '=' EQUAL OPERATOR IN JOINING CONDITION THEN IT IS SAD TO BE AN "EQUI JOIN" FUNCTION

        SELECT E.NO,E.NAME,D.DNO,D.DNAME
        FROM EMP E,DEPT D                                      --THIS IS THE JOINING CONDITION OF TWO TABLES{EMP.DNO=DEPT.DEPTNO}
        WHERE E.DNO=D.DEPTNO;

        -- WE CAN JOIN TWO TABLES IN TWO WAYS 
                                    
                                    
                                    --1. WHERE CLAUSE
                                    
                                    SELECT NO,NAME,D.DNO,D.DNAME
                                    FROM EMP E,DEPT D                                       --THIS IS THE JOINING CONDITION OF TWO TABLES{EMP.DNO=DEPT.DEPTNO}
                                    WHERE E.DNO=D.DNO;

                                    SELECT NO,NAME,SALARY,D.DNO,DNAME
                                    FROM EMP E INNER JOIN DEPT D                                     --THIS IS THE JOINING CONDITION OF TWO TABLES{EMP.DNO=DEPT.DEPTNO}
                                   ON D.DNO=E.DNO
                                   ORDER BY NO ASC;
                                   --SELECT * FROM EMP INNER JOIN ON EMP.DNO=DEPT.DNO ORDER BY NO ASC;
                                    
                                    --2. ON CLAUSE
                                    
                                    SELECT NO,NAME,SALARY,D.DNO,DNAME
                                    FROM EMP E JOIN DEPT D                                       --THIS IS THE JOINING CONDITION OF TWO TABLES{EMP.DNO=DEPT.DEPTNO}
                                    ON E.DNO=D.DNO;

--NON_EQUI JOIN:        IF WE USE OTHER THAN  EQUAL OPERATOR SUCH AS '!=,<,>,<=,>=' IN JOINING CONDITION THEN IT IS SAD TO BE AN "NON_EQUI JOIN" FUNCTION

                                    SELECT E.NO,E.NAME,D.DNO,D.DNAME
                                    FROM EMP E,DEPT D                                       --THIS IS THE JOINING CONDITION OF TWO TABLES{EMP.DNO=DEPT.DEPTNO}
                                    WHERE E.DNO!=D.DNO;
                                    
                                    SELECT * FROM EMP;
                                    SELECT * FROM DEPT;
                                    
                                    SELECT NO,NAME,SALARY,D.DNO,DNAME
                                    FROM EMP E JOIN DEPT D                                       --THIS IS THE JOINING CONDITION OF TWO TABLES{EMP.DNO=DEPT.DEPTNO}
                                    ON E.DNO!=D.DNO;



--NATURAL JOIN:   TRYS TO JOIN TWO TABLES  OF A DATA BASE IN THE BASES OF A COMMON COLUMN NAME AND FETCH THE REMAINING RECCORDS OF THE BOTH THE SELECTED TABLES RESPECTIVELY


        /*USED TO JOIN THE TWO TABLES OF A DATA BASE BY TRYING TO TAKE A COMMON COLUMN NAME WHICH IS PRESENT IN BOTH TABLES AND BASED ON THAT COLUMN NAME.
        IT TRYES TO TAKE IT AS JOINING COLUMN.
        AND IT WILL TRY TO FETCH THE REMAINING RECCORDS OF THE BOTH THE SELECTED TABLES RESPECTIVELY .
        THE COMMON COLUMN WILL BE FETCH ONLY ONCE AND REMAINING EACH COLUMNS OF BOTH THE RECORDS FETCH BASED ON EQUI JOIN RESULT. */

        SELECT * FROM EMP NATURAL JOIN DEPT;
        
        SELECT DNO, NO, NAME, SALARY, DNAME FROM EMP NATURAL JOIN DEPT;


--SELF JOIN;

--CROSS JOIN:       THE PRODUCT  NUMBER OF RECORDS IN BETWEEN BOTH THE TABLES 
--HERE IN A JOIN STATEMENT OF TWO TABLES IF WE ARE NOT PROVIDING ANY MATCHING CONDITION THEN IT WILL TRY TO TREET EVERY RECORD OF ONE TABLE IS MATCHING TO EVERY RECORD OF ANOTHER TABLE RECORDS 
            
            
           
            SELECT E.NO,E.NAME,E.SALARY,D.DNO,D.DNAME FROM EMP E,DEPT D;        
            SELECT E.NO,E.NAME,E.SALARY,D.DNO,D.DNAME FROM EMP E CROSS JOIN DEPT D;        
--IF WE GIVE WHERE CONDITION IN CROSS JOIN FUNCTION 
SELECT E.NO,E.NAME,E.SALARY,D.DNO,D.DNAME 
FROM EMP E,DEPT D 
WHERE E.DNO=D.DNO;  

SELECT E.NO,E.NAME,E.SALARY,D.DNO,D.DNAME 
FROM EMP E,DEPT D
WHERE E.DNO=D.DNO;

--OUTER JOIN:

SELECT E.NO,E.NAME,E.SALARY,D.DNO,D.DNAME 
FROM EMP E,DEPT D
WHERE E.DNO=D.DNO;
        --LEFT OUTER JOIN
            SELECT E.NO,E.NAME,E.SALARY,D.DNO,D.DNAME 
            FROM EMP E,DEPT D
            WHERE E.DNO=D.DNO(+);

            SELECT E.NO,E.NAME,E.SALARY,D.DNO,D.DNAME 
            FROM EMP E LEFT OUTER JOIN OJ D
            ON E.DNO=D.DNO;

            SELECT E.NO,E.NAME,E.SALARY,D.DNO,D.DNAME 
            FROM DEPT D LEFT OUTER JOIN EMP E
            ON D.DNO=E.DNO;

            SELECT E.NO,E.NAME,E.SALARY,D.DNO,D.DNAME 
            FROM EMPSS E LEFT OUTER JOIN OJ D
            ON D.DNO=E.DNO;

        --RIGHT OUTER JOIN 
            SELECT E.NO,E.NAME,E.SALARY,D.DEPTNO,D.DNAME 
            FROM EMPSS E,OJ D
            WHERE E.DNO(+)=D.DEPTNO;


            SELECT E.NO,E.NAME,E.SALARY,D.DEPTNO,D.DNAME 
            FROM EMPSS E RIGHT OUTER JOIN OJ D
            ON E.DNO(+)=D.DEPTNO;

            SELECT E.NO,E.NAME,E.SALARY,D.DEPTNO,D.DNAME 
            FROM OJ D RIGHT OUTER JOIN EMPSS E 
            ON D.DEPTNO(+)=E.DNO;
            
        --FULL OUTER JOIN:
            SELECT E.NO,E.NAME,E.SALARY,D.DEPTNO,D.DNAME 
            FROM EMPSS E,OJ D                                --THROUGHS AN ERROR >>a predicate may reference only one outer-joined table<<;
            WHERE E.DNO(+)=D.DEPTNO(+);      
            
            -->> BEFORE WE GOING TO THE FULL OUTER JOIN FIRST WE SHOULD HAVE TO KNOW ABOUT THE "SET OPERATORS";
                            
                            -- SET OPERATORS:   
                            -----------------------
                                        --GENERALLY
                            
                            CREATE TABLE A
                            (NO NUMBER, NAME VARCHAR2(20), SALARY NUMBER);
                            
                             CREATE TABLE B
                            (NO NUMBER, NAME VARCHAR2(20), SALARY NUMBER);
                        
                        --union:
                             
                            SELECT * FROM EMP
                            UNION                   -- UNION OF TWO TABLES OF EMP AND EMPSS
                            SELECT * FROM EMPSS;
                            
                            
                            --AND ALSO WE CAN CREATE THE NEW TABLES BY USING SET OPERATORS LIKE 
                            CREATE TABLE SAMPLE AS 
                            SELECT * FROM EMP
                            UNION                   -- UNION OF TWO TABLES OF EMP AND EMPSS
                            SELECT * FROM EMPSS;
                            
                            SELECT * FROM OJ
                            UNION                   -- UNION OF TWO TABLES OF EMP AND EMPSS
                            SELECT * FROM DEPT;                            
                            
                            
                            SELECT * FROM A
                            UNION                   -- UNION OF TWO TABLES OF EMP AND EMPSS
                            SELECT * FROM B;
                            
                            rollback;
                            
                        --union all
                        
                            SELECT * FROM A
                            UNION ALL                   -- UNION_ALL OF TWO TABLES OF EMP AND EMPSS
                            SELECT * FROM B;
                        
                        -- MINUS 
                            
                            SELECT * FROM A
                            MINUS                 -- MINUS OF TWO TABLES OF EMP AND EMPSS
                            SELECT * FROM B;                    
                            
                            SELECT * FROM B
                            MINUS                 
                            SELECT * FROM A;  
                            
                            
                            SELECT * FROM EMP
                            MINUS                 
                            SELECT * FROM EMPSS;                             
                            
                        --INTRESECT
                            SELECT * FROM A
                            INTERSECT                 
                            SELECT * FROM B; 
                            
                           
SELECT* FROM (SELECT NO, NAME, SALARY, DNO,ROWID,ROW_NUMBER() OVER(PARTITION BY NO, NAME, SALARY, DNO ORDER BY NO, NAME, SALARY, DNO) AS ROW_NUMBER FROM EMP)       --NO, NAME, SALARY, DNO, ROWID, ROW_NUMBER
MINUS
SELECT* FROM (SELECT * FROM (SELECT NO, NAME, SALARY, DNO,ROWID,ROW_NUMBER() OVER(PARTITION BY NO, NAME, SALARY, DNO ORDER BY NO, NAME, SALARY, DNO) AS ROW_NUMBER FROM EMP)WHERE ROW_NUMBER>1);      --NO, NAME, SALARY, DNO, ROW_NUMBER


CREATE TABLE EMP_A AS 
SELECT * FROM A;

CREATE TABLE EMP_B AS 
SELECT * FROM B;

-- IF WE TRY TO DO THE SET OPERATIONS ON ANY TWO  CREATED TABLES IN WHICH ONE OF THE TABLE IS NOT HAVING THE SAME NUMBER OF COLUMNS IN THAT TABLE 
--THEN IT WILL TRY TO TRIGER AN ERROR
SELECT * FROM EMP_A
UNION                         --"query block has incorrect number of result columns"
SELECT * FROM EMP_B;


--THNE THE SOLUTOIN IS THAT PROVIDING 'NULL' AT COLUMN NAME OF THAT TABLE 

SELECT NO, NAME, SALARY FROM EMP_A
UNION
SELECT NO, NAME,NULL FROM EMP_B;


            --FULL OUTER JOIN:
            
            
                    SELECT E.NO,E.NAME,E.SALARY,D.DEPTNO,D.DNAME 
                    FROM EMPSS E,OJ D                                --LEFT OUTER JOIN;
                    WHERE E.DNO=D.DEPTNO(+);      
                    
                    
                    SELECT E.NO,E.NAME,E.SALARY,D.DEPTNO,D.DNAME 
                    FROM EMPSS E,OJ D                                --RIGHT OUTER JOIN;
                    WHERE E.DNO(+)=D.DEPTNO; 


                    SELECT E.NO,E.NAME,E.SALARY,D.DEPTNO,D.DNAME 
                    FROM EMPSS E,OJ D                                
                    WHERE E.DNO=D.DEPTNO(+)     
                    UNION           
                    SELECT E.NO,E.NAME,E.SALARY,D.DEPTNO,D.DNAME 
                    FROM EMPSS E,OJ D                                --FULL OUTER OUTER JOIN;
                    WHERE E.DNO(+)=D.DEPTNO; 
                    
SELECT E.NO,E.NAME,E.SALARY,D.DEPTNO,D.DNAME 
FROM EMPSS E,OJ D                                
WHERE E.DNO=D.DEPTNO(+)     
UNION ALL          
SELECT E.NO,E.NAME,E.SALARY,D.DEPTNO,D.DNAME 
FROM EMPSS E,OJ D                                --RIGHT OUTER OUTER JOIN;
WHERE E.DNO(+)=D.DEPTNO 

MINUS

SELECT E.NO,E.NAME,E.SALARY,D.DEPTNO,D.DNAME 
FROM EMPSS E,OJ D                                
WHERE E.DNO=D.DEPTNO(+)     
UNION         
SELECT E.NO,E.NAME,E.SALARY,D.DEPTNO,D.DNAME 
FROM EMPSS E,OJ D                                --FULL OUTER OUTER JOIN;
WHERE E.DNO(+)=D.DEPTNO; 


        --SELF JOIN;
        SELECT * FROM SAMPLE;
        
        SELECT A.NO, A.NAME, A.SALARY, A.MANAGER,B.NAME AS MANAGER
        FROM SAMPLE A, SAMPLE B
        WHERE A.MANAGER = B.NO;
        
        SELECT A.NO, A.NAME, A.SALARY, A.MANAGER,B.NAME AS MANAGER
        FROM SAMPLE A, SAMPLE B
        WHERE A.MANAGER = B.NO
        ORDER BY B.MANAGER;


--EXISTS Vs IN OPERATOR
--EXIST:        USED TO CHECK ONE OF THE TABLE INFOR MATION IS IN ANOTHER TABLE OR NOT 
SELECT DNO FROM DEPT;

SELECT * FROM EMP;

SELECT * FROM EMP  WHERE DNO IN (SELECT DNO FROM DEPT);     --PERFORMANCE ISSUE

SELECT * FROM EMP E  WHERE EXISTS (SELECT 1 FROM DEPT D WHERE D.DNO=E.DNO);         -- HERE IT ACT AS IN THE FORM OF CORELATIONAL SUBQUERY  -- GOOD IN PERFORMANCE

SELECT NO, NAME, SALARY, DNO,ROWID FROM EMP E  WHERE EXISTS (SELECT DNO FROM DEPT D WHERE D.DNO=E.DNO);

SELECT NO, NAME, SALARY, DNO,ROWID FROM EMP E  WHERE NOT EXISTS (SELECT DNO FROM DEPT D WHERE D.DNO=E.DNO); --



--INDEX
--VIEW
--TUNE QUERY
--ROLLUP

----------------------------------------------------------------------------------DAY-11 -----------------------------------------------------------------------------------------------------------------------


--                      topics:

                                --INDEX
                                --VIEW
                                --TUNE QUERY
                                --ROLLUP
/*
--here we are going to do that 
                            --by taking a select statement query of selecting the rowids of the table emp by using partition by clause 
SELECT NO, NAME, SALARY, DNO,rowid from emp where rowid in (
                                    select rid from
                                    (
                                        select no,name,salary,rowid rid,dense_rank() over(partition by no order by rowid)
                                        rn from emp
                                    )
                                    where rn > 1
                                );
*/

--EXISTS Vs IN OPERATOR
--EXIST:        USED TO CHECK ONE OF THE TABLE INFOR MATION IS IN ANOTHER TABLE OR NOT 
SELECT DNO FROM DEPT;

SELECT * FROM EMP;

--IN: IT IS GENERALLY USED TO DATA TABLES WHICH ARE HAVING VERY SMALL AMOUNT OF RECORDS IN THAT TABLE 
        -- IT IS A MISLENIOUS UPERATOR
SELECT * FROM EMP  WHERE DNO IN (SELECT DNO FROM DEPT);     --PERFORMANCE ISSUE

--EXISTS:   IT IS GENERALLY USED TO DATA TABLES WHICH ARE HAVING VERY LARGE AMOUNT OF DATA RECORDS IN THE GIVEN TABLE 
SELECT * FROM EMP E  WHERE EXISTS (SELECT 1 FROM DEPT D WHERE D.DNO=E.DNO);         -- HERE IT ACT AS IN THE FORM OF CORELATIONAL SUBQUERY  -- GOOD IN PERFORMANCE

SELECT NO, NAME, SALARY, DNO,ROWID FROM EMP E  WHERE EXISTS (SELECT DNO FROM DEPT D WHERE D.DNO=E.DNO);

SELECT NO, NAME, SALARY, DNO,ROWID FROM EMP E  WHERE NOT EXISTS (SELECT DNO FROM DEPT D WHERE D.DNO=E.DNO); --

--example********************************************************************************

--how to select select the duplicated recorsd from EMP table by using "EXISTS" OPERATOR

SELECT NO, NAME, SALARY, DNO,ROWID FROM EMP E  WHERE EXISTS (SELECT DNO FROM DEPT D WHERE D.DNO=E.DNO);

--q3
SELECT NO, NAME, SALARY, DNO, ROWID,ROW_NUMBER FROM 
(
SELECT * FROM 
            (
                SELECT NO, NAME, SALARY, DNO,ROWID,ROW_NUMBER() OVER(PARTITION BY NO, NAME, SALARY, DNO ORDER BY NO, NAME, SALARY, DNO) AS ROW_NUMBER FROM EMP A
            )WHERE EXISTS (SELECT 1 FROM EMP B WHERE B.ROW_NUMBER>=A.ROW_NUMBER)
)WHERE ROW_NUMBER>1;

--........................................................................................................

--ROLLUP


SELECT MAX(SALARY), DNO FROM EMP GROUP BY DNO;      --IT IS TRYING TO SHOW THE MAX SALARY OF EACH GROUP OF DNO


SELECT MAX(SALARY) AS RANGE,DNO
FROM EMP GROUP BY DNO ORDER BY RANGE DESC;          --IT IS TRYING TO SHOW THE MAX SALARY OF EACH GROUP OF DNO


SELECT SUM(SALARY), DNO FROM EMP GROUP BY DNO;      -- IT IS TRYING TO SHOW THE summation salary values of each group

SELECT DNO,SALARY FROM EMP GROUP BY DNO;            --not a GROUP BY expression

SELECT DNO,SALARY FROM EMP GROUP BY DNO,ROLLUP(SALARY); --HERE INTHIS CASE WE USALY WE GET "NULL" VALUE IN RESULT OUTPUT 

--IF WE WANT TO GET SUM OF VALUE OF EACH AND EVERY GROUP OF SALARY VALUES 
SELECT DNO,SUM(SALARY) FROM EMP GROUP BY DNO,ROLLUP(SALARY); 


--WE CAN ALSO SHOW ONLY THE SUM VALUE OF GROUP BY SALARY VALUES OF EMP TABLE BY USING 'CASE FUNCTION'

SELECT DNO,CASE WHEN SALARY IS NULL THEN 'TOTAL' ELSE 'COL' END AS RANGE,SUM(SALARY) FROM EMP GROUP BY DNO,ROLLUP(SALARY);

SELECT * FROM
(
SELECT DNO,CASE WHEN SALARY IS NULL THEN 'TOTAL' ELSE 'COL' END AS RANGE,SUM(SALARY) FROM EMP GROUP BY DNO,ROLLUP(SALARY)
) WHERE RANGE='TOTAL';

SELECT SUM(SALARY),DNO FROM EMP GROUP BY DNO;


--BY USING DECODE FUNCTION FROM STRING FUNCTION
SELECT * FROM
(
SELECT DNO,DECODE(SALARY,NULL,'TOTAL','COL')AS RANGE,SUM(SALARY) AS SALARY FROM EMP GROUP BY DNO,ROLLUP(SALARY)
)WHERE RANGE='TOTAL';
--.................................................................................................................

--INDEX:        USED TO RETRIVE THE DATA FROM DATA BASE OF A TABLE MORE QUICKELY
                --USED TO SPEED UP THE PARTICULAR QUERIES WHICH WE ARE GOING TO EXICUTE 
                -- A USER CAN'T ABEL TO SEE THESE INDEX OF A PARTICULAR TABLE 
/*  TYPES OF INDEXES:

            BTREE/NON UNIQUE INDEX
            UNIQUE INDEX
            COMPOSIT INDEX
            BITMAP INDEX
            
*/


--FROM LEFT OUTER JOIN
SELECT A.NO, A.NAME, A.SALARY,B.DEPTNO, B.DNAME
FROM EMPSS A,OJ B
WHERE A.DNO=B.DEPTNO;

        --BTREE/NON UNIQUE INDEX:
        
                --CREATING INDEX ON 'OJ' TABLE:

                        CREATE INDEX I_DEPTNO ON OJ(DEPTNO);

                -- DROPING OF INDEX

                        DROP INDEX I_DEPTNO;
                        
                        
        --UNIQUE INDEX:
                        --IF A COLUMN OF A TABLE IS HAVING A 'PRIMARY KEY' WE NO NEED TO CREATE A INDEX 
                        --DEFAULT IT WILL CREATES AN INDEX CALLED AS "UNIQUE INDEX"
            -- CREATING A UNIQUE INDEX FOR A COLUMN OF A CREATED TABLE:
                        
                        CREATE UNIQUE INDEX U_DEPTNO ON OJ(DEPTNO);
                        
                        DROP INDEX U_DEPTNO;
            --CREATING A PRIMARY KEY CONSTRAINT IN A CREATED TABLE AT ALTER LEVEL
            
                    ALTER TABLE OJ ADD CONSTRAINT PK_DEPTNO PRIMARY KEY (DEPTNO); 
            
            --DROPING A PRIMARY KEY CONSTRAINT IN A CREATED TABLE AT ALTER LEVEL
            
                    ALTER TABLE OJ DROP CONSTRAINT PK_DEPTNO;       
                    
                    ROLLBACK;
                    
            SELECT A.NO, A.NAME, A.SALARY,B.DEPTNO, B.DNAME
            FROM EMPSS A,OJ B
            WHERE A.DNO=B.DEPTNO;
        
        
        --COMPOSIT INDEX:
                
                CREATE INDEX IN_DEPTNO_LOCATION ON OJ (DEPTNO,LOCATION);
                
                DROP INDEX IN_DEPTNO_LOCATION ;
                
        --BITMAP INDEX:
        
        
                ALTER TABLE OJ ADD GENDER VARCHAR2(6);
                COMMIT;
                
                 ALTER TABLE OJ DROP COLUMN GENDER;
                COMMIT;
                
                CREATE BITMAP INDEX IN_GENDER ON OJ (GENDER);
                
--.....................................................................................................................................

--VIEWS:

WHAT IS DIFFERANCE BETWEEN VIEWS AND DATA CONTROL LANGUAGE COMPONENTS [GRANT, REVOKE]?

        --TYPES:
                --SIMPLE VIEW
                --COMPLEX VIEW
                --MATERIALIZED VIEW
                
                
            --SIMPLE VIEW:  TRYING TO SELECTING THE DATA FROM ONE TABLE 
                
                
                SELECT * FROM EMPSS;
                
                CREATE VIEW V_EMPSS AS 
                SELECT NO, NAME, DNO FROM EMPSS;
                
                SELECT * FROM V_EMPSS;
                
            --COMPLEX VIEW; TRYING TO SELECTING THE DATA FROM MORE THAN ONE TABLE.

                    CREATE VIEW V_FULLOUTER AS
                    SELECT E.NO,E.NAME,E.SALARY,D.DEPTNO,D.DNAME 
                    FROM EMPSS E,OJ D                                
                    WHERE E.DNO=D.DEPTNO(+)     
                    UNION           
                    SELECT E.NO,E.NAME,E.SALARY,D.DEPTNO,D.DNAME 
                    FROM EMPSS E,OJ D                                --FULL OUTER OUTER JOIN;
                    WHERE E.DNO(+)=D.DEPTNO; 
                    
                    
                    SELECT * FROM V_FULLOUTER;
                    
                    DROP VIEW V_FULLOUTER;
                    
--MATERIALIZED VIEW: IT IS USED BY THE REPORTING TEAM TO GENERATING THE DATA BY DOING SOME AGGREGATE CALCULATIONS IN 'MV',
                    --THEY WANT TO STORE AND GENERATE THE REPORTS NO THERE PORPOSESS
            
                                --WE CAN CREATE A MATERIALZED VIEW GENERALLY TO CALCULATE THE AGGREGATE CALCULATIONS 
                                --AND IF WE WANT TO STORE THE INFORMATION ONE OF THE LOCATION, IF WE WANT TO PROVIDE THAT INFO TO THE REPORTING TEAM
                                -- IN MATERIALIZED VIEW WITH OUT REFRESHING WE CAN NOT ABEL TO SEE THE UPDATED NEW DATA 
                                -- BUT IN NORMAL,COMPLEX VIEWS WE CAN ABEL TO SEE THE UPDATED DATE IMMEDIATELY.
                --CREATING A MATERIALIZED VIEW:
                            CREATE MATERIALIZED VIEW MVIEW1 
                            REFRESH 
                            START WITH SYSDATE NEXT SYSDATE + 1 
                            COMPLETE AS 
                            SELECT 
                                AVG(SALARY) AS A_SAL
                            FROM EMPSS;
                            
                --SELECTING OF A CREATED MATERIALIZED VIEW
                        SELECT * FROM MVIEW1 ;
                --DROPING OF A CREATED MATERIALIZED VIEW                        
                        DROP MATERIALIZED VIEW MVIEW1;
                        DBMS_MVIEW. REFRESH;
                        
                --REFREASHING A MATERIALIZED VIEW
                
                --BEGIN DBMS_SNAPSHOT.REFRESH( '"JUNE"."MVIEW1"','C'); end;
                
-- -------------------------------------------------------------------------------( DAY-12 )------------------------------------------------------------------------------------------------
SELECT SYSDATE FROM DUAL;                                       --11-JANUARY-2023 WEDNESDAY 09:41:04 AM

/*                                                   TOPICS : TUNE QUERY
                                                              MERGE
                                                              SAVE POINT
                                                              WITH
                                                              SQL QUERY OPTIMIZATION
                                                              DWH CONSEPTS
                             
*/

--MERGE:
            --IN a single select statement in a single query we we have to do the crud operators like select,update,insert ON ONE TABLE2 AND INSERT THEM IN TABLE2
            --12q1 --> {cant we able to do the delete operation in MERGE FUNCTION}
--IT MEANS SELECT DATA FROM TOYS TABLE AS T1 AND UPDATE IN BRICKS TABLE T2 IF ALREADY EXIST AND IF NOT EXIST THEN  INSERT THE MISSING/NEW RECORDS INTO THE TABLE T1 FROM TABLE T2 OF TABLES TABLE TOYS .


CREATE TABLE STUDENT1
(
NO NUMBER,
NAME VARCHAR2(20),
MARKS NUMBER
);

CREATE TABLE STUDENT2
(
NO NUMBER,
NAME VARCHAR2(20),
MARKS NUMBER
);

SELECT * FROM STUDENT1
UNION
SELECT * FROM STUDENT2;

                    MERGE INTO STUDENT1 A USING (SELECT * FROM STUDENT2 ) B
                    ON (A.NO=B.NO)
                    WHEN MATCHED THEN 
                    UPDATE SET A.MARKS=B.MARKS
                    WHEN NOT MATCHED THEN
                    INSERT (A.NO,A.NAME,A.MARKS) VALUES (B.NO,B.NAME,B.MARKS);
                    
                    ROLLBACK;
                    
                    SELECT * FROM STUDENT1;
                    
                    -- IF WE WANT TO UPDATE THE STUDENT NAME AND MARKS  FROM STUDENT2 TABLE TO TABLE 1 THEN 
                    UPDATE STUDENT2 SET NAME='REKAPALLI LOKPAVAN' WHERE NO=1;
                    ROLLBACK;
                    SELECT * FROM STUDENT2;
                    
                    MERGE INTO STUDENT1 A USING (SELECT * FROM STUDENT2 ) B
                    ON (A.NO=B.NO)
                    WHEN MATCHED THEN 
                    UPDATE SET A.NAME=B.NAME, A.MARKS=B.MARKS
                    WHEN NOT MATCHED THEN
                    INSERT (A.NO,A.NAME,A.MARKS) VALUES (B.NO,B.NAME,B.MARKS);

--..........................................................


--WITH CLAUSE:
                --USED TO FIND THE AVERAGE SALARY VALUE OF EMP TABLE 
                SELECT AVG(SALARY) FROM EMP;
                SELECT AVG(SALARY)FROM (SELECT AVG(SALARY) AS SALARY FROM EMP GROUP BY DNO);
                
                
                        --BY USING THE 'WITH CLAUSE' THEN 
                        
                        WITH FINAL AS (SELECT AVG(SALARY) SAL FROM EMP)
                        SELECT * FROM EMP 
                        WHERE SALARY > (SELECT SAL FROM FINAL);                 -- THIS IS IN THE FORM OF CORELATED SUBQUERY
                        
                        SELECT * FROM EMP 
                        WHERE SALARY > (SELECT AVG(SALARY) SAL FROM EMP);
                        
        --save point 
        
        --sql query optimization
        
        --QUERY TUNING:
        
            --STEP-I: EXICUTE QUERY IN EXPLAIN PLAN
            --........................................
            
                SELECT NO,NAME,B.DEPTNO,B.DNAME
                FROM EMPSS A,OJ B                                       
                WHERE A.DNO=B.DEPTNO;
                
            --STEP-II: COLLECT STATS ON TABLES
            
                    ANALYZE TABLE EMPSS COMPUTE STATISTICS;
                    
            --STEP-III: TRY TO APPLY HINTS.
            
                    SELECT /*FIRST_ROWS*/ NO,NAME,B.DEPTNO,B.DNAME
                    FROM EMPSS A,OJ B                                       
                    WHERE A.DNO=B.DEPTNO;
                    
                    SELECT /*PARLLEL(A,5)*/ NO,NAME,B.DEPTNO,B.DNAME
                    FROM EMPSS A,OJ B                                       
                    WHERE A.DNO=B.DEPTNO;