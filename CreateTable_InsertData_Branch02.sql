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

--INSERT DATA Customerss
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
COMMIT;
--INSERT DATA Phone
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

--Branches
INSERT INTO Branches (BranchID,Location)
VALUES
('Branch02','LA');

-- INSERT DATA EMPLOYEES AT BRANCH02
INSERT INTO Employees (EmployeeID,EmployeeName,Gender,Address,Phone,BranchID,StartDate,Salary)
VALUES
('Emp21', 'Oliver Taylor', 'Male', '345 Oak St, City25', '567-890-1234', 'Branch02', TO_DATE('2023-12-20', 'YYYY-MM-DD'), 90000);
INSERT INTO Employees (EmployeeID,EmployeeName,Gender,Address,Phone,BranchID,StartDate,Salary)
VALUES
('Emp22', 'Sophia Johnson', 'Female', '678 Pine St, City26', '789-012-3456', 'Branch02', TO_DATE('2023-12-25', 'YYYY-MM-DD'), 85000);
INSERT INTO Employees (EmployeeID,EmployeeName,Gender,Address,Phone,BranchID,StartDate,Salary)
VALUES
('Emp23', 'Mia Davis', 'Female', '890 Cedar St, City27', '901-234-5678', 'Branch02', TO_DATE('2023-11-30', 'YYYY-MM-DD'), 75000);
INSERT INTO Employees (EmployeeID,EmployeeName,Gender,Address,Phone,BranchID,StartDate,Salary)
VALUES
('Emp24', 'Liam Williams', 'Male', '123 Elm St, City28', '234-567-8901', 'Branch02', TO_DATE('2023-11-15', 'YYYY-MM-DD'), 80000);
INSERT INTO Employees (EmployeeID,EmployeeName,Gender,Address,Phone,BranchID,StartDate,Salary)
VALUES
('Emp25', 'Elijah Martin', 'Male', '456 Birch St, City29', '567-890-1234', 'Branch02', TO_DATE('2023-10-31', 'YYYY-MM-DD'), 70000);
INSERT INTO Employees (EmployeeID,EmployeeName,Gender,Address,Phone,BranchID,StartDate,Salary)
VALUES
('Emp26', 'Scarlett Anderson', 'Female', '789 Maple St, City30', '789-012-3456', 'Branch02', TO_DATE('2023-10-15', 'YYYY-MM-DD'), 75000);
INSERT INTO Employees (EmployeeID,EmployeeName,Gender,Address,Phone,BranchID,StartDate,Salary)
VALUES
('Emp27', 'Aiden Garcia', 'Male', '987 Pine St, City31', '901-234-5678', 'Branch02', TO_DATE('2023-09-30', 'YYYY-MM-DD'), 85000);
INSERT INTO Employees (EmployeeID,EmployeeName,Gender,Address,Phone,BranchID,StartDate,Salary)
VALUES
('Emp28', 'Amelia Robinson', 'Female', '234 Cedar St, City32', '123-456-7890', 'Branch02', TO_DATE('2023-09-15', 'YYYY-MM-DD'), 90000);
INSERT INTO Employees (EmployeeID,EmployeeName,Gender,Address,Phone,BranchID,StartDate,Salary)
VALUES
('Emp29', 'Logan Miller', 'Male', '567 Elm St, City33', '234-567-8901', 'Branch02', TO_DATE('2023-08-31', 'YYYY-MM-DD'), 80000);
INSERT INTO Employees (EmployeeID,EmployeeName,Gender,Address,Phone,BranchID,StartDate,Salary)
VALUES
('Emp30', 'Aria Baker', 'Female', '876 Oak St, City34', '345-678-9012', 'Branch02', TO_DATE('2023-08-15', 'YYYY-MM-DD'), 75000);
INSERT INTO Employees (EmployeeID,EmployeeName,Gender,Address,Phone,BranchID,StartDate,Salary)
VALUES
('Emp31', 'Lucas Carter', 'Male', '123 Birch St, City35', '456-789-0123', 'Branch02', TO_DATE('2023-07-31', 'YYYY-MM-DD'), 70000);
INSERT INTO Employees (EmployeeID,EmployeeName,Gender,Address,Phone,BranchID,StartDate,Salary)
VALUES
('Emp32', 'Ava Coleman', 'Female', '456 Maple St, City36', '567-890-1234', 'Branch02', TO_DATE('2023-07-15', 'YYYY-MM-DD'), 75000);
INSERT INTO Employees (EmployeeID,EmployeeName,Gender,Address,Phone,BranchID,StartDate,Salary)
VALUES
('Emp33', 'Noah Hall', 'Male', '789 Cedar St, City37', '678-901-2345', 'Branch02', TO_DATE('2023-06-30', 'YYYY-MM-DD'), 80000);

--INSERT DATA WAREHIUSE_MANAGES
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch02', 'Phone01', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch02', 'Phone02', 'In Stock');
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch02', 'Phone03', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch02', 'Phone04', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch02', 'Phone05', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch02', 'Phone06', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch02', 'Phone07', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch02', 'Phone08', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch02', 'Phone09', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch02', 'Phone10', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch02', 'Phone11', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch02','Phone12', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch02', 'Phone13', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch02','Phone14', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch02','Phone15', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch02','Phone16', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch02', 'Phone17', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch02', 'Phone18', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch02', 'Phone19', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch02', 'Phone20', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch02', 'Phone21', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch02', 'Phone22', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch02', 'Phone023', 'In Stock'); 
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch02', 'Phone24', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch02', 'Phone25', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch02', 'Phone26', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch02', 'Phone27', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch02', 'Phone28', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch02', 'Phone29', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch02', 'Phone30', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch02', 'Phone31', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch02', 'Phone32', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch02', 'Phone33', 'In Stock') ;
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch02', 'Phone34', 'In Stock');
INSERT INTO Warehouse_Manages (BranchID, PhoneID, Status)
VALUES
('Branch02', 'Phone35', 'In Stock') ;

-- INSERT DATA WAREHOUSE_IMPORTS
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch02','Phone01',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch02','Phone02',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch02','Phone03',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch02','Phone04',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch02','Phone05',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch02','Phone06',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch02','Phone07',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch02','Phone08',TO_DATE('2023-09-15', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch02','Phone09',TO_DATE('2023-05-15', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch02','Phone10',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch02','Phone11',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch02','Phone12',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch02','Phone13',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch02','Phone14',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch02','Phone15',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch02','Phone16',TO_DATE('2023-08-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch02','Phone17',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch02','Phone18',TO_DATE('2023-01-15', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch02','Phone19',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch02','Phone20',TO_DATE('2023-03-15', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch02','Phone21',TO_DATE('2023-03-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch02','Phone22',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch02','Phone23',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch02','Phone24',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch02','Phone25',TO_DATE('2023-04-25', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch02','Phone26',TO_DATE('2023-02-28', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch02','Phone27',TO_DATE('2023-09-20', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch02','Phone28',TO_DATE('2023-06-15', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch02','Phone29',TO_DATE('2023-01-15', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch02','Phone30',TO_DATE('2023-05-10', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch02','Phone31',TO_DATE('2023-09-15', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch02','Phone32',TO_DATE('2023-11-30', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch02','Phone33',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch02','Phone34',TO_DATE('2023-07-15', 'YYYY-MM-DD'),20);
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport)
VALUES
('Branch02','Phone35',TO_DATE('2023-01-01', 'YYYY-MM-DD'),20);

--Payment
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment01','Emp27','Cus07',TO_DATE('2023-12-12', 'YYYY-MM-DD'),399.00);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment02','Emp28','Cus22',TO_DATE('2023-09-12', 'YYYY-MM-DD'),699.00);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment03','Emp33','Cus40',TO_DATE('2023-09-21', 'YYYY-MM-DD'),1599.00);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment04','Emp32','Cus39',TO_DATE('2023-09-29', 'YYYY-MM-DD'),1299.00);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment05','Emp30','Cus28',TO_DATE('2023-10-31', 'YYYY-MM-DD'),1599.00);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment06','Emp32','Cus40',TO_DATE('2023-10-25', 'YYYY-MM-DD'),1199.99);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment07','Emp24','Cus16',TO_DATE('2023-12-12', 'YYYY-MM-DD'),1100.00);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment08','Emp25','Cus05',TO_DATE('2023-10-12', 'YYYY-MM-DD'),389.00);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment09','Emp30','Cus19',TO_DATE('2023-03-03', 'YYYY-MM-DD'),1099.99);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment10','Emp26','Cus13',TO_DATE('2023-06-23', 'YYYY-MM-DD'),350.50);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment11','Emp21','Cus14',TO_DATE('2023-07-16', 'YYYY-MM-DD'),1239.00);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment12','Emp22','Cus12',TO_DATE('2023-05-05', 'YYYY-MM-DD'),800.00);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment13','Emp29','Cus15',TO_DATE('2023-07-30', 'YYYY-MM-DD'),1000.00);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment14','Emp23','Cus24',TO_DATE('2023-08-02', 'YYYY-MM-DD'),1190.00);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment15','Emp31','Cus15',TO_DATE('2023-12-19', 'YYYY-MM-DD'),1599.00);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment16','Emp33','Cus38',TO_DATE('2023-01-13', 'YYYY-MM-DD'),899.99);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment17','Emp21','Cus33',TO_DATE('2023-06-17', 'YYYY-MM-DD'),1299.99);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment18','Emp27','Cus29',TO_DATE('2023-08-28', 'YYYY-MM-DD'),501.00);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment19','Emp29','Cus40',TO_DATE('2023-10-11', 'YYYY-MM-DD'),1599.00);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment20','Emp21','Cus01',TO_DATE('2023-06-11', 'YYYY-MM-DD'),399.99);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment21','Emp23','Cus04',TO_DATE('2023-11-11', 'YYYY-MM-DD'),389.00);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment22','Emp24','Cus11',TO_DATE('2023-11-23', 'YYYY-MM-DD'),2000.00);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment23','Emp29','Cus23',TO_DATE('2023-04-27', 'YYYY-MM-DD'),699.99);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment24','Emp25','Cus04',TO_DATE('2023-04-04', 'YYYY-MM-DD'),899.99);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment25','Emp28','Cus02',TO_DATE('2023-08-30', 'YYYY-MM-DD'),1299.99);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment26','Emp22','Cus06',TO_DATE('2023-07-28', 'YYYY-MM-DD'),1299.99);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment27','Emp26','Cus03',TO_DATE('2023-10-10', 'YYYY-MM-DD'),1599.00);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment28','Emp28','Cus08',TO_DATE('2023-02-28', 'YYYY-MM-DD'),1950.50);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment29','Emp26','Cus17',TO_DATE('2023-01-25', 'YYYY-MM-DD'),1950.50);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment30','Emp25','Cus25',TO_DATE('2023-06-15', 'YYYY-MM-DD'),1800.00);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment31','Emp21','Cus26',TO_DATE('2023-03-11', 'YYYY-MM-DD'),249.50);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment32','Emp30','Cus01',TO_DATE('2023-01-01', 'YYYY-MM-DD'),959.00);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment33','Emp32','Cus01',TO_DATE('2023-10-20', 'YYYY-MM-DD'),800.00);
INSERT INTO Payments (PaymentID,EmployeeID,CustomerID,PaymentDate,TotalCost)
VALUES
('Payment34','Emp28','Cus01',TO_DATE('2023-9-15', 'YYYY-MM-DD'),1599.00);
--Payment_detail
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment01','Phone04',2);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment02','Phone05',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment03','Phone08',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment04','Phone27',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment05','Phone01',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment06','Phone14',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment07','Phone30',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment08','Phone12',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment09','Phone17',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment10','Phone28',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment11','Phone03',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment12','Phone06',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment13','Phone07',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment14','Phone16',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment15','Phone08',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment16','Phone35',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment17','Phone09',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment18','Phone24',2);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment19','Phone08',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment20','Phone19',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment21','Phone12',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment22','Phone07',2);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment23','Phone23',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment24','Phone35',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment25','Phone34',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment26','Phone34',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment27','Phone08',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment28','Phone15',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment29','Phone15',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment30','Phone13',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment31','Phone10',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment32','Phone01',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment33','Phone06',1);
INSERT INTO Payment_Details (PaymentID,PhoneID,Quantity)
VALUES
('Payment34','Phone08',1);
commit;




