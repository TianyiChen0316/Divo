--dsb_templates_generated-5dbf88a3-e44c-4542-8acf-e39f84549653_dd728bdc-df06-3fcd-b573-db74a9b2457e.sql
--{"gen": "combine", "time": 3.7927823066711426, "template": "generated-5dbf88a3-e44c-4542-8acf-e39f84549653", "dataset": "dsb_templates", "rows": 1}
SELECT avg(customer.c_birth_year::numeric(12, 2)) AS agg6
FROM customer AS customer,
date_dim AS date_dim,
store AS store,
store_sales AS store_sales,
date_dim AS d1,
store_returns AS store_returns,
item AS item1,
item AS item2,
store_sales AS s1,
store_sales AS s2,
customer_demographics AS customer_demographics,
item AS item,
date_dim AS d2,
catalog_sales AS catalog_sales,
date_dim AS d3
WHERE (customer.c_birth_month = 3 AND date_dim.d_year = 1999 AND store.s_state = 'IA' AND item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 32 AND 51 AND s1.ss_list_price BETWEEN 261 AND 275 AND s2.ss_list_price BETWEEN 279 AND 293 AND customer_demographics.cd_education_status = 'Advanced Degree' AND customer_demographics.cd_gender = 'F' AND customer_demographics.cd_marital_status = 'U' AND item.i_category = 'Electronics' AND d2.d_moy = 8 AND d2.d_year = 2001 AND d3.d_moy BETWEEN 2 AND 2 + 2 AND d3.d_year = 2002 AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND date_dim.d_date_sk = d1.d_date_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND customer.c_current_cdemo_sk = store_sales.ss_cdemo_sk AND d1.d_date_sk = s1.ss_sold_date_sk AND store_sales.ss_sold_date_sk = s1.ss_sold_date_sk AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_returns.sr_item_sk = item.i_item_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_sold_date_sk = d3.d_date_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND item1.i_item_sk < item2.i_item_sk AND d1.d_date BETWEEN d2.d_date - '120 day'::interval AND d2.d_date)
 LIMIT 100