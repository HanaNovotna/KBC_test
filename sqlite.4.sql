SELECT p.product_name, p.product_code, c.company_name, SUBSTRING(s.sales_date,1,4), SUM(s.volume*e.EXCH_RATE) FROM sales s
LEFT JOIN vproducts p ON s.product_code=p.product_code
LEFT JOIN vcompany c ON s.COMPANY_CODE=c.company_number
LEFT JOIN exchange_rate_to_eur e ON s.CURRENCY=e.CURRENCY
GROUP BY p.product_code, c.company_number, SUBSTRING(s.sales_date,1,4)
HAVING SUM(s.volume*e.EXCH_RATE)>0
ORDER BY p.product_code ASC, SUBSTRING(s.sales_date,1,4) DESC
;
