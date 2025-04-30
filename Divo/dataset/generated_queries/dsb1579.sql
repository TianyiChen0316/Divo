--dsb_templates_generated-478e258a-4d8a-4d9e-b9a1-4f07ddb6e9b4_18a75064-34bf-3cf4-ae93-c8c68987913d.sql
--{"gen": "erase", "time": 1.092235803604126, "template": "generated-478e258a-4d8a-4d9e-b9a1-4f07ddb6e9b4", "dataset": "dsb_templates", "rows": 1}
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
date_dim AS d3,
customer AS customer,
web_sales AS web_sales
WHERE (date_dim.d_year = 2000 AND item.i_category = 'Shoes' AND d2.d_moy = 4 AND d2.d_year = 1999 AND d3.d_moy BETWEEN 6 AND 6 + 2 AND d3.d_year = 1998 AND web_sales.ws_wholesale_cost BETWEEN 75 AND 95 AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_sold_date_sk = d3.d_date_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk AND web_sales.ws_bill_customer_sk = store_returns.sr_customer_sk AND web_sales.ws_bill_customer_sk = store_sales.ss_customer_sk AND catalog_sales.cs_bill_customer_sk = web_sales.ws_bill_customer_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk)
 group by rollup(item.i_item_id) order by item.i_item_id LIMIT 100