--Vytvoření view nad tabulkou company - standardizace číselníku.
CREATE VIEW vcompany AS
SELECT DISTINCT company_name, company_number, max(extraction_date) FROM company GROUP by company_number;
--Vytvoření view nad tabulkou products - standardizace číselníku.
CREATE VIEW vproducts AS
SELECT DISTINCT product_code, product_name, start_date, end_date from products;
--Výběr platné nabídky produktů
SELECT DISTINCT c.company_name, c.company_number, p.product_code FROM bridge b
LEFT JOIN vcompany c ON c.company_number=b.company_code
LEFT JOIN vproducts p ON p.product_code=b.product_code
WHERE p.end_date isNULL AND b.end_date ISNULL;

