--dsb_templates_query027_036_b2dcd340-96b3-3c5e-aae0-c671074604ef.sql
--{"gen": "combine", "time": 0.3005101680755615, "template": "query027_036", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
item.i_item_id
FROM date_dim AS date_dim,
item AS item,
store_sales AS store_sales,
date_dim AS d2,
store_returns AS store_returns,
catalog_sales AS catalog_sales,
customer AS customer,
call_center AS call_center,
warehouse AS warehouse
WHERE (date_dim.d_year = 1999 AND item.i_category = 'Women' AND d2.d_moy = 11 AND d2.d_year = 2000 AND customer.c_birth_month = 2 AND call_center.cc_class = 'small' AND warehouse.w_gmt_offset = -5 AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk AND catalog_sales.cs_call_center_sk = call_center.cc_call_center_sk AND catalog_sales.cs_warehouse_sk = warehouse.w_warehouse_sk)
 group by rollup(item.i_item_id) order by item.i_item_id LIMIT 100