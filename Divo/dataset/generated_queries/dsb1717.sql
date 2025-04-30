--dsb_templates_generated-5f0f5699-4051-4a38-99a2-7d35e0eeff28_45879a24-ce91-3469-88bf-fb48c747d19f.sql
--{"gen": "erase", "time": 0.4639911651611328, "template": "generated-5f0f5699-4051-4a38-99a2-7d35e0eeff28", "dataset": "dsb_templates", "rows": 1}
SELECT sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 30 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 60) then 1 else 0 end) AS "31-60 days",
sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 60 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 90) then 1 else 0 end) AS "61-90 days",
sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 90 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 120) then 1 else 0 end) AS "91-120 days",
sum(case when store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 30 then 1 else 0 end) AS "30 days",
sum(case when store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 120 then 1 else 0 end) AS ">120 days"
FROM date_dim AS d2,
store_returns AS store_returns,
store_sales AS store_sales,
customer AS customer,
customer_demographics AS customer_demographics,
inventory AS inventory,
warehouse AS warehouse
WHERE (d2.d_year = 1999 AND d2.d_moy = 6 AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND inventory.inv_date_sk = store_sales.ss_sold_date_sk AND inventory.inv_item_sk = store_sales.ss_item_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_returns.sr_item_sk = inventory.inv_item_sk AND inventory.inv_warehouse_sk = warehouse.w_warehouse_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND inventory.inv_quantity_on_hand >= store_sales.ss_quantity)
 LIMIT 100