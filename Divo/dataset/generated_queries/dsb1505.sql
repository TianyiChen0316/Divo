--dsb_templates_generated-213f37ff-6ff8-46e3-a4d5-46ab02d94a45_15604886-3220-3f37-9dc7-5ee7c8d49378.sql
--{"gen": "combine", "time": 0.37018513679504395, "template": "generated-213f37ff-6ff8-46e3-a4d5-46ab02d94a45", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4
FROM store_sales AS store_sales,
date_dim AS d2,
store_returns AS store_returns,
customer AS customer,
catalog_sales AS catalog_sales,
date_dim AS d1,
item AS item,
store AS store
WHERE (d2.d_moy = 7 AND d2.d_year = 1998 AND customer.c_birth_month = 3 AND d1.d_moy = 11 AND d1.d_year = 2000 AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk AND d1.d_date_sk = store_sales.ss_sold_date_sk AND item.i_item_sk = store_sales.ss_item_sk AND store.s_store_sk = store_sales.ss_store_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND store_sales.ss_item_sk = catalog_sales.cs_item_sk AND store_returns.sr_item_sk = item.i_item_sk AND item.i_item_sk = catalog_sales.cs_item_sk AND customer.c_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_bill_customer_sk = store_sales.ss_customer_sk)
 LIMIT 100