CREATE DATABASE X;



-- Create a table for Publishers
CREATE TABLE Publishers (
    PublisherID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(255)
);

-- Create a table for Authors
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE
);

-- Create a table for Books
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    PublicationYear YEAR,
    AuthorID INT,
    PublisherID INT,
    Price DECIMAL(10, 2) CHECK (Price > 0), -- Constraint ensuring Price is greater than 0
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID) ON DELETE SET NULL,
    FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID) ON DELETE SET NULL
);






-- Functional Dependence
USE bits;

SELECT *
FROM consultant;

