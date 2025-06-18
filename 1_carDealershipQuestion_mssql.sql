--https://sqlize.online/s/pE
-- DROP TABLES IF THEY EXIST
IF OBJECT_ID('sales', 'U') IS NOT NULL DROP TABLE sales;
IF OBJECT_ID('cars', 'U') IS NOT NULL DROP TABLE cars;
IF OBJECT_ID('customers', 'U') IS NOT NULL DROP TABLE customers;
IF OBJECT_ID('employees', 'U') IS NOT NULL DROP TABLE employees;
IF OBJECT_ID('departments', 'U') IS NOT NULL DROP TABLE departments;

-- CREATE TABLES

CREATE TABLE departments (
    id INT NOT NULL PRIMARY KEY,
    Name VARCHAR(25) NOT NULL
);

CREATE TABLE employees (
    id INT NOT NULL PRIMARY KEY,
    FName VARCHAR(35) NOT NULL,
    LName VARCHAR(35) NOT NULL,
    PhoneNumber VARCHAR(11),
    ManagerId INT NULL,
    DepartmentId INT NOT NULL,
    Salary INT NOT NULL,
    HireDate DATETIME NOT NULL,
    FOREIGN KEY (ManagerId) REFERENCES employees(id),
    FOREIGN KEY (DepartmentId) REFERENCES departments(id)
);

CREATE TABLE customers (
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    FName VARCHAR(35) NOT NULL,
    LName VARCHAR(35) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(11),
    PreferredContact VARCHAR(5) NOT NULL
);

CREATE TABLE cars (
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Model VARCHAR(50) NOT NULL,
    Color VARCHAR(50) NOT NULL,
    TotalCost INT NOT NULL,
    CONSTRAINT UQ_Model_Color_Cost UNIQUE (Model, Color, TotalCost)
);

-- INSERT DATA

-- Departments
INSERT INTO departments (id, Name) VALUES
    (1, 'HR'),
    (2, 'Sales'),
    (3, 'Tech');

-- Employees
INSERT INTO employees (id, FName, LName, PhoneNumber, ManagerId, DepartmentId, Salary, HireDate) VALUES
    (1, 'James', 'Smith', '1234567890', NULL, 1, 1000, '2002-01-01'),
    (2, 'John', 'Johnson', '2468101214', 1, 1, 400, '2005-03-03'),
    (3, 'Michael', 'Williams', '1357911131', 1, 2, 600, '2009-05-12'),
    (4, 'Johnathon', 'Smith', '1212121212', 2, 1, 500, '2016-07-07'),
    (5, 'William', 'Morris', '5555555555', 1, 2, 800, '2009-08-05');

-- Customers
INSERT INTO customers (FName, LName, Email, PhoneNumber, PreferredContact) VALUES
    ('William', 'Jones', 'william.jones@example.com', '3347927472', 'PHONE'),
    ('David', 'Miller', 'dmiller@example.net', '2137921892', 'EMAIL'),
    ('Richard', 'Davis', 'richard0123@example.com', NULL, 'EMAIL'),
    ('Elon', 'Musk', 'bigrocketguy@twitter.com', NULL, 'EMAIL'),
    ('John', 'Dutton', 'yellowstoneranch@paramount.com', NULL, 'EMAIL');

-- Cars
INSERT INTO cars (Model, Color, TotalCost) VALUES
    ('Ford F-150', 'Black', 230),
    ('Ford F-150', 'Silver', 200),
    ('Ford Mustang', 'Red', 350),
    ('Tesla Model 3', 'Blue', 325),
    ('Ford F-350', 'Brown', 500);
    
Select * from cars;

-- TASK 1 GOAL: 
--      The car dealership owner wants to set a markup on the TotalCost of cars, and be able
--      to track the number of cars in inventory.
--      
--      The markup percentage per model should be as follows:
--          Ford F series (any size) = 15%    Tesla = 25%  Ford Mustang = 10%
--      A markup percentage is required to be defined per vehicle after your changes
--      and a default markup percentage of 10% should be defined for any future cars.
--
--      There is currently an inventory of 5 for each model on the showroom floor.
--      
--      Write the required SQL Commands to ALTER the above tables and insert/update 
--          data to support the new requirements.
--
-- TASK 1.5 GOAL:
--      Write an "INSERT" Command that will add inventory as it is received from shippers.
--      Use a Blue Ford Mustang that costs the dealership $350 as your insert example.
--
--          Q/A: How would you handle the insert if the color was 'Red' instead?
