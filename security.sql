-- Creating a new user in MySQL
-- Administration>> Users and Privileges>> root (shows root password created during installation)
-- Add account to add a new account>> Create Login name, change authenitcation type, set password

CREATE USER 'Kennedy'@'localhost' IDENTIFIED BY 'password';

GRANT SELECT, INSERT, UPDATE ON bits_copy.* TO 'Kennedy'@'localhost';
FLUSH PRIVILEGES;

-- Flush privileges is a user management feature that tells 
-- the server to reload the grant tables from the disk and clear the cache for faster access

REVOKE INSERT ON bits_copy.* FROM 'Kennedy'@'localhost';
FLUSH PRIVILEGES;
