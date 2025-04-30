--dsb_templates_generated-da411b70-1e3d-4632-8b6d-9c6bfbc07025_f6953783-ffbb-38c5-a260-c4036c032d03.sql
--{"gen": "combine", "time": 2.611644744873047, "template": "generated-da411b70-1e3d-4632-8b6d-9c6bfbc07025", "dataset": "dsb_templates", "rows": 100}
SELECT coalesce(customer.c_last_name, '') || ', ' || coalesce(customer.c_first_name, '') AS customername,
customer.c_customer_id AS customer_id
FROM customer AS customer,
customer_demographics AS customer_demographics,
store_returns AS store_returns,
inventory AS inventory,
item AS item,
store AS store,
warehouse AS warehouse,
web_sales AS web_sales
WHERE (item.i_category IN ('Electronics', 'Jewelry', 'Women') AND item.i_manager_id IN (3, 7, 8, 19, 28, 32, 42, 53, 55, 92) AND web_sales.ws_wholesale_cost BETWEEN 17 AND 37 AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_warehouse_sk = inventory.inv_warehouse_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND store.s_state = warehouse.w_state AND inventory.inv_warehouse_sk = warehouse.w_warehouse_sk AND item.i_item_sk = web_sales.ws_item_sk AND item.i_item_sk = inventory.inv_item_sk AND web_sales.ws_item_sk = inventory.inv_item_sk)
 order by customer.c_customer_id LIMIT 100