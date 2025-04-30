--dsb_templates_generated-5cc9db60-6f00-4752-95f9-5ad868259813_ff59227f-d7b6-3740-a278-1d52b849911f.sql
--{"gen": "combine", "time": 1.6793930530548096, "template": "generated-5cc9db60-6f00-4752-95f9-5ad868259813", "dataset": "dsb_templates", "rows": 100}
SELECT coalesce(customer.c_last_name, '') || ', ' || coalesce(customer.c_first_name, '') AS customername,
customer.c_customer_id AS customer_id
FROM customer AS customer,
household_demographics AS household_demographics,
income_band AS income_band,
customer_address AS customer_address,
inventory AS inventory,
item AS item,
warehouse AS warehouse,
web_sales AS web_sales
WHERE (income_band.ib_lower_bound >= 22635 AND income_band.ib_upper_bound <= 23628 + 50000 AND customer_address.ca_state IN ('GA', 'KS', 'NH', 'OH', 'WA') AND item.i_category IN ('Electronics', 'Jewelry', 'Women') AND item.i_manager_id IN (3, 7, 8, 19, 28, 32, 42, 53, 55, 92) AND web_sales.ws_wholesale_cost BETWEEN 73 AND 93 AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_warehouse_sk = inventory.inv_warehouse_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND item.i_item_sk = inventory.inv_item_sk AND item.i_item_sk = web_sales.ws_item_sk AND inventory.inv_item_sk = web_sales.ws_item_sk AND inventory.inv_warehouse_sk = warehouse.w_warehouse_sk)
 order by customer.c_customer_id LIMIT 100