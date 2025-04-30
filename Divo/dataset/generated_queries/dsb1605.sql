--dsb_templates_generated-19c8d3c5-f4d9-4325-abd4-3945bae7efc7_2a46ef13-0832-3d74-945b-6aaae6f76d53.sql
--{"gen": "erase", "time": 0.5911715030670166, "template": "generated-19c8d3c5-f4d9-4325-abd4-3945bae7efc7", "dataset": "dsb_templates", "rows": 1}
SELECT count(*) AS cnt
FROM customer AS customer,
customer_address AS customer_address,
web_sales AS web_sales
WHERE (customer_address.ca_state IN ('GA', 'KS', 'NH', 'OH', 'WA') AND web_sales.ws_wholesale_cost BETWEEN 62 AND 82 AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk)
 order by cnt