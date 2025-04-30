--dsb_templates_generated-507578a5-4734-4078-9491-21c071e72369_da96789a-4d29-3740-a231-b47cb95bb041.sql
--{"gen": "erase", "time": 3.274350643157959, "template": "generated-507578a5-4734-4078-9491-21c071e72369", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4
FROM date_dim AS date_dim,
store_sales AS store_sales,
store_returns AS store_returns,
catalog_sales AS catalog_sales,
date_dim AS d3
WHERE (date_dim.d_year = 2000 AND d3.d_moy BETWEEN 3 AND 3 + 2 AND d3.d_year = 2002 AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_sold_date_sk = d3.d_date_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk)
 LIMIT 100