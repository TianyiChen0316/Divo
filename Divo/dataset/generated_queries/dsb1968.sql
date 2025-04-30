--dsb_templates_generated-331c4192-b12a-4f9f-8fb7-cf8c95addf3f_27afb79a-99c4-3350-9f13-e3c0b5895077.sql
--{"gen": "erase", "time": 3.1181952953338623, "template": "generated-331c4192-b12a-4f9f-8fb7-cf8c95addf3f", "dataset": "dsb_templates", "rows": 1}
SELECT avg(customer.c_birth_year::numeric(12, 2)) AS agg6
FROM customer AS customer,
date_dim AS date_dim,
store AS store,
store_sales AS store_sales,
date_dim AS d1,
item AS item1,
store_sales AS s1,
store_sales AS s2
WHERE (customer.c_birth_month = 10 AND date_dim.d_year = 2002 AND store.s_state = 'MN' AND item1.i_category IN ('Jewelry', 'Men') AND s1.ss_list_price BETWEEN 180 AND 194 AND s2.ss_list_price BETWEEN 258 AND 272 AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND date_dim.d_date_sk = d1.d_date_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND customer.c_current_cdemo_sk = store_sales.ss_cdemo_sk AND d1.d_date_sk = s1.ss_sold_date_sk AND store_sales.ss_sold_date_sk = s1.ss_sold_date_sk)
 LIMIT 100