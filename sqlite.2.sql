SELECT c.company_name, c.company_number, product_code, CASE WHEN SUM(s.volume*e.exch_rate)=0 THEN 'No sells'
                                                            WHEN SUM(s.volume*e.exch_rate)>0 AND SUM(s.volume*e.exch_rate)<4000 THEN 'Low sales'
                                                            WHEN SUM(s.volume*e.exch_rate)>=4001 and SUM (s.volume*e.exch_rate)<200000 THEN 'Medium sells'
                                                            WHEN SUM(s.volume*e.exch_rate)>200001 THEN 'High sells' 
                                                            END AS sales  
                                                       FROM sales s
LEFT JOIN vcompany c ON s.company_code=c.COMPANY_NUMBER
LEFT JOIN exchange_rate_to_eur e ON s.CURRENCY=e.CURRENCY
GROUP BY s.product_code, c.company_number;

