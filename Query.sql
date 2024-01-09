--CAU 1. Liet ke nhan vien va muc luong cua nhan vien o ca hai chi nhanh (Hoi): Director
(  SELECT EmployeeId, EmployeeName, Salary
FROM BRANCH01.EMPLOYEES@DBL_M01)
UNION
(SELECT EmployeeId, EmployeeName, Salary
FROM BRANCH02.EMPLOYEES);

--CAU 2.Liet ke nhung khach hang mua hang o ca hai chi nhanh (giao): Director
SELECT C1.CustomerID, C1.CustomerName
FROM BRANCH01.CUSTOMERS@DBL_M01 C1, BRANCH01.PAYMENTS@DBL_M01 P1
WHERE C1.CustomerID = P1.CustomerID
INTERSECT
SELECT C2.CustomerID, C2.CustomerName
FROM BRANCH02.CUSTOMERS C2, BRANCH02.PAYMENTS P2
WHERE C2.CustomerID = P2.CustomerID;

--CAU 3. Tìm khách hàng chi mua dien thoai o chi nhánh 1 (tru): Director
SELECT  C.CustomerID, C.CustomerName
FROM CUSTOMERS C, BRANCH01.PAYMENTS@DBL_M01 P1
WHERE C.CustomerID=P1.CustomerID
MINUS
SELECT C.CustomerID, C.CustomerName
FROM CUSTOMERS C, BRANCH02.PAYMENTS P2
WHERE C.CustomerID=P2.CustomerID;

--CAU 4. Top 5 san phan ban chay: Manager
SELECT B2.BranchID,P2.PhoneID, P2.PhoneName, SUM(PD2.Quantity) AS TONGBANDUOC
FROM BRANCH02.PHONES P2, BRANCH02.PAYMENT_DETAILS PD2, BRANCH02.BRANCHES B2
WHERE P2.PhoneID = PD2.PhoneID
GROUP BY P2.PhoneID, P2.PhoneName, B2.BranchID
ORDER BY TONGBANDUOC DESC
FETCH NEXT 5 ROWS ONLY;

--CAU 5. Kiem tra san pham nao thuoc hang samsung va co tu 3 san pham duoc ban o hai chi nhanh:Director 
SELECT P2.PhoneID, P2.PhoneName, P2.Brand, SUM(PD2.Quantity) AS SUM_AMOUNT
FROM BRANCH01.PHONES@DBL_M01 P2, 
BRANCH01.PAYMENT_DETAILS@DBL_M01 PD2
WHERE P2.Brand = 'Samsung' AND P2.PhoneID = PD2.PhoneID
HAVING SUM(PD2.Quantity)>=3
GROUP BY P2.PhoneID, P2.PhoneName, P2.Brand
UNION
SELECT P2.PhoneID, P2.PhoneName, P2.Brand, SUM(PD2.Quantity) AS SUM_AMOUNT
FROM BRANCH02.PHONES P2, BRANCH02.PAYMENT_DETAILS PD2
WHERE P2.Brand = 'Samsung' AND P2.PhoneID = PD2.PhoneID
HAVING SUM(PD2.Quantity)>=3
GROUP BY P2.PhoneID, P2.PhoneName, P2.Brand;

--CAU 6 : Director( giam ?oc) Tim top 3 nhan vien ban ?uoc nhieu ?ien thoai nhat cua ca 2 chi nhanh
(SELECT E1.EmployeeID, E1.EmployeeName, SUM(PD1.Quantity) AS DoanhSo
FROM BRANCH01.Employees E1, BRANCH01.Payments P1, BRANCH01.Payment_Details PD1
WHERE
E1.EmployeeID=P1.EmployeeID
AND P1.PaymentID=PD1.PaymentID
GROUP BY E1.EmployeeID, E1.EmployeeName)
UNION
(SELECT E2.EmployeeID, E2.EmployeeName, SUM(PD2.Quantity) AS DoanhSo
FROM BRANCH02.Employees@DBL_M02 E2, BRANCH02.Payments@DBL_M02 P2, BRANCH02.Payment_details@DBL_M02 PD2
WHERE
E2.EmployeeID=P2.EmployeeID
AND P2.PaymentID=PD2.PaymentID
GROUP BY E2.EmployeeID, E2.EmployeeName)
ORDER BY DOANHSO DESC
FETCH FIRST 3 ROWS ONLY;

--CÂU 7: Director (Giam ?oc) tim cac khach hang ?a mua tat ca ?ien thoai cua Brand là Apple (Phep chia)
SELECT C1.CustomerID, C1.CustomerName
FROM BRANCH01.CUSTOMERS C1
WHERE NOT EXISTS (SELECT *
 FROM BRANCH01.PHONES PH1
 WHERE PH1.Brand = 'Apple'
 AND NOT EXISTS (SELECT * FROM (
 (SELECT * FROM BRANCH01.PAYMENTS P1,
BRANCH01.PAYMENT_DETAILS PD1
 WHERE P1.CustomerID = C1.CustomerID
 AND PD1.PaymentID = P1.PaymentID
 AND PD1.PhoneID = PH1.PhoneID)
 UNION
 (SELECT * FROM
 BRANCH02.PAYMENTS@DBL_M02 P2, BRANCH02.PAYMENT_DETAILS@DBL_M02 PD2
 WHERE P2.CustomerID = C1.CustomerID
 AND PD2.PaymentID = P2.PaymentID
 AND PD2.PhoneID = PH1.PhoneID))));
        
--CÂU 8 Manager xem so luong nhap xuat cua tung hang ?ien thoai tai chi nhanh minh quan ly
SELECT P.Brand,NVL(SUM(WI.QUANTITYIMPORT), 0) AS SLNhap,
NVL(SUM(PD2.QUANTITY), 0) AS SLXuat
FROM BRANCH01.PHONES P
LEFT JOIN BRANCH01.WAREHOUSE_IMPORTS WI ON P.PHONEID=WI.PHONEID
LEFT JOIN BRANCH01.PAYMENT_DETAILS PD2 ON P.PHONEID=PD2.PHONEID
GROUP BY P.Brand;
        
--CÂU 9: Director(giam ?oc) Tien hanh xem so luong nhan vien lam viec  chi nhanh 1 va chi nhanh 2
SELECT B1.BRANCHID, COUNT(E1.EMPLOYEEID) AS NUMBEROFEMPLOYEE
FROM BRANCH01.BRANCHES B1, BRANCH01.EMPLOYEES E1
WHERE B1.BRANCHID = E1.BRANCHID
GROUP BY B1.BRANCHID
UNION
SELECT B2.BRANCHID, COUNT(E2.EMPLOYEEID) AS NUMBEROFEMPLOYEE
FROM BRANCH02.BRANCHES@DBL_M02 B2, BRANCH02.EMPLOYEES@DBL_M02 E2
WHERE B2.BRANCHID = E2.BRANCHID
GROUP BY B2.BRANCHID;
        
--CÂU 10:  Director (Giam ?oc) Liet ke danh sach chi nhanh va tung so l?ong ?ien thoai co trong kho cua tung chi nhanh (Su  dung CROSS JOIN , phep nhan) 
SELECT B1.BranchID, B1.Location, SUM(WI1.QuantityImport) AS TotalPhonesInStock
FROM BRANCH01.Branches B1
CROSS JOIN BRANCH01.Phones PH1
LEFT JOIN BRANCH01.Warehouse_Imports WI1 ON B1.BranchID = WI1.BranchID AND PH1.PhoneID = WI1.PhoneID
GROUP BY B1.BranchID, B1.Location
UNION
SELECT B2.BranchID, B2.Location, SUM(WI2.QuantityImport) AS TotalPhonesInStock
FROM BRANCH02.Branches@DBL_M02 B2
CROSS JOIN BRANCH02.Phones@DBL_M02 PH2
LEFT JOIN BRANCH02.Warehouse_Imports@DBL_M02 WI2 ON B2.BranchID = WI2.BranchID AND PH2.PhoneID = WI2.PhoneID
GROUP BY B2.BranchID, B2.Location