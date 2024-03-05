CREATE DATABASE insert_data;
SHOW TABLES;
USE insert_data;

-- 1. Using basic insert statement (We have covered this already).

-- 2. Using MySQL Workbench import Wizard
-- Right click on database -> Table Data Import Wizard -> Browse and load from file

-- 3. Using SQL commands (Code)
-- using rottentomatoes.csv on Canvas course space.
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
 
LOAD DATA LOCAL INFILE "C:/Users/rodge/Downloads/rottentomatoscores.csv"
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
 
