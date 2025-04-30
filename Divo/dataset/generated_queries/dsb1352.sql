--dsb_templates_generated-b51b358b-ba66-4a21-a227-e0e63d4b72da_68566e2d-e46a-37e6-aac1-c2356909d4ba.sql
--{"gen": "erase", "time": 1.5770506858825684, "template": "generated-b51b358b-ba66-4a21-a227-e0e63d4b72da", "dataset": "dsb_templates", "rows": 6}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
item.i_item_id
FROM date_dim AS date_dim,
item AS item,
store_sales AS store_sales,
date_dim AS d1,
store_returns AS store_returns,
catalog_sales AS catalog_sales,
date_dim AS d3
WHERE (date_dim.d_year = 1999 AND item.i_category = 'Electronics' AND d3.d_moy BETWEEN 8 AND 8 + 2 AND d3.d_year = 2001 AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND date_dim.d_date_sk = d1.d_date_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_sold_date_sk = d3.d_date_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk)
 group by rollup(item.i_item_id) order by item.i_item_id LIMIT 100