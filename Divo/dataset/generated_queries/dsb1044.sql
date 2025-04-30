--dsb_templates_generated-346675bf-6f4d-4a4b-858d-0ad354bf44fe_899d6b4f-0b51-35d7-9bc1-e1e861fe2bde.sql
--{"gen": "erase", "time": 0.582179069519043, "template": "generated-346675bf-6f4d-4a4b-858d-0ad354bf44fe", "dataset": "dsb_templates", "rows": 1}
SELECT count(*) AS cnt
FROM customer AS customer,
customer_address AS customer_address,
warehouse AS warehouse,
web_sales AS web_sales
WHERE (customer_address.ca_state IN ('GA', 'KS', 'NH', 'OH', 'WA') AND web_sales.ws_wholesale_cost BETWEEN 73 AND 93 AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk)
 order by cnt