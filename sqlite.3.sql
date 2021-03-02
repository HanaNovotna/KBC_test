Select c.company_name, c.company_number, s.client_number, s.product_code FROM sales s
LEFT JOIN vcompany c ON c.company_number=s.COMPANY_CODE
Where client_number IN
(SELECT client_number FROM sales s
Group by client_number
HAVING MIN(product_code)>1);

