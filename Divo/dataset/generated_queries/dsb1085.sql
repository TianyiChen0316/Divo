--dsb_templates_generated-346675bf-6f4d-4a4b-858d-0ad354bf44fe_b0145955-43fe-3734-972e-fae8f3886646.sql
--{"gen": "erase", "time": 0.5610024929046631, "template": "generated-346675bf-6f4d-4a4b-858d-0ad354bf44fe", "dataset": "dsb_templates", "rows": 1}
SELECT count(*) AS cnt
FROM customer AS customer,
customer_address AS customer_address,
warehouse AS warehouse,
web_sales AS web_sales
WHERE (customer_address.ca_state IN ('GA', 'KS', 'NH', 'OH', 'WA') AND web_sales.ws_wholesale_cost BETWEEN 37 AND 57 AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk)
 order by cnt