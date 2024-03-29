CREATE DATABASE insert_data_class;
SHOW TABLES;
USE insert_data;

SELECT *
FROM rottentomatoscores;

-- using rottentomatoes.csv on Canvas course space.
-- 1. Using basic insert statement (We have covered this already).

-- 2. Using MySQL Workbench import Wizard
-- Right click on database -> Table Data Import Wizard -> Browse and load from file

-- 3. Using SQL commands (Code)

-- You don't need to have an existing table but you can create one in the import process
-- import .csv file and update column names and data types afterwards

-- USING CODE

-- Database->Manage Connections-> Click instance on LHS-> Advanced -> "Others" dialogue box 
-- Type " OPT_LOCAL_INFILE=1" 

SHOW GLOBAL VARIABLES LIKE'local_infile';

SET GLOBAL local_infile = TRUE;

-- First create empty table. The rows on the table should match those of the .csv file
 CREATE TABLE rotten_tomatoes1(
	id INT,
   movie VARCHAR(255),
    rating VARCHAR(6));
    
    SELECT COUNT(*)
    FROM rotten_tomatoes1;
    
LOAD DATA LOCAL INFILE "C:/Users/rodge/Downloads/rottentomatoscores.csv" --  use forward slashes
INTO TABLE rotten_tomatoes1 -- You have to create this table in advance
FIELDS TERMINATED BY ','-- This means we are using a .csv file
ENCLOSED BY '"'-- means that values with a comma inside should be wrapped in the double quotation marks
LINES TERMINATED BY '\n' -- mean that after a newline symbol \n the next line in our CSV file starts.;
IGNORE 1 ROWS (id, movie, rating);

-- import into an existing table. Useful when updating existing tables
LOAD DATA LOCAL INFILE "C:/Users/rodge/Downloads/mobile_phone_prices.csv"
INTO TABLE mobile_phone_prices -- You have to create this table in advance
FIELDS TERMINATED BY ','-- This means we are using a .csv file
ENCLOSED BY '"'-- means that values with a comma inside should be wrapped in the double quotation marks
LINES TERMINATED BY '\n' -- mean that after a newline symbol \n the next line in our CSV file starts.;
IGNORE 1 ROWS (battery_power , bluetooth , clock_speed  , dual_sim,four_g,        
front_camera ,int_memory, mobile_depth,mobile_weight,
pc, price_range, px_height, px_width ,ram,           
 sc_h,sc_w,talk_time,three_g  ,touch_screen,wifi );
 
 -- Loading text data into database
LOAD DATA LOCAL INFILE "C:/Users/rodge/Downloads/Sample text data.txt"  INTO TABLE rotten_tomatoes;
-- By default LOAD DATA INFILE uses tab delimited, one row per line


-- 4. Importing data from a different database
-- create table in current table with same column names 
-- use INSERT command

CREATE TABLE Guide
(GuideNum CHAR(4) PRIMARY KEY,
LastName CHAR(15),
FirstName CHAR(15),
Address CHAR(25),
City CHAR(25),
State CHAR(2),
PostalCode CHAR(5),
PhoneNum CHAR(12),
HireDate DATE );

INSERT INTO Guide (SELECT * FROM colonial.guide );

-- 
 
