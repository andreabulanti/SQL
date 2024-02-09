USE classicmodels;

-- elenco delle persone dei lavoratori con mansione = rapprsentante di vendite
SELECT firstName, lastName, jobTitle from employees where jobTitle = "Sales Rep"; 

-- numero dei lavoratori con mansione = rappresentante di vendite
SELECT count(*) from employees where jobTitle = "Sales Rep"; 

-- elenco dei rappresentanti che hanno effettuato almeno una vendita
SELECT CONCAT(emp.firstName," ", emp.lastName) AS EmployeeName FROM employees emp
WHERE EXISTS (SELECT cus.customerNumber FROM customers cus WHERE emp.employeeNumber = cus.salesRepEmployeeNumber);

-- Elenco JobTitle
SELECT DISTINCT(jobTitle) FROM employees;

-- elenco dei primi 3 prodotti con le scorte più basse
SELECT productLine, SUM(quantityInStock) as TotalQuantityInStock FROM products
GROUP BY productLine
ORDER BY 2 ASC
LIMIT 3;

-- totale dei clienti con paganmento in scadenza <=31/12/2004

SELECT c.customerName, p.paymentDate FROM customers c
INNER JOIN payments p
ON
c.customerNumber = p.customerNumber AND paymentDate <= "2004-12-31"
ORDER BY 2 DESC;

-- Totale da incassare per cliente con data pagamento <= 31/12/2004
SELECT c.customerName, SUM(p.amount) AS amount FROM customers c
INNER JOIN payments p
ON
c.customerNumber = p.customerNumber AND paymentDate <= "2004-12-31"
GROUP BY c.customerName
ORDER BY 2 DESC
