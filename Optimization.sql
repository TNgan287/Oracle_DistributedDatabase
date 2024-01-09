-- CHUONG 5 TOI UU HOA CAU TRUY VAN
-- THONG KE SO LUONG DIEN THOAI DA BAN DUOC CUA TUNG NHAN VIEN O BRANCH01, GIAM DAN THEO SO LUONG.
EXPLAIN PLAN FOR 
SELECT E.EmployeeID, E.EmployeeName, SUM(PD.Quantity) AS DoanhSo   
FROM BRANCHES B, EMPLOYEES E, PAYMENTS P, PAYMENT_DETAILS PD   
WHERE B.BRANCHID=E.BRANCHID AND E.EmployeeID=P.EmployeeID  
    AND P.PaymentID=PD.PaymentID    
    AND EXTRACT(YEAR FROM PAYMENTDATE)=2023   
    AND B.BRANCHID ='Branch01'   
GROUP BY E.EmployeeID, EmployeeName ORDER BY DoanhSo DESC;
select * from table(dbms_xplan.display); 

-- TOI UU HOA CAU TRUY VAN
EXPLAIN PLAN FOR 
SELECT EmployeeID, EmployeeName, SUM(Quantity) AS SL 
FROM( 
    SELECT EmployeeID, EmployeeName, Quantity 
    FROM 
        (SELECT E1.EmployeeID, EmployeeName, PaymentID 
        FROM 
            (SELECT EmployeeID, EmployeeName 
            FROM EMPLOYEES) E1 
            JOIN 
            (SELECT PaymentID, EmployeeID 
            FROM PAYMENTS 
            WHERE EXTRACT(YEAR FROM PaymentDate)=2023) P1 
            ON E1.EmployeeID=P1.EmployeeID 
            ) EP1 
    JOIN 
    (SELECT PAYMENTID, Quantity 
    FROM PAYMENT_DETAILS 
    ) PD1 
    ON EP1.PaymentID=PD1.PaymentID) 
GROUP BY EmployeeID, EmployeeName; 
select * from table(dbms_xplan.display); 