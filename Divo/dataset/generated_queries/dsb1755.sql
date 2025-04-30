--dsb_templates_generated-2439cf9d-3a6c-4065-b341-f306b26e219b_fa5870dd-a778-36ee-9117-6e0293957f30.sql
--{"gen": "combine", "time": 4.364052772521973, "template": "generated-2439cf9d-3a6c-4065-b341-f306b26e219b", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
grouping(store.s_state) AS g_state,
store.s_state
FROM customer_demographics AS customer_demographics,
date_dim AS date_dim,
store AS store,
store_sales AS store_sales,
catalog_sales AS catalog_sales,
date_dim AS d3,
item AS item,
store_returns AS store_returns
WHERE (customer_demographics.cd_gender = 'F' AND customer_demographics.cd_marital_status = 'W' AND customer_demographics.cd_education_status = 'Advanced Degree' AND date_dim.d_year = 2002 AND store.s_state = 'IL' AND d3.d_moy BETWEEN 9 AND 9 + 2 AND d3.d_year = 1999 AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND catalog_sales.cs_sold_date_sk = d3.d_date_sk AND item.i_item_sk = store_sales.ss_item_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_sales.ss_item_sk = catalog_sales.cs_item_sk AND store_returns.sr_item_sk = item.i_item_sk AND item.i_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_bill_customer_sk = store_sales.ss_customer_sk)
 group by rollup(store.s_state) order by store.s_state LIMIT 100