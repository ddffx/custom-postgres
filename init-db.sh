#!/bin/bash
set -e 
echo "******CREATING "$DB_NAME" DATABASE******"
psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" <<-EOSQL
    CREATE USER "$DB_USER";
    CREATE DATABASE "$DB_NAME";
    GRANT ALL PRIVILEGES ON DATABASE "$DB_NAME" TO "$DB_USER";
EOSQL

echo ""
echo "****** "$DB_NAME" DATABASE CREATED******"

echo "******CREATING Tables in Database "$DB_NAME" ******"

psql -v ON_ERROR_STOP=1 -d "$DB_NAME" -U "$DB_USER" <<-EOSQL
    CREATE TABLE COMPANY(
        ID INT PRIMARY KEY     NOT NULL,
        NAME           TEXT    NOT NULL,
        AGE            INT     NOT NULL,
        ADDRESS        CHAR(50),
        SALARY         REAL,
        JOIN_DATE	  DATE
    );
    CREATE TABLE DEPARTMENT(
        ID INT PRIMARY KEY      NOT NULL,
        DEPT           CHAR(50) NOT NULL,
        EMP_ID         INT      NOT NULL
    );
EOSQL

echo ""
echo "****** Tables CREATED******"

echo "***** Insert Data *******"
psql -v ON_ERROR_STOP=1 -d "$DB_NAME" -U "$DB_USER" <<-EOSQL
    INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY,JOIN_DATE) VALUES (1, 'Paul', 32, 'California', 20000.00 ,'2001-07-13');
    INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,JOIN_DATE) VALUES (2, 'Allen', 25, 'Texas', '2007-12-13');
EOSQL

echo ""
echo "****** Data Inserted******"