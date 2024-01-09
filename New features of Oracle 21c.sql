-- CHUONG 6 CAC DAC DIEM MOI CUA ORACLE 21C

-- MACRO TINH TONG CHI TIEU KHACH HANG
CREATE OR REPLACE FUNCTION TotalSpendingMacro(customer_id IN VARCHAR2) 
RETURN VARCHAR2 SQL_MACRO IS 
BEGIN 
  RETURN 'SELECT SUM(TotalCost) as TOTAL_SPEND FROM (' 
         || 'SELECT SUM(TotalCost) TotalCost FROM branch02.Payments p2 WHERE p2.CustomerID = ''' || customer_id || ''' ' 
         || 'UNION ALL ' 
         || 'SELECT SUM(TotalCost) TotalCost FROM branch01.Payments@DBL_M01 p1 WHERE p1.CustomerID = ''' || customer_id || '''' 
         || ')'; 
END;

-- THUC THI
DECLARE 
  v_SQL VARCHAR2(1000); 
  v_TotalSpend NUMBER; 
BEGIN 
  -- Lấy câu truy vấn SQL từ Macro 
  v_SQL := TotalSpendingMacro('Cus01'); 
  EXECUTE IMMEDIATE v_SQL INTO v_TotalSpend; 
  DBMS_OUTPUT.PUT_LINE('Total Spending for Cus01: ' || TO_CHAR(v_TotalSpend)); 
END; 

-- MACRO CAP NHAT LUONG NHAN VIEN
CREATE OR REPLACE FUNCTION UpdateSalaryMacro(emp_id VARCHAR2, new_salary NUMBER) 
RETURN VARCHAR2 SQL_MACRO IS 
BEGIN 
  RETURN 'UPDATE Branch02.Employees SET Salary = ' || new_salary ||  
         ' WHERE EmployeeID = ''' || emp_id || '''; ' || 
         'UPDATE Branch01.Employees@DBL_M01 SET Salary = ' || new_salary ||  
         ' WHERE EmployeeID = ''' || emp_id || ''''; 
END;

-- THUC THI
DECLARE 
  v_SQL VARCHAR2(1000); 
  v_SplitIndex PLS_INTEGER; 
  v_EmpID VARCHAR2(20) := 'Emp01'; 
  v_NewSalary NUMBER := 9999; 
BEGIN 
  -- Lấy câu lệnh SQL từ Macro 
  v_SQL := UpdateSalaryMacro(v_EmpID, v_NewSalary); 
  -- Tìm vị trí của dấu chấm phẩy để tách hai câu lệnh 
  v_SplitIndex := INSTR(v_SQL, ';'); 
  -- Thực thi câu lệnh SQL đầu tiên 
  EXECUTE IMMEDIATE SUBSTR(v_SQL, 1, v_SplitIndex-1); 
  -- Thực thi câu lệnh SQL thứ hai 
  EXECUTE IMMEDIATE SUBSTR(v_SQL, v_SplitIndex+1); 
  COMMIT; 
  DBMS_OUTPUT.PUT_LINE('Salary updated for ' || v_EmpID || ' to ' || TO_CHAR(v_NewSalary)); 
END;