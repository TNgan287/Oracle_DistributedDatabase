-- CHUONG 3 VIET HAM, THU TUC, RANG BUOC TOAN VEN TREN MOI TRUONG PHAN TAN 

-- 3.1. FUNCTION
-- Function to calculate the total spending of a customer across two branches 
CREATE OR REPLACE FUNCTION  CalculateAverageOrderValue(CUSID VARCHAR2)  
RETURN NUMBER  
AS  
  V_TONGTIEN NUMBER;  
BEGIN  
  -- Calculate total cost from local and remote Payments table 
  SELECT SUM(TOTAL_COST) INTO V_TONGTIEN  
  FROM(  
    SELECT SUM(P.TotalCost) AS TOTAL_COST  
    FROM BRANCH02.Payments P 
    WHERE P.CustomerID = CUSID 
    UNION ALL  
    SELECT SUM(P.TotalCost) AS TOTAL_COST  
    FROM BRANCH01.Payments@DBL_M01 P  
    WHERE P.CustomerID = CUSID 
  );  
  RETURN V_TONGTIEN;  
EXCEPTION  
  -- Return 0 if no data found 
  WHEN NO_DATA_FOUND THEN  
    RETURN 0;  
  -- Optionally, handle other exceptions 
  WHEN OTHERS THEN  
    -- Handle other exceptions or re-raise 
    RAISE; 
END; 

-- THUC THI
DECLARE 
  V_CUSTOMER_ID VARCHAR2(50) := 'Cus01';  
  V_TOTAL_SPENT NUMBER; 
BEGIN 
  -- Call the function and output the result 
  V_TOTAL_SPENT := CalculateAverageOrderValue(V_CUSTOMER_ID); 
  DBMS_OUTPUT.PUT_LINE('Total spent by customer ' || V_CUSTOMER_ID || ' is: ' || V_TOTAL_SPENT); 
EXCEPTION 
  WHEN OTHERS THEN 
    -- Output error message in case of an exception 
    DBMS_OUTPUT.PUT_LINE(SQLERRM); 
END; 


-- 3.2. STORED PROCEDURE
CREATE OR REPLACE PROCEDURE updateEmployeeSalary(empID IN VARCHAR2, sal IN NUMBER) IS 
    empExists NUMBER; 
BEGIN 
    -- Check in Branch02 first 
    SELECT COUNT(*) INTO empExists FROM Branch02.Employees WHERE EmployeeID = empID; 
    IF empExists > 0 THEN 
        -- Employee found in Branch02, update salary 
        UPDATE Branch02.Employees SET Salary = sal WHERE EmployeeID = empID; 
    ELSE 
        -- If not found in Branch02, check in Branch01 
        SELECT COUNT(*) INTO empExists FROM Branch01.Employees@DBL_M01 WHERE EmployeeID = empID; 
        IF empExists > 0 THEN 
            -- Employee found in Branch01, update salary 
            UPDATE Branch01.Employees@DBL_M01 SET Salary = sal WHERE EmployeeID = empID; 
        END IF; 
    END IF; 
    -- Only commit if an update has occurred 
    IF empExists > 0 THEN 
        COMMIT; 
    END IF; 
END; 

-- THUC THI
BEGIN 
    updateEmployeeSalary('Emp01', 123455);
END; 

-- 3.3. RBTV (Referential Integrity Constraint) 
-- TRIGGER 1:
CREATE OR REPLACE TRIGGER trg_CUS_insert_update 
AFTER INSERT OR UPDATE ON Customers 
FOR EACH ROW 
DECLARE 
    today DATE; 
BEGIN 
    SELECT SYSDATE INTO today FROM DUAL; 
    IF EXTRACT(YEAR FROM today) - EXTRACT(YEAR FROM :NEW.Birthday) < 15 THEN 
        RAISE_APPLICATION_ERROR(-20100, 'Customers must be at least 15 years old to conduct transactions'); 
    END IF; 
END;

-- THUC THI
INSERT INTO Customers (CustomerId, CustomerName, Gender, Address, Phone, Birthday, Membership, Spending) 
VALUES 
('Cus47', 'Jane Smith', 'Female', '456 Oak St', '555-5678', TO_DATE('2009-05-20', 'YYYY-MM-DD'), 'Silver', 300.50); 


-- TRIGGER 2:
CREATE OR REPLACE TRIGGER CheckDateConstraintPayments 
BEFORE INSERT OR UPDATE ON Payments 
FOR EACH ROW 
DECLARE 
    v_StartDate DATE; 
BEGIN 
    SELECT StartDate 
    INTO v_StartDate 
    FROM Employees 
    WHERE EmployeeID = :NEW.EmployeeID; 
    IF (:NEW.PaymentDate IS NOT NULL AND v_StartDate IS NOT NULL AND :NEW.PaymentDate < v_StartDate) THEN 
        RAISE_APPLICATION_ERROR(-20002, 'Payment date must be after the employee''s start date'); 
    END IF; 
END; 

-- THUC THI
UPDATE payments 
SET paymentdate = TO_DATE('2022-01-01', 'YYYY-MM-DD') 
WHERE paymentid = 'Payment02'; 

-- TRIGGER 3:
CREATE OR REPLACE TRIGGER TRG_VALID_WAREHOUSE_INSERT_UPDATE 
BEFORE INSERT OR UPDATE ON Warehouse_Imports 
FOR EACH ROW 
BEGIN 
    IF(:NEW.QuantityImport <= 0) 
    THEN 
    RAISE_APPLICATION_ERROR(-20100, 'The import quantity is not valid'); 
    END IF; 
END;

-- THUC THI
INSERT INTO Warehouse_Imports (BranchID,PhoneID,ImportDate,QuantityImport) 
VALUES 
('Branch02','Phone35',TO_DATE('2023-01-01', 'YYYY-MM-DD'),-4);

-- TRIGGER 4:
CREATE OR REPLACE TRIGGER TRG_CHECK_EMPLOYEE_DELETE 
BEFORE DELETE ON Employees FOR EACH ROW 
DECLARE 
    v_payment_count NUMBER; 
BEGIN 
    -- Kiểm tra xem nhân viên có liên quan đến giao dịch nào không 
    SELECT COUNT(*) 
    INTO v_payment_count 
    FROM Payments 
    WHERE EmployeeID = :OLD.EmployeeID; 
    -- Nếu nhân viên đã tham gia vào giao dịch, không cho phép xóa 
    IF v_payment_count > 0 THEN 
        RAISE_APPLICATION_ERROR(-20100, 'Cannot delete employee who has existing transactions'); 
    END IF; 
END;

-- THUC THI
DELETE FROM Employees WHERE EmployeeID = 'Emp27';
