--- SQLIZE AT: https://sqlize.online/s/XR
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS cars CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS sales CASCADE;

-- schema
CREATE TABLE departments (
    id SERIAL NOT NULL,
    Name VARCHAR(25) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE employees (
    id INT NOT NULL,
    FName VARCHAR(35) NOT NULL,
    LName VARCHAR(35) NOT NULL,
    PhoneNumber VARCHAR(11),
    ManagerId INT,
    DepartmentId INT NOT NULL,
    Salary INT NOT NULL,
    HireDate timestamp NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (ManagerId) REFERENCES Employees(id),
    FOREIGN KEY (DepartmentId) REFERENCES Departments(id)
);

CREATE TABLE customers (
    id SERIAL NOT NULL,
    FName VARCHAR(35) NOT NULL,
    LName VARCHAR(35) NOT NULL,
    Email varchar(100) NOT NULL,
    PhoneNumber VARCHAR(11),
    PreferredContact VARCHAR(5) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE cars (
    id SERIAL NOT NULL,
    Model varchar(50) NOT NULL,
    Color varchar(50) NOT NULL,
    TotalCost INT NOT NULL,
    PRIMARY KEY(id),
    UNIQUE(model,color,totalcost)
);




-- data
INSERT INTO departments
    (id, Name)
VALUES
    (1, 'HR'),
    (2, 'Sales'),
    (3, 'Tech')
;

INSERT INTO employees
    (id, FName, LName, PhoneNumber, ManagerId, DepartmentId, Salary, HireDate)
VALUES
    (1, 'James', 'Smith', 1234567890, NULL, 1, 1000, '01-01-2002'::timestamp without time zone),
    (2, 'John', 'Johnson', 2468101214, '1', 1, 400, '03-03-2005'::timestamp without time zone),
    (3, 'Michael', 'Williams', 1357911131, '1', 2, 600, '12-05-2009'::timestamp without time zone),
    (4, 'Johnathon', 'Smith', 1212121212, '2', 1, 500, '07-07-2016'::timestamp without time zone),
    (5, 'William', 'Morris', 5555555555, '1', 2, 800, '08-05-2009'::timestamp without time zone);

INSERT INTO customers
    (id, FName, LName, Email, PhoneNumber, PreferredContact)
VALUES
    (1, 'William', 'Jones', 'william.jones@example.com', '3347927472', 'PHONE'),
    (2, 'David', 'Miller', 'dmiller@example.net', '2137921892', 'EMAIL'),
    (3, 'Richard', 'Davis', 'richard0123@example.com', NULL, 'EMAIL'),
    (4, 'Elon', 'Musk', 'bigrocketguy@twitter.com', NULL, 'EMAIL'),
    (5, 'John', 'Dutton', 'yellowstoneranch@paramount.com', NULL, 'EMAIL')
;

INSERT INTO cars
    (id, Model, Color, TotalCost)
VALUES
    ('1', 'Ford F-150', 'Black', '230'),
    ('2', 'Ford F-150', 'Silver', '200'),
    ('3', 'Ford Mustang', 'Red', '350'),
    ('4', 'Tesla Model 3', 'Blue', '325'),
    ('5', 'Ford F-350', 'Brown', '500')
;

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
