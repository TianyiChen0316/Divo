--dsb_templates_generated-8b52366e-4290-44bd-b615-30394ec57715_456824cd-1db6-300c-b3b3-36eeddb1a0ae.sql
--{"gen": "erase", "time": 2.1052236557006836, "template": "generated-8b52366e-4290-44bd-b615-30394ec57715", "dataset": "dsb_templates", "rows": 100}
SELECT coalesce(customer.c_last_name, '') || ', ' || coalesce(customer.c_first_name, '') AS customername,
customer.c_customer_id AS customer_id
FROM customer AS customer,
customer_demographics AS customer_demographics,
store_returns AS store_returns,
inventory AS inventory,
store AS store,
warehouse AS warehouse,
web_sales AS web_sales
WHERE (web_sales.ws_wholesale_cost BETWEEN 77 AND 97 AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_warehouse_sk = inventory.inv_warehouse_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND store.s_state = warehouse.w_state AND inventory.inv_warehouse_sk = warehouse.w_warehouse_sk AND web_sales.ws_item_sk = inventory.inv_item_sk)
 order by customer.c_customer_id LIMIT 100