Select ((SELECT SUM(s.volume) FROM sales s
Where currency='EUR')
/
(SELECT SUM(s.volume*e.EXCH_RATE) FROM sales s
JOIN exchange_rate_to_eur e ON s.CURRENCY=e.CURRENCY)
*100)
;

