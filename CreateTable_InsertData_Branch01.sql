alter session set "_ORACLE_SCRIPT"=true; 
CREATE TABLE Branches (
    BranchID VARCHAR(50) PRIMARY KEY,
    Location VARCHAR(255)
);


CREATE TABLE Customers (
    CustomerId VARCHAR(50) PRIMARY KEY,
    CustomerName VARCHAR(255),
    Gender VARCHAR(10),
    Address VARCHAR2(255),
    Phone VARCHAR2(15),
    Birthday DATE,
    Membership VARCHAR(255),
    Spending NUMBER
);


CREATE TABLE Employees (
    EmployeeID VARCHAR(50) PRIMARY KEY,
    EmployeeName VARCHAR(255),
    Gender VARCHAR(10),
    Address VARCHAR(255),
    Phone VARCHAR(15),
    BranchID VARCHAR(50),
    StartDate DATE,
    Salary NUMBER,
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);

CREATE TABLE Phones (
    PhoneID VARCHAR(50) PRIMARY KEY,
    PhoneName VARCHAR(255),
    Brand VARCHAR(255),
    Color VARCHAR(50),
    StorageCapacity NUMBER,
    Price NUMBER,
    ReleaseDate DATE
);

CREATE TABLE Payments (
    PaymentID VARCHAR(50) PRIMARY KEY,
    EmployeeID VARCHAR(50),
    CustomerID VARCHAR(50),
    PaymentDate DATE,
    TotalCost NUMBER,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    
);

CREATE TABLE Payment_Details (
    PaymentID VARCHAR(50),
    PhoneID VARCHAR(50),
    Quantity NUMBER,
    PRIMARY KEY (PaymentID, PhoneID),
    FOREIGN KEY (PaymentID) REFERENCES Payments(PaymentID),
    FOREIGN KEY (PhoneID) REFERENCES Phones(PhoneID)
);

CREATE TABLE Warehouse_Imports (
    BranchID VARCHAR(50),
    PhoneID VARCHAR(50),
    ImportDate DATE,
    QuantityImport NUMBER,
    PRIMARY KEY (BranchID, PhoneID),
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID),
    FOREIGN KEY (PhoneID) REFERENCES Phones(PhoneID)
);

CREATE TABLE Warehouse_Manages (
    BranchID VARCHAR(50),
    PhoneID VARCHAR(50),
    Status VARCHAR(50),
    PRIMARY KEY (BranchID, PhoneID),
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID),
    FOREIGN KEY (PhoneID) REFERENCES Phones(PhoneID)
);

commit;

--INSERT DATA CUSTOMER
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus01', 'John Doe', 'Male', '123 Main St', '555-1234', TO_DATE('1990-01-15', 'YYYY-MM-DD'), 'Gold', 500.00);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus02', 'Jane Smith', 'Female', '456 Oak St', '555-5678', TO_DATE('1985-05-20', 'YYYY-MM-DD'), 'Silver', 300.50);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus03', 'Mike Johnson', 'Male', '789 Pine St', '555-9876', TO_DATE('1992-08-10', 'YYYY-MM-DD'), 'Bronze', 150.75);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus04', 'Emily White', 'Female', '111 Maple St', '555-1111', TO_DATE('1988-12-05', 'YYYY-MM-DD'), 'Gold', 450.25);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus05', 'Daniel Brown', 'Male', '333 Oak St', '555-3333', TO_DATE('1987-07-25', 'YYYY-MM-DD'), 'Gold', 550.50);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus06', 'Linda Green', 'Female', '444 Pine St', '555-4444', TO_DATE('1991-11-30', 'YYYY-MM-DD'), 'Bronze', 120.25);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus07', 'Alex Johnson', 'Male', '789 Pine St', '555-9999', TO_DATE('1995-11-08', 'YYYY-MM-DD'), 'Bronze', 150.75);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus08', 'Anna Lee', 'Female', '555 Cedar St', '555-7777', TO_DATE('1989-04-12', 'YYYY-MM-DD'), 'Silver', 300.00);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus09', 'Robert Davis', 'Male', '666 Oak St', '555-8888', TO_DATE('1984-09-03', 'YYYY-MM-DD'), 'Gold', 480.75);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus10', 'Sophie Miller', 'Female', '777 Maple St', '555-0001', TO_DATE('1996-02-28', 'YYYY-MM-DD'), 'Bronze', 180.50);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus11', 'Chris Wilson', 'Male', '888 Birch St', '555-1112', TO_DATE('1983-06-15', 'YYYY-MM-DD'), 'Gold', 520.25);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus12', 'Eva Hernandez', 'Female', '999 Pine St', '555-2223', TO_DATE('1994-08-22', 'YYYY-MM-DD'), 'Silver', 250.75);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus13', 'Paul Anderson', 'Male', '101 Oak St', '555-3334', TO_DATE('1986-10-09', 'YYYY-MM-DD'), 'Bronze', 160.00);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus14', 'Olivia White', 'Female', '202 Cedar St', '555-4445', TO_DATE('1990-12-14', 'YYYY-MM-DD'), 'Gold', 490.50);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus15', 'Jack Robinson', 'Male', '303 Birch St', '555-5556', TO_DATE('1985-02-07', 'YYYY-MM-DD'), 'Silver', 220.25);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES  
('Cus16', 'Grace Taylor', 'Female', '404 Pine St', '555-6667', TO_DATE('1992-05-02', 'YYYY-MM-DD'), 'Bronze', 140.75);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus17', 'William Moore', 'Male', '505 Maple St', '555-7778', TO_DATE('1988-07-19', 'YYYY-MM-DD'), 'Gold', 530.00);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus18', 'Emma Reed', 'Female', '606 Elm St', '555-8889', TO_DATE('1993-09-24', 'YYYY-MM-DD'), 'Silver', 270.50);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus19', 'Joseph Hayes', 'Male', '707 Cedar St', '555-0002', TO_DATE('1984-12-17', 'YYYY-MM-DD'), 'Bronze', 130.25);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus20', 'Ava Fisher', 'Female', '808 Oak St', '555-1113', TO_DATE('1991-02-11', 'YYYY-MM-DD'), 'Gold', 460.00);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus21', 'Michael Martin', 'Male', '909 Pine St', '555-2224', TO_DATE('1987-04-06', 'YYYY-MM-DD'), 'Silver', 240.75);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus22', 'Isabella Hayes', 'Female', '111 Birch St', '555-3335', TO_DATE('1995-06-01', 'YYYY-MM-DD'), 'Bronze', 110.50);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus23', 'Christopher King', 'Male', '222 Cedar St', '555-4446', TO_DATE('1983-08-26', 'YYYY-MM-DD'), 'Gold', 510.25);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus24', 'Mia Turner', 'Female', '333 Elm St', '555-5557', TO_DATE('1989-11-20', 'YYYY-MM-DD'), 'Silver', 290.00);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus25', 'David Cooper', 'Male', '444 Oak St', '555-6668', TO_DATE('1986-01-15', 'YYYY-MM-DD'), 'Bronze', 170.75);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus26', 'Sophia Davis', 'Female', '555 Maple St', '555-7779', TO_DATE('1994-03-11', 'YYYY-MM-DD'), 'Gold', 500.50);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus27', 'James Morgan', 'Male', '666 Pine St', '555-8890', TO_DATE('1985-05-06', 'YYYY-MM-DD'), 'Silver', 260.25);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus28', 'Emily White', 'Female', '777 Cedar St', '555-0003', TO_DATE('1992-07-01', 'YYYY-MM-DD'), 'Bronze', 120.00);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus29', 'Daniel Reed', 'Male', '888 Elm St', '555-1114', TO_DATE('1988-09-25', 'YYYY-MM-DD'), 'Gold', 540.75);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus30', 'Ava Brown', 'Female', '999 Birch St', '555-2225', TO_DATE('1983-12-20', 'YYYY-MM-DD'), 'Silver', 230.50);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus31', 'Matthew Taylor', 'Male', '101 Pine St', '555-3336', TO_DATE('1990-02-14', 'YYYY-MM-DD'), 'Bronze', 150.25);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus32', 'Olivia Carter', 'Female', '202 Cedar St', '555-4447', TO_DATE('1986-04-10', 'YYYY-MM-DD'), 'Gold', 470.00);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus33', 'Liam Turner', 'Male', '303 Elm St', '555-5558', TO_DATE('1993-06-05', 'YYYY-MM-DD'), 'Silver', 280.75);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus34', 'Sophia Hayes', 'Female', '404 Oak St', '555-6669', TO_DATE('1987-08-30', 'YYYY-MM-DD'), 'Bronze', 160.50);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus35', 'Ethan King', 'Male', '505 Maple St', '555-8881', TO_DATE('1994-11-24', 'YYYY-MM-DD'), 'Gold', 520.25);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus36', 'Emma Robinson', 'Female', '606 Birch St', '555-9992', TO_DATE('1985-01-19', 'YYYY-MM-DD'), 'Silver', 250.00);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus37', 'Logan Martin', 'Male', '707 Pine St', '555-0004', TO_DATE('1992-03-15', 'YYYY-MM-DD'), 'Bronze', 130.75);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus38', 'Chloe Cooper', 'Female', '808 Cedar St', '555-1115', TO_DATE('1988-05-10', 'YYYY-MM-DD'), 'Gold', 480.50);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus39', 'Mason White', 'Male', '909 Elm St', '555-2226', TO_DATE('1983-07-05', 'YYYY-MM-DD'), 'Silver', 220.25);
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending)
VALUES
('Cus40', 'Lily Turner', 'Female', '111 Oak St', '555-3337', TO_DATE('1990-09-09','YYYY-MM-DD'),'Gold',590.00);

--INSERT DATA PHONE
INSERT INTO Phones (PhoneID,PhoneName,Brand,Color,StorageCapacity,Price,ReleaseDate)
VALUES
('Phone01', 'IPhone 13', 'Apple', 'Blue', 128, 959.00, TO_DATE('2022-09-14', 'YYYY-MM-DD'));
INSERT INTO Phones (PhoneID,PhoneName,Brand,Color,StorageCapacity,Price,ReleaseDate)
VALUES
('Phone02', 'Galaxy S21', 'Samsung', 'Black', 256, 900.00, TO_DATE('2021-01-29', 'YYYY-MM-DD'));
INSERT INTO Phones (PhoneID,PhoneName,Brand,Color,StorageCapacity,Price,ReleaseDate)
VALUES
('Phone03', 'Oppo Reno 5', 'Oppo', 'Cosmic Silver', 256, 1239.00, TO_DATE('2021-07-15', 'YYYY-MM-DD'));
INSERT INTO Phones (PhoneID,PhoneName,Brand,Color,StorageCapacity,Price,ReleaseDate)
VALUES
('Phone04', 'Vivo Y53s', 'Vivo', 'Deep Sea Blue', 128, 500.00, TO_DATE('2022-08-10', 'YYYY-MM-DD'));
INSERT INTO Phones (PhoneID,PhoneName,Brand,Color,StorageCapacity,Price,ReleaseDate)
VALUES
('Phone05', 'Mi 11', 'Xiaomi', 'Green', 128, 699.00, TO_DATE('2021-02-08', 'YYYY-MM-DD'));
INSERT INTO Phones (PhoneID,PhoneName,Brand,Color,StorageCapacity,Price,ReleaseDate)
VALUES
('Phone06', 'IPhone 12', 'Apple', 'Red', 64, 800.00, TO_DATE('2020-10-23', 'YYYY-MM-DD'));
INSERT INTO Phones (PhoneID,PhoneName,Brand,Color,StorageCapacity,Price,ReleaseDate)
VALUES
('Phone07', 'Galaxy Note 20', 'Samsung', 'Mystic Bronze', 128, 1000.00, TO_DATE('2020-08-21', 'YYYY-MM-DD'));
INSERT INTO Phones (PhoneID,PhoneName,Brand,Color,StorageCapacity,Price,ReleaseDate)
VALUES
('Phone08', 'IPhone 15', 'Apple', 'Midnight Black', 512, 1599.00, TO_DATE('2023-09-15', 'YYYY-MM-DD'));
INSERT INTO Phones (PhoneID,PhoneName,Brand,Color,StorageCapacity,Price,ReleaseDate)
VALUES
('Phone09', 'Oppo Find X5', 'Oppo', 'Mystic Black', 256, 1299.99, TO_DATE('2023-05-15', 'YYYY-MM-DD'));
INSERT INTO Phones (PhoneID,PhoneName,Brand,Color,StorageCapacity,Price,ReleaseDate)
VALUES
('Phone10', 'Redmi Note 10', 'Xiaomi', 'Blue', 128, 249.50, TO_DATE('2021-03-04', 'YYYY-MM-DD'));
INSERT INTO Phones (PhoneID,PhoneName,Brand,Color,StorageCapacity,Price,ReleaseDate)
VALUES
('Phone11', 'Galaxy A52', 'Samsung', 'Awesome White', 128, 349.99, TO_DATE('2021-03-17', 'YYYY-MM-DD'));
INSERT INTO Phones (PhoneID,PhoneName,Brand,Color,StorageCapacity,Price,ReleaseDate)
VALUES
('Phone12', 'Galaxy A53', 'Samsung', 'Dreamy Pink', 64, 389.00, TO_DATE('2022-08-18', 'YYYY-MM-DD'));
INSERT INTO Phones (PhoneID,PhoneName,Brand,Color,StorageCapacity,Price,ReleaseDate)
VALUES
('Phone13', 'Galaxy Z Fold 3', 'Samsung', 'Phantom Black', 256, 1800.00, TO_DATE('2021-08-11', 'YYYY-MM-DD'));
INSERT INTO Phones (PhoneID,PhoneName,Brand,Color,StorageCapacity,Price,ReleaseDate)
VALUES
('Phone14', 'IPhone 13 Pro', 'Apple', 'Graphite', 256, 1199.99, TO_DATE('2022-09-14', 'YYYY-MM-DD'));
INSERT INTO Phones (PhoneID,PhoneName,Brand,Color,StorageCapacity,Price,ReleaseDate)
VALUES
('Phone15', 'Galaxy S24', 'Samsung', 'Eternal Green', 512, 1950.50, TO_DATE('2022-01-15', 'YYYY-MM-DD'));
INSERT INTO Phones (PhoneID,PhoneName,Brand,Color,StorageCapacity,Price,ReleaseDate)
VALUES
('Phone16', 'Galaxy Z Fold 4', 'Samsung', 'Celestial Blue', 512, 1190.00, TO_DATE('2023-08-01', 'YYYY-MM-DD'));
INSERT INTO Phones (PhoneID,PhoneName,Brand,Color,StorageCapacity,Price,ReleaseDate)
VALUES
('Phone17', 'Mi 11 Ultra', 'Xiaomi', 'Ceramic Black', 256, 1099.99, TO_DATE('2021-02-08', 'YYYY-MM-DD'));
INSERT INTO Phones (PhoneID,PhoneName,Brand,Color,StorageCapacity,Price,ReleaseDate)
VALUES
('Phone18', 'Galaxy S22', 'Samsung', 'Phantom Silver', 128, 1159.00, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO Phones (PhoneID,PhoneName,Brand,Color,StorageCapacity,Price,ReleaseDate)
VALUES
('Phone19', 'IPhone SE', 'Apple', 'Product(RED)', 64, 399.99, TO_DATE('2020-04-24', 'YYYY-MM-DD'));
INSERT INTO Phones (PhoneID,PhoneName,Brand,Color,StorageCapacity,Price,ReleaseDate)
VALUES
('Phone20', 'Vivo X60 Pro', 'Vivo', 'Frost Blue', 256, 1099.99, TO_DATE('2023-03-15', 'YYYY-MM-DD'));
INSERT INTO Phones (PhoneID,PhoneName,Brand,Color,StorageCapacity,Price,ReleaseDate)
VALUES
('Phone21', 'Mi 12', 'Xiaomi', 'Pearl White', 128, 1240.00, TO_DATE('2023-03-01', 'YYYY-MM-DD'));
INSERT INTO Phones (PhoneID,PhoneName,Brand,Color,StorageCapacity,Price,ReleaseDate)
VALUES
('Phone22', 'Redmi Note 11', 'Xiaomi', 'Aurora Blue', 128, 299.99, TO_DATE('2022-01-10', 'YYYY-MM-DD'));
INSERT INTO Phones (PhoneID,PhoneName,Brand,Color,StorageCapacity,Price,ReleaseDate)
VALUES
('Phone23', 'IPhone 11', 'Apple', 'Purple', 128, 699.99, TO_DATE('2019-09-20', 'YYYY-MM-DD'));
INSERT INTO Phones (PhoneID,PhoneName,Brand,Color,StorageCapacity,Price,ReleaseDate)
VALUES
('Phone24', 'Galaxy A32', 'Samsung', 'Awesome Blue', 64, 250.50, TO_DATE('2021-03-05', 'YYYY-MM-DD'));
INSERT INTO Phones (PhoneID,PhoneName,Brand,Color,StorageCapacity,Price,ReleaseDate)
VALUES
('Phone25', 'Mi Mix 5', 'Xiaomi', 'Emerald Green', 256, 1099.00, TO_DATE('2023-04-25', 'YYYY-MM-DD'));
INSERT INTO Phones (PhoneID,PhoneName,Brand,Color,StorageCapacity,Price,ReleaseDate)
VALUES
('Phone26', 'Galaxy Z Flip 4', 'Samsung', 'Cream', 128, 1300.00, TO_DATE('2023-02-28', 'YYYY-MM-DD'));
INSERT INTO Phones (PhoneID,PhoneName,Brand,Color,StorageCapacity,Price,ReleaseDate)
VALUES
('Phone27', 'iPhone 14', 'Apple', 'Midnight', 256, 1299.00, TO_DATE('2023-09-20', 'YYYY-MM-DD'));
INSERT INTO Phones (PhoneID,PhoneName,Brand,Color,StorageCapacity,Price,ReleaseDate)
VALUES
('Phone28', 'Redmi Note 12', 'Xiaomi', 'Sunset Orange', 128, 350.50, TO_DATE('2023-06-15', 'YYYY-MM-DD'));
INSERT INTO Phones (PhoneID,PhoneName,Brand,Color,StorageCapacity,Price,ReleaseDate)
VALUES
('Phone29', 'Galaxy S23', 'Samsung', 'Mystic Black', 256, 1350.00, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO Phones (PhoneID,PhoneName,Brand,Color,StorageCapacity,Price,ReleaseDate)
VALUES
('Phone30', 'IPhone SE 3', 'Apple', 'Starlight', 128, 500.00, TO_DATE('2023-05-10', 'YYYY-MM-DD'));
INSERT INTO Phones (PhoneID,PhoneName,Brand,Color,StorageCapacity,Price,ReleaseDate)
VALUES
('Phone31', 'Vivo V23', 'Vivo', 'Romantic Pink', 256, 1200.00, TO_DATE('2023-09-15', 'YYYY-MM-DD'));
INSERT INTO Phones (PhoneID,PhoneName,Brand,Color,StorageCapacity,Price,ReleaseDate)
VALUES
('Phone32', 'Oppo A95', 'Oppo', 'Starry Silver', 128, 550.00, TO_DATE('2023-11-30', 'YYYY-MM-DD'));
INSERT INTO Phones (PhoneID,PhoneName,Brand,Color,StorageCapacity,Price,ReleaseDate)
VALUES
('Phone33', 'Oppo Reno 6', 'Oppo', 'Galactic Silver', 256, 599.99, TO_DATE('2022-06-15', 'YYYY-MM-DD'));
INSERT INTO Phones (PhoneID,PhoneName,Brand,Color,StorageCapacity,Price,ReleaseDate)
VALUES
('Phone34', 'Oppo Reno 8', 'Oppo', 'Cosmic Silver', 256, 1299.99, TO_DATE('2023-07-15', 'YYYY-MM-DD'));
INSERT INTO Phones (PhoneID,PhoneName,Brand,Color,StorageCapacity,Price,ReleaseDate)
VALUES
('Phone35', 'Vivo X70', 'Vivo', 'Sunset Gold', 128, 899.99, TO_DATE('2021-06-01', 'YYYY-MM-DD'));

--INSERT DATA BRANCHES 01
INSERT INTO Branches (BranchID,Location)
VALUES
('Branch01','New York');

--INSERT DATA EMPLOYEES AT BRANCH01
INSERT INTO Employees (EmployeeID,EmployeeName,Gender,Address,Phone,BranchID,StartDate,Salary)
VALUES
('Emp01', 'John Williams', 'Male', '123 Main St, City1', '123-456-7890', 'Branch01', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 50000);
INSERT INTO Employees (EmployeeID,EmployeeName,Gender,Address,Phone,BranchID,StartDate,Salary)
VALUES
('Emp02', 'Sarah Brown', 'Female', '567 Elm St, City5', '901-234-5678','Branch01', TO_DATE('2023-01-15', 'YYYY-MM-DD'), 55000);
INSERT INTO Employees (EmployeeID,EmployeeName,Gender,Address,Phone,BranchID,StartDate,Salary)
VALUES
('Emp03', 'Michael Johnson', 'Male', '789 Birch St, City6', '345-678-9012','Branch01', TO_DATE('2023-02-15', 'YYYY-MM-DD'), 65000);
INSERT INTO Employees (EmployeeID,EmployeeName,Gender,Address,Phone,BranchID,StartDate,Salary)
VALUES
('Emp04', 'Emily Davis', 'Female', '876 Maple St, City7', '567-890-1234','Branch01', TO_DATE('2023-03-01', 'YYYY-MM-DD'), 75000);
INSERT INTO Employees (EmployeeID,EmployeeName,Gender,Address,Phone,BranchID,StartDate,Salary)
VALUES
('Emp05', 'Daniel White', 'Male', '234 Pine St, City8', '789-012-3456','Branch01', TO_DATE('2023-03-15', 'YYYY-MM-DD'), 85000);
INSERT INTO Employees (EmployeeID,EmployeeName,Gender,Address,Phone,BranchID,StartDate,Salary)
VALUES
('Emp06', 'Olivia Thomas', 'Female', '890 Cedar St, City9', '123-234-5678','Branch01', TO_DATE('2023-04-01', 'YYYY-MM-DD'), 55000);
INSERT INTO Employees (EmployeeID,EmployeeName,Gender,Address,Phone,BranchID,StartDate,Salary)
VALUES
('Emp07', 'William Taylor', 'Male', '456 Oak St, City10', '345-456-7890','Branch01', TO_DATE('2023-04-15', 'YYYY-MM-DD'), 65000);
INSERT INTO Employees (EmployeeID,EmployeeName,Gender,Address,Phone,BranchID,StartDate,Salary)
VALUES
('Emp07', 'Sophia Anderson', 'Female', '678 Birch St, City11', '567-567-8901','Branch01', TO_DATE('2023-05-01', 'YYYY-MM-DD'), 75000);
INSERT INTO Employees (EmployeeID,EmployeeName,Gender,Address,Phone,BranchID,StartDate,Salary)
VALUES
('Emp08', 'James Martinez', 'Male', '987 Maple St, City12', '789-678-9012','Branch01', TO_DATE('2023-05-15', 'YYYY-MM-DD'), 85000);
INSERT INTO Employees (EmployeeID,EmployeeName,Gender,Address,Phone,BranchID,StartDate,Salary)
VALUES
('Emp09', 'Emma Miller', 'Female', '234 Pine St, City13', '901-789-0123','Branch01', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 55000);
INSERT INTO Employees (EmployeeID,EmployeeName,Gender,Address,Phone,BranchID,StartDate,Salary)
VALUES
('Emp10', 'Benjamin Garcia', 'Male', '876 Cedar St, City14', '234-890-1234','Branch01', TO_DATE('2023-06-15', 'YYYY-MM-DD'), 65000);
INSERT INTO Employees (EmployeeID,EmployeeName,Gender,Address,Phone,BranchID,StartDate,Salary)
VALUES
('Emp11', 'Ava Robinson', 'Female', '567 Elm St, City15', '456-901-2345','Branch01', TO_DATE('2023-07-01', 'YYYY-MM-DD'), 75000);
INSERT INTO Employees (EmployeeID,EmployeeName,Gender,Address,Phone,BranchID,StartDate,Salary)
VALUES
('Emp12', 'Jackson Wright', 'Male', '890 Birch St, City16', '678-012-3456','Branch01', TO_DATE('2023-07-15', 'YYYY-MM-DD'), 85000);
INSERT INTO Employees (EmployeeID,EmployeeName,Gender,Address,Phone,BranchID,StartDate,Salary)
VALUES
('Emp13', 'Mia Hall', 'Female', '123 Maple St, City17', '890-123-4567','Branch01', TO_DATE('2023-08-01', 'YYYY-MM-DD'), 55000);
INSERT INTO Employees (EmployeeID,EmployeeName,Gender,Address,Phone,BranchID,StartDate,Salary)
VALUES
('Emp14', 'Ethan King', 'Male', '456 Pine St, City18', '234-234-5678','Branch01', TO_DATE('2023-08-15', 'YYYY-MM-DD'), 65000);
INSERT INTO Employees (EmployeeID,EmployeeName,Gender,Address,Phone,BranchID,StartDate,Salary)
VALUES
('Emp15', 'Abigail Scott', 'Female', '789 Cedar St, City19', '567-345-6789', 'Branch01', TO_DATE('2023-09-01', 'YYYY-MM-DD'), 75000);
INSERT INTO Employees (EmployeeID,EmployeeName,Gender,Address,Phone,BranchID,StartDate,Salary)
VALUES
('Emp16', 'Daniel Adams', 'Male', '987 Elm St, City20', '789-456-7890','Branch01', TO_DATE('2023-09-15', 'YYYY-MM-DD'), 85000);
INSERT INTO Employees (EmployeeID,EmployeeName,Gender,Address,Phone,BranchID,StartDate,Salary)
VALUES
('Emp17', 'Madison Allen', 'Female', '234 Birch St, City21', '901-567-8901','Branch01', TO_DATE('2023-10-01', 'YYYY-MM-DD'), 55000);
INSERT INTO Employees (EmployeeID,EmployeeName,Gender,Address,Phone,BranchID,StartDate,Salary)
VALUES
('Emp18', 'Joseph Baker', 'Male', '567 Maple St, City22', '123-678-9012','Branch01', TO_DATE('2023-10-15', 'YYYY-MM-DD'), 65000);
INSERT INTO Employees (EmployeeID,EmployeeName,Gender,Address,Phone,BranchID,StartDate,Salary)
VALUES
('Emp19', 'Grace Carter', 'Female', '876 Cedar St, City23', '234-789-0123','Branch01', TO_DATE('2023-11-01', 'YYYY-MM-DD'), 75000);
INSERT INTO Employees (EmployeeID,EmployeeName,Gender,Address,Phone,BranchID,StartDate,Salary)
VALUES
('Emp20', 'Samuel Coleman', 'Male', '987 Pine St, City24', '345-890-1234','Branch01', TO_DATE('2023-11-15', 'YYYY-MM-DD'), 85000);


--INSERT DATA WAREHOUSE_IMPORTS
--Warehouse_Import
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch01','Phone01',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch01','Phone02',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch01','Phone03',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch01','Phone04',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch01','Phone05',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch01','Phone06',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch01','Phone07',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch01','Phone08',TO_DATE('2023-09-15', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch01','Phone09',TO_DATE('2023-05-15', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch01','Phone10',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch01','Phone11',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch01','Phone12',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch01','Phone13',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch01','Phone14',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch01','Phone15',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch01','Phone16',TO_DATE('2023-08-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch01','Phone17',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch01','Phone18',TO_DATE('2023-01-15', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch01','Phone19',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch01','Phone20',TO_DATE('2023-03-15', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch01','Phone21',TO_DATE('2023-03-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch01','Phone22',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch01','Phone23',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch01','Phone24',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch01','Phone25',TO_DATE('2023-04-25', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch01','Phone26',TO_DATE('2023-02-28', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch01','Phone27',TO_DATE('2023-09-20', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch01','Phone28',TO_DATE('2023-06-15', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch01','Phone29',TO_DATE('2023-01-15', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch01','Phone30',TO_DATE('2023-05-10', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch01','Phone31',TO_DATE('2023-09-15', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch01','Phone32',TO_DATE('2023-11-30', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch01','Phone33',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch01','Phone34',TO_DATE('2023-07-15', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch01','Phone35',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);



--Warehouse_Manages
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch01', 'Phone01', 'In Stock'); 
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch01', 'Phone02', 'In Stock'); 
INSERT INTO Warehouse_Manages (BranchID,PhoneID,Status)
VALUES
('Branch01', 'Phone03', 'In Stock'); 
INSERT INTO Warehouse_Manages (BranchID,PhoneID,Status)
VALUES
('Branch01', 'Phone04', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID,PhoneID,Status)
VALUES
('Branch01', 'Phone05', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID,PhoneID,Status)
VALUES
('Branch01', 'Phone06', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID,PhoneID,Status)
VALUES
('Branch01', 'Phone07', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID,PhoneID,Status)
VALUES
('Branch01', 'Phone08', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID,PhoneID,Status)
VALUES
('Branch01', 'Phone09', 'In Stock');
INSERT INTO Warehouse_Manages (BranchID,PhoneID,Status)
VALUES
('Branch01', 'Phone10', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID,PhoneID,Status)
VALUES
('Branch01', 'Phone11', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID,PhoneID,Status)
VALUES
('Branch01', 'Phone12', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID,PhoneID,Status)
VALUES
('Branch01', 'Phone13', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID,PhoneID,Status)
VALUES
('Branch01', 'Phone14', 'In Stock');
INSERT INTO Warehouse_Manages (BranchID,PhoneID,Status)
VALUES
('Branch01', 'Phone15', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID,PhoneID,Status)
VALUES
('Branch01', 'Phone16', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID,PhoneID,Status)
VALUES
('Branch01', 'Phone17', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID,PhoneID,Status)
VALUES
('Branch01', 'Phone18', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID,PhoneID,Status)
VALUES
('Branch01', 'Phone19', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID,PhoneID,Status)
VALUES
('Branch01', 'Phone20', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID,PhoneID,Status)
VALUES
('Branch01', 'Phone21', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID,PhoneID,Status)
VALUES
('Branch01', 'Phone22', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID,PhoneID,Status)
VALUES
('Branch01', 'Phone23', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID,PhoneID,Status)
VALUES
('Branch01', 'Phone24', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID,PhoneID,Status)
VALUES
('Branch01', 'Phone25', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID,PhoneID,Status)
VALUES
('Branch01', 'Phone26', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID,PhoneID,Status)
VALUES
('Branch01', 'Phone27', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID,PhoneID,Status)
VALUES
('Branch01', 'Phone28', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID,PhoneID,Status)
VALUES
('Branch01', 'Phone29', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID,PhoneID,Status)
VALUES
('Branch01', 'Phone30', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID,PhoneID,Status)
VALUES
('Branch01', 'Phone31', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID,PhoneID,Status)
VALUES
('Branch01', 'Phone32', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID,PhoneID,Status)
VALUES
('Branch01', 'Phone33', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID,PhoneID,Status)
VALUES
('Branch01', 'Phone34', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID,PhoneID,Status)
VALUES
('Branch01', 'Phone35', 'In Stock') ;


--INSERT PAYMENTS
--Payments
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment01','Emp20','Cus01',TO_DATE('2023-11-21', 'YYYY-MM-DD'),899.99);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment02','Emp01','Cus02',TO_DATE('2023-12-22', 'YYYY-MM-DD'),1599.99);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment03','Emp09','Cus09',TO_DATE('2023-12-29', 'YYYY-MM-DD'),1599.99);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment04','Emp02','Cus19',TO_DATE('2023-12-29', 'YYYY-MM-DD'),1299.99);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment05','Emp03','Cus29',TO_DATE('2023-12-29', 'YYYY-MM-DD'),1200.00);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment06','Emp11','Cus25',TO_DATE('2023-10-09', 'YYYY-MM-DD'),1000.00);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment07','Emp10','Cus05',TO_DATE('2023-10-10', 'YYYY-MM-DD'),1350.00);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment08','Emp17','Cus23',TO_DATE('2023-01-09', 'YYYY-MM-DD'),1099.00);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment09','Emp09','Cus25',TO_DATE('2023-01-01', 'YYYY-MM-DD'),2600.00);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment10','Emp13','Cus11',TO_DATE('2023-01-30', 'YYYY-MM-DD'),900.00);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment11','Emp05','Cus30',TO_DATE('2023-01-30', 'YYYY-MM-DD'),699.98);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment12','Emp07','Cus17',TO_DATE('2023-12-09', 'YYYY-MM-DD'),1800.00);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment13','Emp08','Cus37',TO_DATE('2023-12-10', 'YYYY-MM-DD'),399.99);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment14','Emp11','Cus03',TO_DATE('2023-12-09', 'YYYY-MM-DD'),1950.50);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment15','Emp12','Cus08',TO_DATE('2023-12-09', 'YYYY-MM-DD'),249.50);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment16','Emp04','Cus06',TO_DATE('2023-03-30', 'YYYY-MM-DD'),1159.00);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment17','Emp14','Cus26',TO_DATE('2023-08-20', 'YYYY-MM-DD'),599.99);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment18','Emp02','Cus19',TO_DATE('2023-01-31', 'YYYY-MM-DD'),299.99);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment19','Emp06','Cus10',TO_DATE('2023-01-01', 'YYYY-MM-DD'),699.99);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment20','Emp16','Cus20',TO_DATE('2023-02-01', 'YYYY-MM-DD'),250.50);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment21','Emp19','Cus18',TO_DATE('2023-03-05', 'YYYY-MM-DD'),1240.00);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment22','Emp11','Cus21',TO_DATE('2023-09-30', 'YYYY-MM-DD'),1299.99);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment23','Emp15','Cus04',TO_DATE('2023-04-27', 'YYYY-MM-DD'),1099.99);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment24','Emp18','Cus01',TO_DATE('2023-10-11', 'YYYY-MM-DD'),1299.00);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment25','Emp02','Cus31',TO_DATE('2023-12-30', 'YYYY-MM-DD'),1300.00);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment26','Emp01','Cus35',TO_DATE('2023-01-14', 'YYYY-MM-DD'),1199.99);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment27','Emp07','Cus36',TO_DATE('2023-04-11', 'YYYY-MM-DD'),699.99);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment28','Emp02','Cus32',TO_DATE('2023-04-20', 'YYYY-MM-DD'),800.00);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment29','Emp19','Cus34',TO_DATE('2023-12-31', 'YYYY-MM-DD'),1299.99);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment30','Emp04','Cus25',TO_DATE('2023-11-28', 'YYYY-MM-DD'),3198.00);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment31','Emp01','Cus20',TO_DATE('2023-11-22', 'YYYY-MM-DD'),1918.00);

--IMPORT PAYMENT_DETAILS
--Payment_Details
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment01','Phone35',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment02','Phone08',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment03','Phone08',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment04','Phone34',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment05','Phone31',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment06','Phone04',2);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment07','Phone29',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment08','Phone25',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment09','Phone26',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment10','Phone02',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment11','Phone11',2);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment12','Phone13',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment13','Phone19',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment14','Phone15',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment15','Phone10',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment16','Phone18',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment17','Phone33',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment18','Phone22',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment19','Phone23',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment20','Phone24',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment21','Phone21',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment22','Phone09',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment23','Phone20',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment24','Phone27',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment25','Phone26',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment26','Phone14',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment27','Phone23',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment28','Phone06',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment29','Phone34',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment30','Phone08',2);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment31','Phone01',2);

commit;


