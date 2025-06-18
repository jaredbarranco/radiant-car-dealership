--https://sqlize.online/s/tE
-- DROP TABLES IF EXIST
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS cars;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

-- SCHEMA DEFINITIONS

CREATE TABLE departments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(25) NOT NULL
);

CREATE TABLE employees (
    id INT NOT NULL PRIMARY KEY,
    FName VARCHAR(35) NOT NULL,
    LName VARCHAR(35) NOT NULL,
    PhoneNumber VARCHAR(11),
    ManagerId INT,
    DepartmentId INT NOT NULL,
    Salary INT NOT NULL,
    HireDate DATETIME NOT NULL,
    FOREIGN KEY (ManagerId) REFERENCES employees(id),
    FOREIGN KEY (DepartmentId) REFERENCES departments(id)
);

CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    FName VARCHAR(35) NOT NULL,
    LName VARCHAR(35) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(11),
    PreferredContact VARCHAR(5) NOT NULL
);

CREATE TABLE cars (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Model VARCHAR(50) NOT NULL,
    Color VARCHAR(50) NOT NULL,
    TotalCost INT NOT NULL,
    UNIQUE KEY unique_model_color_cost (Model, Color, TotalCost)
);

-- DATA INSERTS

INSERT INTO departments (id, Name) VALUES
    (1, 'HR'),
    (2, 'Sales'),
    (3, 'Tech');

INSERT INTO employees (id, FName, LName, PhoneNumber, ManagerId, DepartmentId, Salary, HireDate) VALUES
    (1, 'James', 'Smith', '1234567890', NULL, 1, 1000, '2002-01-01'),
    (2, 'John', 'Johnson', '2468101214', 1, 1, 400, '2005-03-03'),
    (3, 'Michael', 'Williams', '1357911131', 1, 2, 600, '2009-05-12'),
    (4, 'Johnathon', 'Smith', '1212121212', 2, 1, 500, '2016-07-07'),
    (5, 'William', 'Morris', '5555555555', 1, 2, 800, '2009-08-05');

INSERT INTO customers (id, FName, LName, Email, PhoneNumber, PreferredContact) VALUES
    (1, 'William', 'Jones', 'william.jones@example.com', '3347927472', 'PHONE'),
    (2, 'David', 'Miller', 'dmiller@example.net', '2137921892', 'EMAIL'),
    (3, 'Richard', 'Davis', 'richard0123@example.com', NULL, 'EMAIL'),
    (4, 'Elon', 'Musk', 'bigrocketguy@twitter.com', NULL, 'EMAIL'),
    (5, 'John', 'Dutton', 'yellowstoneranch@paramount.com', NULL, 'EMAIL');

INSERT INTO cars (id, Model, Color, TotalCost) VALUES
    (1, 'Ford F-150', 'Black', 230),
    (2, 'Ford F-150', 'Silver', 200),
    (3, 'Ford Mustang', 'Red', 350),
    (4, 'Tesla Model 3', 'Blue', 325),
    (5, 'Ford F-350', 'Brown', 500);

-- DEPARTMENTS
SELECT * FROM departments;
-- EMPLOYEES
SELECT * FROM employees;
-- CUSTOMERS
SELECT * FROM customers;
-- CARS
SELECT * FROM cars;

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



