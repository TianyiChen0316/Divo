--dsb_templates_generated-35d4de54-417a-40af-8c96-10ecd945b172_5250caf3-91ab-3e03-a446-2062b48e9242.sql
--{"gen": "erase", "time": 1.62192702293396, "template": "generated-35d4de54-417a-40af-8c96-10ecd945b172", "dataset": "dsb_templates", "rows": 1}
SELECT avg(catalog_sales.cs_coupon_amt::numeric(12, 2)) AS agg3,
avg(catalog_sales.cs_list_price::numeric(12, 2)) AS agg2,
avg(catalog_sales.cs_net_profit::numeric(12, 2)) AS agg5,
avg(catalog_sales.cs_quantity::numeric(12, 2)) AS agg1,
avg(catalog_sales.cs_sales_price::numeric(12, 2)) AS agg4,
avg(customer.c_birth_year::numeric(12, 2)) AS agg6
FROM catalog_sales AS catalog_sales,
customer AS customer,
date_dim AS date_dim,
date_dim AS d1,
date_dim AS d2,
store_returns AS store_returns,
store_sales AS store_sales,
web_sales AS web_sales,
date_dim AS d3,
item AS item
WHERE (catalog_sales.cs_wholesale_cost BETWEEN 23 AND 28 AND customer.c_birth_month = 4 AND date_dim.d_year = 1999 AND d1.d_year = 2002 AND store_sales.ss_sales_price / store_sales.ss_list_price BETWEEN 29 * 0.01 AND 49 * 0.01 AND d3.d_moy BETWEEN 2 AND 2 + 2 AND d3.d_year = 2001 AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND catalog_sales.cs_sold_date_sk = date_dim.d_date_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND store_returns.sr_returned_date_sk = d1.d_date_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND web_sales.ws_sold_date_sk = d2.d_date_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_bill_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_bill_customer_sk = store_sales.ss_customer_sk AND catalog_sales.cs_sold_date_sk = d3.d_date_sk AND item.i_item_sk = store_sales.ss_item_sk AND store_returns.sr_item_sk = item.i_item_sk AND web_sales.ws_item_sk = item.i_item_sk AND item.i_item_sk = catalog_sales.cs_item_sk AND date_dim.d_date_sk = d3.d_date_sk AND d2.d_date BETWEEN d1.d_date AND d1.d_date + '90 day'::interval)
 LIMIT 100