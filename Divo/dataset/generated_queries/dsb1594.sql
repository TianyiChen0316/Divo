--dsb_templates_generated-ec8b5d38-c28d-4243-ad8d-c39a161666a2_d1edd303-1372-344b-b7df-62aaf8cede69.sql
--{"gen": "erase", "time": 0.3714146614074707, "template": "generated-ec8b5d38-c28d-4243-ad8d-c39a161666a2", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
grouping(store.s_state) AS g_state,
item.i_item_id,
store.s_state
FROM date_dim AS date_dim,
item AS item,
store AS store,
store_sales AS store_sales,
date_dim AS d1,
date_dim AS d2,
store_returns AS store_returns,
catalog_sales AS catalog_sales,
customer AS customer
WHERE (date_dim.d_year = 1998 AND item.i_category = 'Shoes' AND store.s_state = 'GA' AND d2.d_moy = 4 AND d2.d_year = 2001 AND catalog_sales.cs_wholesale_cost BETWEEN 25 AND 30 AND customer.c_birth_month = 2 AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND date_dim.d_date_sk = d1.d_date_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_sold_date_sk = date_dim.d_date_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk AND catalog_sales.cs_bill_cdemo_sk = store_returns.sr_cdemo_sk AND catalog_sales.cs_bill_cdemo_sk = customer.c_current_cdemo_sk AND store_sales.ss_item_sk = catalog_sales.cs_item_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND customer.c_current_cdemo_sk = store_sales.ss_cdemo_sk AND store_returns.sr_cdemo_sk = store_sales.ss_cdemo_sk AND catalog_sales.cs_bill_cdemo_sk = store_sales.ss_cdemo_sk AND d1.d_date_sk = catalog_sales.cs_sold_date_sk AND catalog_sales.cs_sold_date_sk = store_sales.ss_sold_date_sk AND d1.d_date BETWEEN d2.d_date - '120 day'::interval AND d2.d_date)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100