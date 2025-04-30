--dsb_templates_generated-cae71d0c-1127-4221-a7cf-72a84f294afb_7c2e798e-4bd7-35d8-85e3-76ef914a415f.sql
--{"gen": "combine", "time": 0.5637669563293457, "template": "generated-cae71d0c-1127-4221-a7cf-72a84f294afb", "dataset": "dsb_templates", "rows": 1}
SELECT sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 30 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 60) then 1 else 0 end) AS "31-60 days",
sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 60 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 90) then 1 else 0 end) AS "61-90 days",
sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 90 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 120) then 1 else 0 end) AS "91-120 days",
sum(case when store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 30 then 1 else 0 end) AS "30 days",
sum(case when store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 120 then 1 else 0 end) AS ">120 days"
FROM date_dim AS d1,
store_returns AS store_returns,
store_sales AS store_sales,
inventory AS inventory,
warehouse AS warehouse,
customer AS customer,
customer_address AS customer_address,
date_dim AS date_dim,
item AS item,
store AS store
WHERE (customer.c_birth_month = 12 AND customer_address.ca_state = 'AR' AND date_dim.d_moy = 3 AND date_dim.d_year = 2000 AND item.i_category = 'Sports' AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND inventory.inv_date_sk = store_sales.ss_sold_date_sk AND inventory.inv_item_sk = store_sales.ss_item_sk AND store_returns.sr_item_sk = inventory.inv_item_sk AND inventory.inv_warehouse_sk = warehouse.w_warehouse_sk AND inventory.inv_date_sk = d1.d_date_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_store_sk = store.s_store_sk AND item.i_item_sk = store_returns.sr_item_sk AND item.i_item_sk = inventory.inv_item_sk AND inventory.inv_date_sk = date_dim.d_date_sk AND date_dim.d_date_sk = d1.d_date_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND inventory.inv_quantity_on_hand >= store_sales.ss_quantity AND pg_catalog.substring(customer_address.ca_zip, 1, 5) <> pg_catalog.substring(store.s_zip, 1, 5))
 LIMIT 100