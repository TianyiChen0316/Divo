--dsb_templates_generated-9722fc46-9fc6-46af-9549-1504d7fe2d5c_3a80aecd-adce-325e-ac39-9a37bde3a7e0.sql
--{"gen": "erase", "time": 0.424274206161499, "template": "generated-9722fc46-9fc6-46af-9549-1504d7fe2d5c", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4
FROM store_sales AS store_sales,
date_dim AS d2,
store_returns AS store_returns,
catalog_sales AS catalog_sales,
date_dim AS d3,
customer AS customer
WHERE (d2.d_moy = 11 AND d2.d_year = 2000 AND d3.d_moy BETWEEN 8 AND 8 + 2 AND d3.d_year = 2000 AND customer.c_birth_month = 11 AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_sold_date_sk = d3.d_date_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk)
 LIMIT 100