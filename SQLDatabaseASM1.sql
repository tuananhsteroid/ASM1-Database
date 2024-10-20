CREATE DATABASE DatabaseASM1;
USE DatabaseASM1;

-- 1. Product Management Tables

-- Products Table
CREATE TABLE Products (
    ProductID int PRIMARY KEY,
    ProductCode varchar(50) NOT NULL,
    ProductName varchar(100) NOT NULL,
    SellingPrice decimal(10, 2) NOT NULL,
    InventoryQuantity int NOT NULL,
    Descriptions varchar(100)
);

-- ProductImages Table
CREATE TABLE ProductImages (
    ImageID int PRIMARY KEY,
    ProductID int,
    ImageURL varchar(255) NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE
);

-- 2. Employee Management Tables

-- Employees Table
CREATE TABLE Employees (
    EmployeeID int PRIMARY KEY,
    EmployeeCode varchar(50) NOT NULL,
    EmployeeName varchar(100) NOT NULL,
    Position varchar(50) NOT NULL
);

-- EmployeeAccounts Table
CREATE TABLE EmployeeAccounts (
    AccountID int PRIMARY KEY,
    EmployeeID int,
    Username varchar(50) NOT NULL,
    Password varchar(255) NOT NULL,  
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID) ON DELETE CASCADE
);

-- EmployeeAccessRights Table
CREATE TABLE EmployeeAccessRights (
    AccessID int PRIMARY KEY,
    EmployeeID int,
    Role varchar(50) NOT NULL,  
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID) ON DELETE CASCADE
);

-- 3. Customer Management Tables

-- Customers Account Table
CREATE TABLE CustomersAccounts (
    AccountcustomerID int PRIMARY KEY,
    CustomerID int, 
    UseName varchar(50) NOT NULL,
    Passwords varchar(50) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
);
-- Customers Table
CREATE TABLE Customers (
    CustomerID int PRIMARY KEY,
    CustomerCode varchar(50) NOT NULL,
    CustomerName varchar(100) NOT NULL,
    PhoneNumber varchar(20) NOT NULL,
    Address varchar(255) NOT NULL
);
-- CustomerPurchaseHistory Table
CREATE TABLE CustomerPurchaseHistory (
    PurchaseID int PRIMARY KEY,
    CustomerID int,
    ProductID int,
    PurchaseDate date NOT NULL,
    Quantity int NOT NULL,
    TotalAmount decimal(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE
);

-- Manager View

-- 4. Statistics Tables

-- SalesRevenueStatistics Table
CREATE TABLE SalesRevenueStatistics (
    RevenueID int PRIMARY KEY,
    PurchaseID int,
    TotalProductsSold int NOT NULL,
    RevenueAmount decimal(10, 2) NOT NULL,
    ProfitAmount decimal(10, 2) NOT NULL,
    FOREIGN KEY (PurchaseID) REFERENCES CustomerPurchaseHistory(PurchaseID) ON DELETE CASCADE
);

CREATE TABLE ManagerView (
    ManagerID int PRIMARY KEY,
    UseName varchar(50) NOT NULL,
    Passwords varchar(50) NOT NULL,
    ProductID int,
    EmployeeID int,
    CustomerID int,
    RevenueID int,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID) ON DELETE NO ACTION,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE NO ACTION,
    FOREIGN KEY (RevenueID) REFERENCES SalesRevenueStatistics(RevenueID) ON DELETE NO ACTION
);

