--dsb_templates_generated-331c4192-b12a-4f9f-8fb7-cf8c95addf3f_adf3761f-ba7b-3fe2-a88a-407392b0dff2.sql
--{"gen": "combine", "time": 3.683227062225342, "template": "generated-331c4192-b12a-4f9f-8fb7-cf8c95addf3f", "dataset": "dsb_templates", "rows": 1}
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
item AS item
WHERE (customer.c_birth_month = 10 AND date_dim.d_year = 2002 AND store.s_state = 'MN' AND item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 18 AND 37 AND s1.ss_list_price BETWEEN 106 AND 120 AND s2.ss_list_price BETWEEN 38 AND 52 AND customer_demographics.cd_education_status = '2 yr Degree' AND customer_demographics.cd_gender = 'F' AND customer_demographics.cd_marital_status = 'D' AND item.i_category = 'Women' AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND date_dim.d_date_sk = d1.d_date_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND customer.c_current_cdemo_sk = store_sales.ss_cdemo_sk AND d1.d_date_sk = s1.ss_sold_date_sk AND store_sales.ss_sold_date_sk = s1.ss_sold_date_sk AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_returns.sr_item_sk = item.i_item_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND item1.i_item_sk < item2.i_item_sk)
 LIMIT 100