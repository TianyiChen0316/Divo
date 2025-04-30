--dsb_templates_generated-19c8d3c5-f4d9-4325-abd4-3945bae7efc7_42e13aed-dd4f-35f6-a724-26760bd623b6.sql
--{"gen": "erase", "time": 0.5954000949859619, "template": "generated-19c8d3c5-f4d9-4325-abd4-3945bae7efc7", "dataset": "dsb_templates", "rows": 1}
SELECT count(*) AS cnt
FROM customer AS customer,
customer_address AS customer_address,
web_sales AS web_sales
WHERE (customer_address.ca_state IN ('GA', 'KS', 'NH', 'OH', 'WA') AND web_sales.ws_wholesale_cost BETWEEN 55 AND 75 AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk)
 order by cnt